# RSpec KeyValue

[![Build Status](https://travis-ci.org/MrSenko/rspec_key_value.svg?branch=master)](https://travis-ci.org/MrSenko/rspec_key_value)

A simple key:value formatter for rspec.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec_key_value'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec_key_value

## Usage

```bash
bundle exec rspec -f RspecKeyValue::Formatter
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MrSenko/rspec_key_value.
