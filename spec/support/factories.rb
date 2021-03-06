FactoryGirl.define do

  factory :mock_token, :class => Notifiable::DeviceToken do
    provider :mock
    token
  end
  
  sequence(:email) {|n| "person-#{n}@example.com" }
  sequence(:token) {|n| "ABCD#{n}" }
  
  factory :user do
    email
    
    factory :user_with_mock_token do
      after(:create) do |user, evaluator|
        FactoryGirl.create(:mock_token, :user_id => user.id)
      end
    end
  
    factory :user_with_invalid_mock_token do
      after(:create) do |user, evaluator|
        FactoryGirl.create(:mock_token, :user_id => user.id, :is_valid => false)
      end
    end  
  end
  
  
end