require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  describe "GET list" do
    it "should assign all images as @images" do
      images = FactoryGirl.create_list(:image, 3)
      # Image.stub(:all).and_return(images)  ##causes deprecation!!!!
      allow(Image).to receive(:all).and_return(images)
      get :list

      expect(assigns(:images)).to eq(images)
    end
  end

  describe "GET #index" do
    it "returns images infos in json format with its url" do
      image = FactoryGirl.create(:image)
      get :index, format: :json
      parsed_response = JSON.parse(response.body)

      #response must be SUCCESS
      expect(response.status).to eq(200)

      #original_url must be that created
      expect(parsed_response['images'].first['original_url']).to eq(image.original_url)

      #small, medium, large and original url must not be nil or false
      expect(parsed_response['images'].first['small']).to be_truthy
      expect(parsed_response['images'].first['medium']).to be_truthy
      expect(parsed_response['images'].first['large']).to be_truthy
      expect(parsed_response['images'].first['original']).to be_truthy
    end

  end
end
