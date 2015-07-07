# Cheatsheets for Dash App

My personal cheatsheets for the [Dash App](https://kapeli.com/dash).

[![Build Status](https://travis-ci.org/rkoch/dash-cheatsheets.svg)](https://travis-ci.org/rkoch/dash-cheatsheets)

## Installation

* Clone this repo to your local disk
* In Dash: `Settings` > `Docsets` > `+`
* Navigate to the working directory and select the cheatsheet you want
  to import in the `build` folder.

## Update cheatsheets

* Pull all changes into your local working copy
* In Dash: `Settings` > `Docsets` > `Rescan`

## Available cheatsheets so far

* `vim-sexp`

## Build

* Install `cheatseet` as per [documentation](https://github.com/Kapeli/cheatset#readme)
* Build the changed cheatsheet:

  ```sh
  > cd build/
  > cheatset generate ../cheatsheets/<changed-cheatsheet>.rb
  > # commit and push
  ```

## TODO

* Set up automated travis build

## License

MIT.
