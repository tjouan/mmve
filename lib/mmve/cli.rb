module MMVE
  class CLI < Baf::CLI
    USAGE = "Usage: #{File.basename $0} [ path ... ]".freeze

    def setup
      banner USAGE
      flag_version MMVE::VERSION
    end

    def run
      renamer.destinations = editor.edit renamer.sources
      renamer.execute!
    end

    def editor
      @editor ||= Editor.new ENV['EDITOR']
    end

    def renamer
      @renamer ||= Renamer.new arguments
    end
  end
end
