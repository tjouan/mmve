RSpec.describe MMVE::Renamer do
  let(:sources)       { %w[some_path other_path] }
  let(:destinations)  { %w[renamed_path other_path] }
  subject(:renamer)   { described_class.new sources }

  describe '#initialize' do
    it 'assigns the source paths' do
      expect(renamer.instance_eval { @sources }).to eq sources
    end

    it 'assigns destination paths equivalent to source paths' do
      expect(renamer.instance_eval { @destinations }).to eq sources
    end

    it 'copies the assignated destinations paths' do
      expect(renamer.instance_eval { @destinations }).not_to be sources
    end
  end

  describe '#sources' do
    it 'returns the source paths' do
      expect(renamer.sources).to eq sources
    end
  end

  describe '#destinations=' do
    it 'assigns the destination paths' do
      renamer.destinations = destinations
      expect(renamer.instance_eval { @destinations }).to eq destinations
    end
  end

  describe '#execute!' do
    context 'when destinations differs from sources' do
      before do
        renamer.destinations = destinations
      end

      it 'renames the sources to the destinations' do
        expect(File)
          .to receive(:rename)
          .with sources.first, destinations.first
        renamer.execute!
      end
    end

    context 'when destinations are the same as sources' do
      let(:destinations) { sources }

      it 'renames nothing' do
        expect(File).not_to receive :rename
        renamer.execute!
      end
    end
  end
end
