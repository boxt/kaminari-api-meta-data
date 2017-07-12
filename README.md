# Kaminari API Meta Data

A gem for adding [Kaminari](https://github.com/kaminari/kaminari) collection meta data to your API responses that matches the format that works with the Kaminari [`paginate`](https://github.com/kaminari/kaminari#the-paginate-helper-method) helper method.

[![Gem Version](https://badge.fury.io/rb/kaminari-api-meta-data.svg)](https://badge.fury.io/rb/kaminari-api-meta-data)
[![Build Status](https://travis-ci.org/sleepingstu/kaminari-api-meta-data.svg?branch=master)](https://travis-ci.org/sleepingstu/kaminari-api-meta-data)


## Installation

Add this line to your application's Gemfile:

```ruby
gem "kaminari-api-meta-data", require: "kaminari_api_meta_data"
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install kaminari-api-meta-data
```

and then add `require "kaminari_api_meta_data"` to your Ruby file(s)

## Usage

Add the include to your class, in this example using the `ApplicationController` from a Rails API project.

```ruby
class ApplicationController < ActionController::API

  include ::KaminariApiMetaData

  # ...
end
```

Then in a controller method use something like:

```ruby
def index
  @things = Thing.unscoped.page(params[:page]).per(20)

  render json: @things, root: :things, meta: meta_data(@things)
end
```

This will return JSON like so:

```json
{
  "things": [],
  "meta": {
    "current_page": 1,
    "next_page": 2,
    "per_page": 20,
    "prev_page": null,
    "total_pages": 5,
    "total_count": 91
  }
}
```

### Additional Meta Data

It is possible to extend the meta data returned by providing an optional Hash of properties to the `meta_data` method.

```ruby
meta = meta_data(@things, foo: "bar")
puts meta
# {
#   current_page: 1,
#   next_page: 2,
#   per_page: 20,
#   prev_page: nil,
#   total_pages: 5,
#   total_count: 91,
#   foo: "bar"
# }
```

## Contributing

* Check out the latest master and/or develop branches to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch off of develop (using Git Flow approach)
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally
* When you are done generate a pull request
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
