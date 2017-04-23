RSpec.describe MMVE::Renamer do
  let(:sources)       { %w[some_path other_path] }
  let(:destinations)  { %w[renamed_path other_path] }
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
        .with sources.first, destinations.first
      renamer.execute!
    end

    context 'when destinations are the same as sources' do
      let(:destinations) { sources }

      it 'renames nothing' do
        expect(file).not_to receive :rename
        renamer.execute!
      end
    end
  end
end
