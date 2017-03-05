module MMVE
  class CLI
    USAGE = "Usage: #{File.basename $0} [ path ... ]".freeze

    def initialize(arguments, stdout = $stdout)
      @arguments  = arguments
      @stdout     = stdout
    end

    def run!
      print_usage_and_exit if @arguments.include? '-h'
      renamer.destinations = editor.edit renamer.sources
      renamer.execute!
    end

    def editor
      @editor ||= Editor.new(ENV['EDITOR'])
    end

    def renamer
      @renamer ||= Renamer.new(@arguments)
    end

    private

    def print_usage_and_exit
      @stdout.puts USAGE
      exit
    end
  end
end
