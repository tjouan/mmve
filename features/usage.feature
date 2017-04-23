Feature: CLI usage

  Scenario: prints the usage when -h argument is given
    When I run the program with argument -h
    Then the output must contain exactly:
      """
      Usage: mmve [ path ... ]

      options:

          -h, --help                       print this message
          -V, --version                    print version
      """
