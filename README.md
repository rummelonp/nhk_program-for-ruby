# NHKProgram

[![Build Status](https://travis-ci.org/mitukiii/nhk_program-for-ruby.png?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/mitukiii/nhk_program-for-ruby.png)][codeclimate]
[![Dependency Status](https://gemnasium.com/mitukiii/nhk_program-for-ruby.png?travis)][gemnasium]

[travis]: https://travis-ci.org/mitukiii/nhk_program-for-ruby
[codeclimate]: https://codeclimate.com/github/mitukiii/nhk_program-for-ruby
[gemnasium]: https://gemnasium.com/mitukiii/nhk_program-for-ruby

A Ruby wrapper for the NHK Program API

## Installation

Add this line to your application's Gemfile:

    gem 'nhk_program'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nhk_program

## Usage

```ruby
client = NHKProgram.new(api_key: 'YOUR_API_KEY')

# Ger tomorrow program list
list = client.list('130', 'g1', Date.today + 1)
# another way
# list = client.list('東京', 'ＮＨＫ総合１', :tomorrow)

# Get tomorrow program list of specify genre
genre = client.genre('130', 'g1', '0700', Date.today + 1)
# another way
# genre = client.genre('東京', 'ＮＨＫ総合１', 'アニメ／特撮(国内アニメ)', :tomorrow)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2014 [Kazuya Takeshima](mailto:mail@mitukiii.jp). See [LICENSE][license] for details.

[license]: LICENSE.md
