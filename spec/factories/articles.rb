# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do 
  factory :article do
    title "Article"
    content "Content of article"
    admin
    writer "Writer"
    keywords "keyword1, keyword2"
    published false
  end
end
