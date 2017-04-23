module MMVE
  class Renamer
    attr_reader :sources
    attr_accessor :destinations

    def initialize paths, file: File
      @sources      = paths
      @destinations = @sources.dup
      @file         = file
    end

    def execute!
      [@sources, @destinations].transpose.each do |e|
        file.rename *e if e.uniq.count == 2
      end
    end

  private

    attr_reader :file
  end
end
