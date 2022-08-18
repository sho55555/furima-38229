FactoryBot.define do
  factory :order_shipping do
    postal_code            { '123-4567' }
    prefecture_id          { 2 }
    city                   { 'テスト' }
    addresses              { 'テスト' }
    phone_number           { 1_234_567_890 }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
