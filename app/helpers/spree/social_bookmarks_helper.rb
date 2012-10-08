module Spree
  module SocialBookmarksHelper
    # TODO this needs a test suite

    def display_bookmarks(object_or_url = nil, title = nil, description = nil)
      locals = { :image => nil, :object => nil }
      
      if object_or_url.blank?
        url = request.env["REQUEST_URI"]
        url = "http://#{request.host}#{request.fullpath}" if url.blank?
      elsif object_or_url.is_a? String
        url = "http://#{request.host}#{url}"
      else
        # then it must be an object
        url = polymorphic_url(object_or_url)
        locals.merge! :object => object_or_url

        if title.blank?
          title = object_or_url.name
        end

        if description.blank? and object_or_url.respond_to? :description
          description = strip_tags(object_or_url.description)
        end

        if object_or_url.is_a? Spree::Product and object_or_url.images.size > 0
          # TODO has to be better way to get full URL here
          locals.merge! :image => u(request.protocol + request.host + object_or_url.images.first.attachment.url)
        end
      end

      render :partial => 'spree/shared/bookmarks', :locals => locals.merge({
        :title => title,
        :description => description,
        :url => u(url),
      })
    end
  end
end