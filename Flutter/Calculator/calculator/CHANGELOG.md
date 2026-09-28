# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog]
(https://keepachangelog.com/en/2.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2026-09-28

0.3.0 is the second minor revision focused on proper project documentation, project structure, and project architecture. A second objective of this revision is to build a global theme for the app and condense code to drastically reduce redundant code and leverage Flutter theming and design systems.

### Added

- v0.3 Added new file '/calculator/lib/ui/theme/theme.dart' used to define the theme, display and text color schemes, and various common spacing values across the UI.
- v0.3.1 New file '/calculator/CHANGELOG.md' in an effort to practice proper documentation and file logging.
- v0.3.1 Retroactively creating change log entries for the project based on commit messages, code changes and notes.
- v0.3 Added new file '/calculator/lib/ui/widgets/btnMatrix.dart' for button matrix widget development and management.

### Changed

- v0.3 Restructuring project to encourage better file mangement and ease of development.

## [0.2.7] - 2026-08-20

### Fixed

- v0.2 Fixed shifting UI bug as display text grows longer.

## [0.2.6] - 2026-04-28

### Added

- v0.2 Added parenthesis insertion and evaluation
- v0.2 Added display text widget that dynamically changes the font size as the string gets longer.

### Added

## [0.2.5] - 2026-04-10

### Added

- v0.2 Added new method to '/calculator/lib/ui/calculator.dart' named 'isOperator(String character)' which checks if a given character is a mathematical operator.

## Fixed

- v0.2 Fixed a bug where floating point values entered into the display were not properly evaluated by the expression tree.

## [0.2.4] - 2026-03-31

### Changed

- v0.2 Changed '/calculator/lib/ui/calculator.dart' a previous history button intended for access of the history widge has been changed to insert parentheses into the expression.

## [0.2.3] - 2026-03-21

### Added

- v0.2 Added new file '/calculator/lib/ui/history.dart' planned to enable storage and viewing of previous calculations

## [0.2.2] - 2026-03-20

### Added

- v0.2 Added new file '/calculator/lib/services/node.dart' to define a calculator tree node with a data field and left and right children. A node also has an 'isLeaf()' method which checks if the node is a leaf on the tree.
- v0.2 Added expression tree generation and evaluation functionalities.
- v0.2 Added new dependency for stack to enable expression tree generation.

### Changed

- v0.2 Modified file '/calculator/lib/ui/calculator.dart' method 'updateDisplayText(String newCharacter)' to accommodate expression tree functionality and display text updating with each button's respective character.

## [0.2.1] - 2026-03-18

### Added

- v0.2 Added new class in '/calculator/lib/services/calculator_tree.dart' named 'CalculatorTree' in preparation for implementation.

### Removed

- v0.2 Removed file '/calculator/lib/services/calculator_tree_interface.dart'.

## [0.2.0] - 2026-03-14

0.2.0 is the first minor feature release which enables the main calculation functionality of the app. Defines how the app processes expressions and evaluates addition, subtraction, multiplication, and division. This is done via the implementation of an expression tree, a form of binary tree having n - 1 nodes where each non leaf node holds an operator and each operator node has two children either holding another operator or a numerical value.

### Added

- v0.2 New file '/calculator/lib/services/calculator_tree.dart' to handle mathematical expression processing and result evaluation.
- v0.2 New variable in ''/calculator/lib/ui/calculator.dart' named 'currentDisplayText' to hold the string of characters to be displayed on the screen.
- v0.2 New variable in ''/calculator/lib/ui/calculator.dart' named 'result' in which a claculation result is stored.

## [0.1.1] - 2026-03-12

### Added

- v0.1 New file '/claculator/lib/ui/calculator.dart' to handle all ui updates for the calculator.
- v0.1 Created basic ui with expression and result display.
- v0.1 New package in pubspec file for provider dependency to enable state management.
- v0.1 New class in '/calculator/lib/ui/calculator.dart' named '_CalculatorState' to track and mange the calculator's state.

### Changed

- v0.1 Modified '/calculator/main.dart' to enter '/calculator/lib/ui/calculator.dart' on startup.
- v0.1 Modified '/calculator/lib/ui/calculator.dart' to enable number pad, operator, clear and backspace button functionality.
- v0.1 Modified '/calculator/lib/ui/calculator.dart' 'Calculator' widget to a Statelful Widget to enable state management.
- v0.1 Modified '/calculator/lib/ui/calculator.dart' functionality of various methods and widgets to incorporate ChangeNotifier to leverage the provider package
- v0.1 Modified '/calculator/lib/ui/calculator.dart' display text padding for better look and feel.

## [0.1.0] - 2026-03-12

### Added

- v0.1 Initial project creation.