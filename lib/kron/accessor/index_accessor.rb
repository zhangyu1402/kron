require_relative '../../kron/constant'
require_relative '../domain/index'
require 'zlib'
require 'fileutils'

module Kron
  module Accessor
    module IndexAccessor

      def init_dir(overwrite = false)
        raise StandardError, 'directory \'index\' already exists' if !overwrite && Dir.exist?(INDEX_DIR)

        FileUtils.mkdir_p INDEX_DIR
      end

      def remove_dir
        FileUtils.remove_dir INDEX_DIR, true
      end

      def load_index(revid)
        idx = Kron::Domain::Index.new(revid)

        src = File.join(INDEX_DIR, rev_id)
        return nil unless File.file? src

        Zlib::Inflate.inflate(File.read(src)).each_line do |line|
          idx.put(row.chop.reverse.split(' ', 5).map(&:reverse).reverse)
        end
        idx
      end

      def sync_index(idx)
        s_buf = StringIO.new
        idx.each_pair { |path, attr| s_buf << "#{path} #{attr * ' '}\n" }
        dst = File.join(MANIFEST_DIR, idx.rev_id)
        File.open(dst, 'w+') { |f| f.write(Zlib::Deflate.deflate(s_buf.string)) }
      end
    end
  end
end