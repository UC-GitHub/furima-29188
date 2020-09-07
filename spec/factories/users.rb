FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    family_name           {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    kana_family_name      {Gimei.last.katakana}
    kana_first_name       {Gimei.first.katakana}
    birthday              {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end