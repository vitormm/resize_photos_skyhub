require 'rails_helper'

RSpec.describe Image, type: :model do
  describe Image do
    it "should have an original_url" do
      image = FactoryGirl.build(:image)
      expect(image.original_url).to  eq("http://54.152.221.29/images/b737_5.jpg")
    end
  end
end