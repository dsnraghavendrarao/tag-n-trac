FactoryBot.define do
  factory :user do 
  	full_name { "Raghu"}
	role { "Admin" }
	firm_name { "God" }
	email { 'raghu@gmail.com' }
	password { '12345678' }
  end
end