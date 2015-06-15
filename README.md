[![Build Status](https://travis-ci.org/svarlet/minesweeper.svg?branch=master)](https://travis-ci.org/svarlet/minesweeper)
[![Coverage Status](https://coveralls.io/repos/svarlet/minesweeper/badge.svg?branch=master)](https://coveralls.io/r/svarlet/minesweeper?branch=master)

# Minesweeper

The rules of the minesweeper game are explained there: http://en.wikipedia.org/wiki/Minesweeper_(video_game).

This repository contains a ruby gem that defines the core concepts of a 2D minesweeper game: minefield, cells, mines and the user interactions with the minefield (reveal, flag, unflag). 

Therefore, this gem is not a playable version of the game but if you want to try it, I also built a [terminal frontend](https://github.com/svarlet/minesweeper-console) which uses it.

## Install

```
spec.add_runtime_dependencty "minesweeper-core", "~> 2.0.0"
```

## Usage

An example of the usage of this library can be found in my terminal based implementation of this game: [svarlet/minesweeper-console](https://github.com/svarlet/minesweeper-console).

