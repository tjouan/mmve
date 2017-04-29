RSpec.describe MMVE::CLI do
  include ExitHelpers

  let(:env)       { double 'env' }
  let(:arguments) { %w[some arguments] }
  let(:editor)    { double 'editor' }
  let(:renamer)   { double 'renamer' }
  let(:options)   { { editor: editor, renamer: renamer } }
  subject(:cli)   { described_class.new env, arguments, options }

  describe '#run' do
    it 'tells the editor to edit given arguments' do
      expect(editor).to receive(:edit).with arguments
      allow(renamer).to receive :rename
      cli.run
    end

    it 'tells the renamer to rename given arguments to edited ones' do
      allow(editor).to receive :edit do
        %w[renamed arguments]
      end
      expect(renamer)
        .to receive(:rename).with arguments, %w[renamed arguments]
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
