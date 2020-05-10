FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Person #{n}"}
    sequence(:fullname) {|n| "Person #{n}"}

  end

  # factory :opinion do
  #   text  { "Lorem ipsum" }
  #   user
  # end
end
