require 'fileutils'

RSpec.describe MMVE::Renamer do
  let(:sources)       { %w[some_path other_path] }
  let(:destinations)  { %w[renamed_path other_renamed_path] }
  let(:file)          { File }
  subject(:renamer)   { described_class.new file: File }

  describe '#rename' do
    it 'renames the sources to the destinations' do
      expect(file)
        .to receive(:rename)
        .once
        .ordered
        .with sources[0], destinations[0]
      expect(file)
        .to receive(:rename)
        .once
        .ordered
        .with sources[1], destinations[1]
      renamer.rename sources, destinations
    end

    context 'when destinations are the same as sources' do
      it 'renames nothing' do
        expect(file).not_to receive :rename
        renamer.rename sources, sources.dup
      end
    end

    context 'when a destination would overwrite a source' do
      let(:destinations)  { %w[other_path other_renamed_path] }

      it 'raises an error' do
        expect { renamer.rename sources, destinations }
          .to raise_error MMVE::DestructiveRename
      end
    end

    context 'when a destination would overwrite an existing entry' do
      it 'raises an error' do
        Dir.mktmpdir 'mmve-spec-' do |dir|
          Dir.chdir dir do
            FileUtils.touch destinations[0]
            expect { renamer.rename sources, destinations }
              .to raise_error MMVE::DestructiveRename
          end
        end
      end
    end

    context 'when given entries count does not match source entries count' do
      it 'raises an error' do
        expect { renamer.rename sources, %w[foo] }
          .to raise_error MMVE::DestinationEntriesMismatch
      end
    end
  end
end
