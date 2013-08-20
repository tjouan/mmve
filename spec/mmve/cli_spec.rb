require 'spec_helper'

describe MMVE::CLI do
  include ExitHelpers

  let(:arguments) { [:some, :arguments] }
  let(:stdout)    { StringIO.new }
  subject(:cli)   { MMVE::CLI.new(arguments, stdout) }

  describe '#initialize' do
    it 'assigns the arguments' do
      expect(cli.instance_eval { @arguments }).to eq arguments
    end

    it 'assigns the standard output' do
      expect(cli.instance_eval { @stdout }).to eq stdout
    end

    context 'when no stdout is specified' do
      subject(:cli) { MMVE::CLI.new(arguments) }

      it 'assigns $stdout as a default standard output' do
        expect(cli.instance_eval { @stdout }).to be $stdout
      end
    end
  end

  describe '#run!' do
    it 'edits the renamer source paths' do
      renamer = double('renamer').as_null_object
      allow(cli).to receive(:renamer) { renamer }
      expect(cli.editor).to receive(:edit).with(cli.renamer.sources)
      cli.run!
    end

    it 'assigns the edited source paths as the renamer destination paths' do
      editor = double('editor')
      allow(cli).to receive(:editor) { editor }
      allow(editor).to receive(:edit) { arguments }
      expect(cli.renamer).to receive(:destinations=).with(arguments)
      cli.run!
    end

    it 'executes the renamer' do
      editor = double('editor').as_null_object
      allow(cli).to receive(:editor) { editor }
      expect(cli.renamer).to receive(:execute!)
      cli.run!
    end

    context 'when one of the arguments is -h' do
      let(:arguments) { %w[-h] }

      it 'prints the usage' do
        trap_exit { cli.run! }
        expect(stdout.string).to eq MMVE::CLI::USAGE + "\n"
      end

      it 'exits successfully' do
        expect { cli.run! }.to raise_error(SystemExit) do |e|
          expect(e.code).to be 0
        end
      end
    end
  end

  describe '#editor' do
    it 'builds an editor with current $EDITOR' do
      expect(MMVE::Editor).to receive(:new).with(ENV['EDITOR'])
      cli.editor
    end

    it 'returns the editor' do
      editor = double('editor')
      allow(MMVE::Editor).to receive(:new) { editor }
      expect(cli.editor).to be editor
    end
  end

  describe '#renamer' do
    it 'builds a renamer with the paths given as argument' do
      expect(MMVE::Renamer).to receive(:new).with(arguments)
      cli.renamer
    end

    it 'returns the renamer' do
      renamer = double('renamer')
      allow(MMVE::Renamer).to receive(:new) { renamer }
      expect(cli.renamer).to be renamer
    end
  end
end
