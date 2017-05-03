# Roh - Response Object HTTP for Ruby

Response Object for your HTTP calls returning sensible default in case of errors based on John Nunemaker article https://johnnunemaker.com/resilience-in-ruby/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roh', github: 'equivalent/roh'
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

roh = Roh.new do
  request = Net::HTTP::Get.new("/")
  http = Net::HTTP.new("localhost", 9999)
  response = http.request(request)
  JSON.parse(response.body)
end

roh = roh.ok? # is the response real ? or is it fake data returned on error ?
roh.result  # => { ... } 
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

roh = Roh.new do
  JSON.parse(HTTParty.get('https://my.website.com/api/users.json').body)
end
roh = roh.ok? # is the response real ? or is it fake data returned on error ?
roh.result
```

## Common issues

* use `do .. end` not ` { } ` (braces) syntax of Ruby block as `{}` has
different presedence http://stackoverflow.com/a/5587403/473040
* block needs to be result you 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/equivalent/roh
