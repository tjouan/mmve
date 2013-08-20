require 'spec_helper'

describe MMVE::CLI do
  let(:arguments) { [:some, :arguments] }
  subject(:cli)   { MMVE::CLI.new(arguments) }

  describe '#initialize' do
    it 'assigns the arguments' do
      expect(cli.instance_eval { @arguments }).to eq arguments
    end
  end

  describe '#run' do
    it 'does something'
  end
end
