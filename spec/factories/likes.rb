FactoryBot.define do
  factory :like do
    item { "MyString" }
    references { "MyString" }
    user { nil }
  end
end
