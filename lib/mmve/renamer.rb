module MMVE
  class Renamer
    attr_reader :sources
    attr_writer :destinations

    def initialize(paths)
      @sources      = paths
      @destinations = @sources.dup
    end

    def execute!
      [@sources, @destinations].transpose.each do |e|
        File.rename(*e) if e.uniq.count == 2
      end
    end
  end
end
