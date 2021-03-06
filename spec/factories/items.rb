FactoryBot.define do

  factory :item do
    # image              {File.open("#{Rails.root}/public/images/9687.png")}
    image              {Rack::Test::UploadedFile.new(File.join(Rails.root, "public/images/user-bg.jpg"))}
    name               {"まつお"}
    description        {"スクラムマスターです"}
    item_status        {1}
    payment            {1}
    delivery_type      {1}
    delivery_region    {1}
    delivery_days      {1}
    price              {300}
    size               {1}
    user
  end
end
