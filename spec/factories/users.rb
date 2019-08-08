FactoryBot.define do

  factory :user do
    id                    {1}
    nickname              {"ニックネーム"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"名前"}
    last_name             {"名字"}
    first_kana            {"ナマエ"}
    last_kana             {"ミョウジ"}
    birthday              {"2019-07-24"}
  end

  factory :another_user do
    id                    {2}
    nickname              {"ニックさん"}
    email                 {"jjj@gmail.com"}
    password              {"11111111"}
    password_confirmation {"11111111"}
    first_name            {"なまえ"}
    last_name             {"にゃんこ"}
    first_kana            {"ナマエ"}
    last_kana             {"ニャンコ"}
    birthday              {"2019-07-30"}
  end

end