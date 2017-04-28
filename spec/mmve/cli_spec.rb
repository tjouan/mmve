RSpec.describe MMVE::CLI do
  include ExitHelpers

  let(:env)       { double 'env' }
  let(:arguments) { %i[some arguments] }
  subject(:cli)   { described_class.new env, arguments }

  describe '#run' do
    it 'edits the renamer source paths' do
      renamer = double('renamer').as_null_object
      allow(cli).to receive(:renamer) { renamer }
      expect(cli.editor)
        .to receive(:edit)
        .with cli.renamer.sources
      cli.run
    end

    it 'assigns the edited source paths as the renamer destination paths' do
      editor = double 'editor'
      allow(cli).to receive(:editor) { editor }
      allow(editor).to receive(:edit) { arguments }
      expect(cli.renamer)
        .to receive(:destinations=)
        .with arguments
      cli.run
    end

    it 'executes the renamer' do
      editor = double('editor').as_null_object
      allow(cli).to receive(:editor) { editor }
      expect(cli.renamer).to receive :execute!
      cli.run
    end

    context 'when no argument is given' do
      let(:arguments) { [] }

      it 'raises an ArgumentError' do
        expect { cli.run }
          .to raise_error MMVE::CLI::ArgumentError
      end
    end
  end
end
