# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    name "Admin"
    sequence(:email) { |n| "admin#{n}@songwriterproject.com" }    
    password "password"
  end
end
