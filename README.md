# Lughati Compiler

Lughati Compiler is a compiler for the Lughati programming language. Lughati is a high-level programming language designed for general-purpose programming, with an emphasis on readability and ease of use. It is designed by us as a part of our final project for the course "Compilers" at Cairo University. 

"Lughati" is an Arabic word (لغتي) that means "my language".

## Features

- Variables and constants declaration
- Mathematical and logical expressions
- Assignment statements
- If-then-else statement, while loops, repeat-until loops, for
loops, switch statement.
- Block structure (nested scopes where variables may be
declared at the beginning of blocks).
- Enums
- Functions


## Prerequisites

To use the Lughati Compiler, you will need to have the following installed on your system:
- [Lex](https://www.gnu.org/software/flex/) (The Fast Lexical Analyzer)
- [YACC](https://www.gnu.org/software/bison/) (Yet Another Compiler Compiler)
- [Make](https://www.gnu.org/software/make/) (A GNU tool which controls the generation of executables and other non-source files of a program from the program's source files)


## Building and Running

To build the Lughati Parser, run the following command:

```bash
make
```

This will generate the executable file `lughati-parser`. You can then run the parser by simply running the following command:

```bash
make run
```

You could specify to read the input from a file or whether to print the output to a file. For example, to read the input from the file `input.txt` and print the output to the file `output.txt`, you can run the following command:

```bash
make run INPUT_FILE=<input_file_path> OUTPUT_FILE=<output_file_path>
```
The input file path and the output file path are optional. If not specified, the parser will read the input from the standard input and print the output to the standard output.

## Running Tests

To run the tests, run the following command:

```bash
make run_tests
```

This will run all the tests in the `tests` directory. You could also specify to run a specific test by running the following command:

```bash
make run_test TEST_NAME=<test_name>
```

For example, to run the parser on the test in the file `tests/test1/input.txt`, you can run the following command:

```bash
make run_test TEST_NAME=test1
```

Note that the test file should be in the `tests` directory and should have the name `input.txt` and the expected output should be in the file `expected_output.txt`.


## Contributing

If you would like to contribute to Lughati Compiler, please fork this repository and submit a pull request. We welcome all contributions, including bug fixes, feature enhancements, and documentation improvements.

## License

Lughati Compiler is released under the MIT License. Feel free to use, modify, and distribute the code as you see fit.