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
        next if e.uniq.size == 1
        fail DestructiveRename if @sources.include?(e[1]) || file.exist?(e[1])
        file.rename *e
      end
    end

  private

    attr_reader :file
  end
end
