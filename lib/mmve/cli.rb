module MMVE
  class CLI
    USAGE = "Usage: #{File.basename $0} [ path ... ]"

    def initialize(arguments, stdout = $stdout)
      @arguments  = arguments
      @stdout     = stdout
    end

    def run!
      print_usage_and_exit if @arguments.include? '-h'
    end

    private

    def print_usage_and_exit
      @stdout.puts USAGE
      exit
    end
  end
end
