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
    it 'does something' do
      cli.run!
      pending
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
end
