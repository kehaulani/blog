FactoryGirl.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test#{n} Name"}
        f.sequence(:email) { |n| "test#{n}@test.com"}
        f.password "password"
        f.password_confirmation { |d| d.password }
    end

  factory :post do |f|
    f.sequence(:title) { |n| "Post #{n}" }
    f.sequence(:body) { |n| "Body #{n}"}
    f.association :user #will create a user for this task to belong to
    # unless I supply a user in the options hash when I create this user.
  end
end
