FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) {|n| "john#{n}@example.org"}
    sequence(:login) {|n| "john#{n}"}
    password "test"
    password_confirmation "test"
  end

  factory :task do
    title "Some task"
    association :user
  end
end
