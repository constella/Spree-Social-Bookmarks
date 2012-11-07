#Usage

Gemfile:

	gem 'spree_social_bookmarks', :git => 'git://github.com/wsmedia/spree-social-bookmarks.git'

Easily add social links to your product pages:

	<%= display_bookmarks %>
	<%= display_bookmarks @product %>
	<%= display_bookmarks "Title", "http://url.com/to/product-page" %>

You'll need to add social images to your `/assets/store/social` path (you can modify the path pointing to social images via preferences).  

Check out [web2icon](http://www.fasticon.com/free-icons-social-media-vector-icons-2012/) for a clean icon set.

Bookmarks include: ask, blinklist, blogmarks, delicious, digg, reddit, dzone, facebook, fark, furl, google bookmarks, magnolia, netscape, newsvine, reddit, shoutwire, simpy, slashdot, spurl, stumbleupon, swik, technorati, windows live, yahoo myweb2, pinterest, google plus, and the `spree_email_to_friend` extension.

This extension implements fragment caching. If you use display bookmark without an object argument, your caches will not expire. I recommend setting your app version for each release as this should eliminate any problem you may have with fragment expiration
	
	# production.rb
	ENV["RAILS_APP_VERSION"] = `git rev-parse --short HEAD`.strip

CREDITS
--------

Development of this extension is by:  

* [White Star Media][1]
* [Michael Bianco][2]

[1]: http://www.whitestarmedia.co.uk/
[2]: http://mabblog.com/
