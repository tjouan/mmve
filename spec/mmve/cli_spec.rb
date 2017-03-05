RSpec.describe MMVE::CLI do
  include ExitHelpers

  let(:arguments) { %i[some arguments] }
  let(:stdout)    { StringIO.new }
  subject(:cli)   { described_class.new arguments, stdout }

  describe '#run!' do
    it 'edits the renamer source paths' do
      renamer = double('renamer').as_null_object
      allow(cli).to receive(:renamer) { renamer }
      expect(cli.editor)
        .to receive(:edit)
        .with cli.renamer.sources
      cli.run!
    end

    it 'assigns the edited source paths as the renamer destination paths' do
      editor = double 'editor'
      allow(cli).to receive(:editor) { editor }
      allow(editor).to receive(:edit) { arguments }
      expect(cli.renamer)
        .to receive(:destinations=)
        .with arguments
      cli.run!
    end

    it 'executes the renamer' do
      editor = double('editor').as_null_object
      allow(cli).to receive(:editor) { editor }
      expect(cli.renamer).to receive :execute!
      cli.run!
    end

    context 'when one of the arguments is -h' do
      let(:arguments) { %w[-h] }

      it 'prints the usage' do
        trap_exit { cli.run! }
        expect(stdout.string).to eq <<-eoh
Usage: rspec [ path ... ]
        eoh
      end

      it 'exits successfully' do
        expect { cli.run! }.to raise_error SystemExit do |e|
          expect(e.status).to be 0
        end
      end
    end
  end
end
