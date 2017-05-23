require 'rails_helper'
module FactoryGirlHelper
  def FactoryGirlHelper.initialize_factories
    FactoryGirl.factories.map { |f| f.name }.each do |f|
      puts "Creating Factory: #{f.to_s}"
      FactoryGirl.create(f)
    end
  end
end