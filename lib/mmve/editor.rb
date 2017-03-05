require 'tempfile'

module MMVE
  class Editor
    def initialize editor_command
      @editor_command = editor_command
    end

    def edit paths
      edited_content = with_temp_file(paths * $/ + $/) { |f| edit_file f }
      edited_content.split $/
    end

    def with_temp_file content
      content_after = ''
      Tempfile.open File.basename $0 + ?_ do |f|
        f.write content
        f.rewind
        yield f
        content_after = f.read
      end
      content_after
    end

    def edit_file file
      system *@editor_command.split, file.path
    end
  end
end
