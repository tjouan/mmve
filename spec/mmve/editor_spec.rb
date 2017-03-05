RSpec.describe MMVE::Editor do
  let(:editor_command)  { 'some editor command' }
  subject(:editor)      { MMVE::Editor.new(editor_command) }

  describe '#initialize' do
    it 'assigns the editor command' do
      expect(editor.instance_eval { @editor_command }).to eq editor_command
    end
  end

  describe '#edit' do
    let(:paths)     { %w[some_path other_path] }
    let(:paths_str) { paths * "\n" + "\n" }

    it 'creates a temporary file with the paths as content' do
      expect(editor)
        .to receive(:with_temp_file).with(paths_str).and_return(paths_str)
      editor.edit(paths)
    end

    it 'sends the edit_file message with the temporary file' do
      expect(editor).to receive(:edit_file).with(any_args())
      editor.edit(paths)
    end

    it 'returns the edited file paths as a list' do
      allow(editor).to receive(:with_temp_file) { paths_str }
      expect(editor.edit(paths)).to eq paths
    end
  end

  describe '#with_temp_file' do
    let(:content) { "some_content\n" }

    it 'opens a temporary file' do
      expect(Tempfile).to receive(:open).with('rspec_')
      editor.with_temp_file(content) { }
    end

    it 'it writes the content to the file' do
      file = double('file').as_null_object
      allow(Tempfile).to receive(:open).and_yield(file)
      expect(file).to receive(:write).with(content)
      editor.with_temp_file(content) { }
    end

    it 'yields the block with the file as argument' do
      file = double('file').as_null_object
      allow(Tempfile).to receive(:open).and_yield(file)
      expect { |b| editor.with_temp_file(content, &b) }.to yield_with_args(file)
    end

    it 'returns the temporary file content after yielding the block' do
      new_content = "new_content\n"
      expect(
        editor.with_temp_file(content) { |f| File.write f.path, new_content }
      ).to eq new_content
    end
  end

  describe '#edit_file' do
    let(:file) { double('file', path: 'some_path') }

    it 'executes the editor command with the file path as argument' do
      expect(editor).to receive(:system).with(*editor_command.split, file.path)
      editor.edit_file(file)
    end
  end
end
