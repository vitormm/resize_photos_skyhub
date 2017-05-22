class ImagesController < ApplicationController

  SKY_HUB_IMAGES = 'http://54.152.221.29/images.json'

  def index
    image_links = RestClient.get(SKY_HUB_IMAGES)
    image_links = JSON.parse(image_links)
    if image_links.present? and image_links["images"].present?
      image_links["images"].map{|i| i["url"]}.each do |image_url|
        puts image_url
        if !Image.find_by(original_url: image_url).present?
          image = Image.new
          image.original_url = image_url
          image.attachment = URI.parse(image_url).open
          image.save
        end
        puts "saved!"
      end
    end

    @images = Image.all

    #render :json => image_links
  rescue Exception => e
    render :json => {message: e.message}, :status => 500
  end

end
