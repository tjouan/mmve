module MMVE
  class Renamer
    def initialize file: File
      @file = file
    end

    def rename sources, destinations
      fail DestinationEntriesMismatch if sources.size != destinations.size
      [sources, destinations].transpose.each do |paths|
        src, dst = paths
        next if src == dst
        fail DestructiveRename if sources.include? dst
        fail DestructiveRename if file.exist? dst
        file.rename *paths
      end
    end

  private

    attr_reader :file
  end
end
