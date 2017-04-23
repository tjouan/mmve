Feature: Rename files

  Background:
    Given the following files exists:
      | some_file     |
      | another_file  |

  Scenario: renames files given as arguments when the editor modify file paths
    Given my editor is "ed"
    When I start the program with arguments some_file another_file
    And I input "%s/some/renamed/\n"
    And I input "wq\n"
    Then the exit status must be 0
    And the following files must exist:
      | renamed_file |
      | another_file |
    And the file some_file must not exist
