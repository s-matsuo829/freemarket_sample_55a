FactoryBot.define do

  factory :user do
    nickname              {"ニックネーム"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"名前"}
    last_name             {"名字"}
    first_kana            {"ナマエ"}
    last_kana             {"ミョウジ"}
    birthday              {"2019-07-24"}
    # provider              {"1234567a"}
    # uid              {"a1234567"}
  end

end