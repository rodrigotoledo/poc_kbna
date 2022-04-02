# PocKbna

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/poc_kbna`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'poc_kbna'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install poc_kbna

## Usage

### Setup the environment variables

```
POC_KBNA_ENV
POC_KBNA_TOKEN
POC_KBNA_USER_AGENT
POC_KBNA_PIX_ACCOUNT_ID
```

and in your initializer

```
PocKbna.configure do |config|
  config.env            = 'sandbox' # or production
  config.token          = 'you_token'
  config.user_agent     = 'you_user_agent'
  config.pix_account_id = 'you_pix_account_id'
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rodrigotoledo/poc_kbna.
