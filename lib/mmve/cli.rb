module MMVE
  class CLI < Baf::CLI
    USAGE = "Usage: #{File.basename $0} path [path ...]".freeze

    def initialize env, arguments, **opts
      super
      @editor   = opts[:editor] || Editor.new(ENV['EDITOR'])
      @renamer  = opts[:renamer] || Renamer.new
    end

    def setup
      banner USAGE
      flag_version MMVE::VERSION
    end

    def run
      usage! unless arguments.any?
      renamer.rename arguments, editor.edit(arguments)
    end

  private

    attr_reader :editor, :renamer
  end
end
