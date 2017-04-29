module MMVE
  class Renamer
    def initialize file: File
      @file = file
    end

    def rename sources, destinations
      [sources, destinations].transpose.each do |e|
        next if e.uniq.size == 1
        fail DestructiveRename if sources.include?(e[1]) || file.exist?(e[1])
        file.rename *e
      end
    end

  private

    attr_reader :file
  end
end
