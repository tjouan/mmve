require 'fileutils'

RSpec.describe MMVE::Renamer do
  let(:sources)       { %w[some_path other_path] }
  let(:destinations)  { %w[renamed_path other_renamed_path] }
  let(:file)          { File }
  subject(:renamer)   { described_class.new sources, file: File }

  it 'assigns destination paths equivalent to source paths' do
    expect(renamer.destinations).to eq sources
  end

  it 'copies the assignated destinations paths' do
    expect(renamer.destinations).not_to be sources
  end

  describe '#execute!' do
    before { renamer.destinations = destinations }

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
      renamer.execute!
    end

    context 'when destinations are the same as sources' do
      let(:destinations) { sources }

      it 'renames nothing' do
        expect(file).not_to receive :rename
        renamer.execute!
      end
    end

    context 'when a destination would overwrite a source' do
      let(:destinations)  { %w[other_path other_renamed_path] }

      it 'raises an error' do
        expect { renamer.execute! }
          .to raise_error MMVE::DestructiveRename
      end
    end

    context 'when a destination would overwrite an existing entry' do
      it 'raises an error' do
        Dir.mktmpdir 'mmve-spec-' do |dir|
          Dir.chdir dir do
            FileUtils.touch destinations[0]
            expect { renamer.execute! }
              .to raise_error MMVE::DestructiveRename
          end
        end
      end
    end
  end
end
