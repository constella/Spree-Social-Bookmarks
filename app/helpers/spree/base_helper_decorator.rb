Spree::BaseHelper.class_eval do
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

      # get image reference for pinterest and others

      if object_or_url.is_a? Spree::Product and object_or_url.images.size > 0
        locals.merge! :image => u(attachment_url(object_or_url.images.first.attachment))
      end

      if object_or_url.respond_to? :photo and object_or_url.photo.present?
        locals.merge! :image => u(attachment_url(object_or_url.photo))
      end
    end

    render :partial => 'spree/shared/bookmarks', :locals => locals.merge({
      :title => title,
      :description => description,
      :url => url,
    })
  end

  # pulled from: https://github.com/thoughtbot/paperclip/issues/584
  def attachment_url(attachment, style = :original)
    "#{request.protocol}#{request.host_with_port}#{attachment.url(style)}"
  end
end
