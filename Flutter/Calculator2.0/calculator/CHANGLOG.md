# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog]
(https://keepachangelog.com/en/2.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- History page which holds previous expressions and their respective results.

## [0.2.0] - 2026-11-14

### Added

- v0.1 Expression tree generator and evaluator for calculating results and displaying them to the UI.
- v0.1 Repeatable operations via pressing '=' directly after evaluating an expression.

### Changed

- v0.1 Methods which are intended to be private to their classes have had their accessibility modified to increase security across classes.

## [0.1.4] - 2026-11-10

### Added

- v0.1 Display divider class to created divider lines to differentiate where the display text box is on the screen.
- v0.1 Calculator display which communicates with the calculator model to display the text of the current expression and/or equation.

### Changed

- v0.1 Ongoing modification of the app's theme values.

## [0.1.3] - 2026-11-5

### Added

- v0.1 Provider package to gain access to change notifier and change notifier provider.
- v0.1 Button matrix is fully functional, displaying to the UI and communicating with the app model.

### Changed

- v0.1 Changed top level widget from stateless to stateful widget to add change notifier provider and to create an app state class.

## [0.1.2.1] - 2026-11-02

### Added

- v0.1 Added linux development target in preparation for migration and switch to linux.

## [0.1.2] - 2026-10-27

### Added

- v0.1 Created the start of a calculator model to pass the data between the view model of the calculator and the expression tree generator/evaluator.
- v0.1 New file to contain the calculator display and the state of the calculator.

### Changed

- v0.1 Moved files related to the display ui of the calculator, such as the button matrix and the expression display into a new folder: ui/display/. This is where the view models and models will live for the display as well once they are written.

## [0.1.1] - 2026-10-24

### Added

- v0.1 Created the button matrix file and just copied the contents over from the last project, minus some currently unecessary import statements.
- v0.1 Created a global theme file, which is also copied from the previous project.

## [0.1.0] - 2026-10-19

A new project created to begin the project fresh and implement a recommended file and project structure to leverage proper Flutter programming conventions.

### Added

- v0.1 Initial project creation