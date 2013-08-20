Feature: Rename files

  Background:
    Given the following files exists:
      | some_file     |
      | another_file  |

  Scenario: renames files given as arguments when the editor modify file paths
    Given my editor is "ed"
    When I run `mmve some_file another_file` interactively
    And I type "%s/some/renamed/"
    And I type "wq"
    Then the exit status must be 0
    Then the following files must exist:
      | renamed_file |
      | another_file |
    And the file "some_file" must not exist
