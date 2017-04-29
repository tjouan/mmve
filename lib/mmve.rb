require 'baf/cli'

require 'mmve/cli'
require 'mmve/editor'
require 'mmve/renamer'
require 'mmve/version'

module MMVE
  Error                       = Class.new StandardError
  RuntimeError                = Class.new Error
  DestinationEntriesMismatch  = Class.new RuntimeError
  DestructiveRename           = Class.new RuntimeError
end
