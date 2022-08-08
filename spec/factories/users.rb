FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birth_day             { Faker::Date.birthday }
  end
end
