# Roh - Response Object HTTP for Ruby

Response Object for your HTTP calls returning sensible default in case of errors based on John Nunemaker article https://johnnunemaker.com/resilience-in-ruby/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roh

## Usage

Net HTTP example:

```ruby
require "net/http"
require "json"

Roh.new do
  request = Net::HTTP::Get.new("/")
  http = Net::HTTP.new("localhost", 9999)
  response = http.request(request)
  JSON.parse(response.body)
end
```

HTTParty exapmle:

```ruby
#Gemfile
# ...
gem 'httparty'
gem 'roh'
# ...
```

```ruby
require "httparty"  # you need to install gem httparty
require "json"

Roh.new do
  JSON.parse(HTTParty.new('https://my.website.com/api/users.json').body)
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/equivalent/roh
