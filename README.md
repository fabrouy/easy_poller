# Easy Poller [![Build Status](https://travis-ci.org/fabrouy/easy_poller.svg?branch=master)](https://travis-ci.org/fabrouy/easy_poller)

Very simple helper to poll for changes. Just give it an URL and voila.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_poller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_poller


## Usage

In `application.js`, add:

```js
//= require easy_poller
```

Add a polling container.

```erb
<%= easy_poller count_users_path %>
```

This will create something like this and start polling for changes to the given URL. Container's inner html will be replaced with your endpoint's response.

```html
<div class="easy_poller" data-poll="true" data-interval="3000" data-url="/users/count"></div>
```

Now make your controller return something useful.

```ruby
class UsersController < ApplicationController
  def count
    render text: User.count
  end
end
```

That's it!

### Options

Poll every 10 seconds. _Default: 3_

```erb
<%= easy_poller count_users_path, interval: 10_000 %>
```

Do not start polling automatically. You can later start polling [interacting directly with the plugin](#plugin-interaction). _Default: true_

```erb
<%= easy_poller count_users_path, poll: false %>
```

Add HTML properties to the container

```erb
<%= easy_poller count_users_path, id: 'users-count-poller', class: 'user poller' %>
```

### Plugin interaction

Stop polling

```js
$("#users-count-poller").easyPoller("stop");
```

Start polling

```js
$("#users-count-poller").easyPoller("start");
```

Start all pollers

```js
$(".easy_poller").easyPoller("start");
```

Set options

```js
$("#users-count-poller").easyPoller("options", "loadingMessage", "Please wait...");
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fabrouy/easy_poller.
Feel free to suggest/add new features.

