FactoryGirl.define do
  factory :image do
    original_url "http://54.152.221.29/images/b737_5.jpg"
    attachment { File.new("#{Rails.root}/spec/support/fixtures/b737_5.jpg") }
  end
end