[![Gem version](http://img.shields.io/gem/v/ddbuffer.svg)](http://rubygems.org/gems/ddbuffer)
[![Build status](http://img.shields.io/travis/ddfreyne/ddbuffer.svg)](https://travis-ci.org/ddfreyne/ddbuffer)
[![Code Climate](http://img.shields.io/codeclimate/github/ddfreyne/ddbuffer.svg)](https://codeclimate.com/github/ddfreyne/ddbuffer)
[![Code Coverage](https://img.shields.io/codecov/c/github/ddfreyne/ddbuffer.svg)](https://codecov.io/gh/ddfreyne/ddbuffer)

# DDBuffer

Provides a way to buffer Ruby enumerables/enumerators.

This is particularly useful when reading from a slow source and reading to a slow sink, because the two will be able to work concurrently. For example:

```ruby
# Read articles (an Enumerator)
articles = my_web_service.each_article

# Buffer 100 articles at a time
articles = DDBuffer.new(100).call(articles)

# Write buffered articles
articles.each_slice(50) do |slice|
  my_slow_db.insert_articles(slice)
end
```

## Usage

To install, add the `ddbuffer` gem to your Gemfile, and run `bundle`.

To buffer an enumerable `enum` with a buffer size of `size`:

```ruby
buffered_enum = DDBuffer.new(size).call(enum)
```

## Development

To run the tests:

```
bundle install
bundle exec rake
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ddfreyne/ddbuffer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DDBuffer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ddfreyne/ddbuffer/blob/master/CODE_OF_CONDUCT.md).
