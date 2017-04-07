# EaseHTTP

A ruby Net::HTTP stdlib wrapper for easy to use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ease_http'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ease_http

## Usage

We have a test sinatra app located in `test/web.rb`, start as our backend server:

```bash
# Start test sinatra app
ruby test/web.rb

# Start console
bin/console
```

### Get

```ruby
require 'json'
conn = EaseHTTP::Connection.new('http://localhost:4567')

# Get with 'query' option
res = conn.get '/', query: { hello: 'world' }
=> #<Net::HTTPOK 200 OK  readbody=true>
JSON.parse res.body
=> {"hello": "world"}

```

### Post

```ruby
require 'json'
conn = EaseHTTP::Connection.new('http://localhost:4567')

# Post with 'data' option as 'application/x-www-form-urlencoded'
res = conn.post '/', data: { hello: 'world' }
=> #<Net::HTTPCreated 201 Created  readbody=true>
JSON.parse res.body
=> {"hello": "world"}

# Post with 'data' option as 'multipart/form-data'
file = File.new '/etc/hosts'
res = conn.post '/', data: { hello: 'world', file: file }
=> #<Net::HTTPCreated 201 Created  readbody=true>
JSON.parse res.body
=> {"hello"=>"world",
 "file"=>
  {"filename"=>"hosts",
   "type"=>"text/plain",
   "name"=>"file",
   "tempfile"=>"#<File:0x0055d0877a8520>",
   "head"=>"Content-Disposition: form-data; name=\"file\"; filename=\"hosts\"\r\nContent-Type: text/plain\r\n"}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ease_http.

