# Banana Stand API Gem
Provides a Ruby interface to interact with the Banana Stand API. See https://www.bananastand.io/resources for more help.

# Installation
Add `gem 'bananastandio'` to your gemfile (and choose a version so it doesn't change in your evironments).

That's it!

# Usage

#### Setup client
```ruby
client = Banana::Client.new(public_key, secret_key) # Replace with your keys
```

#### Fetch events
```ruby
events = client.events; // Get the first page of events (default sorting is most recently updated first)
events.each do |event|
  puts "#{event.id}|#{event.visitor_id}"
end
```

#### Delete an Event
```ruby
event.delete!
```

#### Find event
```ruby
event = Event.find(client, events.first.id);
puts "Found: #{event.id}: #{event.visitor_id}"
```

#### Push Product View Event Asynchronously
```ruby
html = client.product_page_html(event.product_id);
echo "Display this HTML for Product ##{event.product_id} is: \n<!-- BEGIN HTML -.\n#{html}\n<!-- END HTML -->\n";
```

#### Push view event for that product for customer 123
```ruby
client.push_view_event(event.product_id, nil, 123);
// Show the new HTML
html = client.product_page_html(event.product_id);
echo "New HTML display for product ##{event.id} is: \n<!-- BEGIN HTML -.\n{html}\n<!-- END HTML -->\n";
```

# TODO
* Add automated tests and hook into travis

# License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
