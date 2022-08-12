FactoryBot.define do
  factory :item do
    image                     {Faker::Lorem.sentence}
    item_name                 {"名前"}
    item_info                 {"説明"}
    item_price                {300}
    sales_status_id           {2}
    scheduled_delivery_id     {2}
    prefecture_id             {2}
    shipping_fee_status_id    {2}
    category_id               {2}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end

  end
end
