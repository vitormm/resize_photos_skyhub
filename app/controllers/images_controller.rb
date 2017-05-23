class ImagesController < ApplicationController

  def index
    images = Image.all
    images_hash = {}
    images_hash[:images] = []
    images.each do |image|
      images_hash[:images] << {original_url: image.original_url,
                               small: "http://#{request.host}:#{request.port}#{image.attachment.url('small')}",
                               medium: "http://#{request.host}:#{request.port}#{image.attachment.url('medium')}",
                               large: "http://#{request.host}:#{request.port}#{image.attachment.url('large')}",
                               original: "http://#{request.host}:#{request.port}#{image.attachment.url('original')}"}
    end

    render :json => images_hash

  rescue Exception => e
    render :json => {message: e.message}, :status => 500
  end

  def list
    @images = Image.all
  rescue Exception => e
    render :json => {message: e.message}, :status => 500
  end

end
