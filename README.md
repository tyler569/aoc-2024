# Advent of Code 2024 Solutions

This repository contains solutions to the
[Advent of Code 2024](https://adventofcode.com/2024) challenges, along
with a utility script for fetching and caching input data.

## Setup

### Prerequisites

- Ruby installed on your system
- [Bundler](https://bundler.io/) for managing Ruby dependencies
- An Advent of Code session token. You can find your session
token in your browser's cookies after logging in to
[Advent of Code](https://adventofcode.com). Set it as an environment variable:

```bash
export AOC_SESSION=<your_session_token>
```

### Installing Dependencies

Run the following command to install dependencies:

```bash
bundle install
```

## Running Solutions

Run any solution script using Ruby:

```bash
ruby 01.rb
```

## Running Tests

Tests are written using RSpec. Run the tests with:

```bash
bundle exec rspec 01-spec.rb
```

## Caching

Input data is cached in `~/.cache/aoc/<year>/<day>`. If the input for a
specific day is already cached, the utility will fetch it from the cache
instead of making a network request.
