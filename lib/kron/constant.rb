module Kron
  # DIRECTORY PATHS
  BASE_DIR = Dir.pwd + '/'
  WORKING_DIR = BASE_DIR
  KRON_DIR = "#{BASE_DIR}.kron/".freeze
  MANIFEST_DIR = "#{KRON_DIR}manifest/".freeze
  CHANGESET_DIR = "#{KRON_DIR}changeset/".freeze
  OBJECTS_DIR = "#{KRON_DIR}objects/".freeze
  STAGE_DIR = "#{OBJECTS_DIR}stage/".freeze

  # FILE_PATHS
  CONFIG_PATH = "#{KRON_DIR}config".freeze
  INDEX_PATH = "#{KRON_DIR}index".freeze
  STAGE_PATH = "#{KRON_DIR}stage".freeze
  REV_PATH = "#{KRON_DIR}rev".freeze
  IGNORE_PATH = "#{WORKING_DIR}.kronignore".freeze

  # REVISION ABBREV LENGTH
  MINIMUM_ABBREV = 4
  DEFAULT_ABBREV = 7

  # SERVER TOKEN LENGTH
  DEFAULT_TOKEN = 4
end
