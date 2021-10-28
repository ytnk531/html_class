# HtmlClass

Provides dynamic html class addition.
`HtmlClass::Base` provides class name formatting for HTML class element.
This gem can reduce complex class name generation codes in view templates of Ruby on Rails applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'html_class'
```

And then execute:

    $ bundle install

## Usage
Generate `HtmlClass::Base` instance with static and dynamic class name, and then get class names formatted for HTML's class element by using `to_s` method.

```ruby
HtmlClass::Base.new(:banner, :bold).to_s # => "banner bold"
```

Arguments for `HtmlClass::Base` receives dynamic class with keyword argument.
Pass the dynamic class name as key and a Proc object returns `true` when the class should be active as value.

```ruby
html_class = HtmlClass::Base.new(:banner, 'banner--active': -> { banner_val > 4 })

banner_val = 10
html_class.to_s # => "banner banner--active"

banner_val = 1
html_class.to_s # => "banner"
```

With actionview and erb, we can write a menu element activated in specific route like the syntax below.
```erb
<%= link_to 'Send Mail', class: HtmlClass::Base.new(:banner, 'banner--active': -> { controller_name == "contants" }).to_s %>
```

`HtmlClass::Dsl` provides useful shorthands.
`html_class()` method generates class names directly.


```ruby
HtmlClass::Base.new(:banner, :bold).to_s # => "banner bold"

include HtmlClass::Dsl
html_class(:banner, :bold) # => "banner bold"
```

In Ruby on Rails, configure Controller class to use this suntax.

```ruby
# In application controller
module ApplicationHelper
  include HtmlClass::Dsl
end
```

```erb
<%# View Template %>
<%= link_to 'Send Mail', class: html_class(:banner, 'banner--active': -> { controller_name == "contants" }) %>
```

When use `static` as Proc, the class name is always enabled. This is useful when we need to put the static class name after the dynamic class name.

```ruby
include HtmlClass::Dsl
html_class(banner: -> { a == b}, bold: static) # => "banner bold"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/html_class. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/html_class/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HtmlClass project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/html_class/blob/master/CODE_OF_CONDUCT.md).
