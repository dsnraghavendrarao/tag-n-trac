# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#<User id: nil, full_name: nil, role: nil, firm_name: nil, email: "", created_at: nil, updated_at: nil>

User.create(full_name: "admin", role: "Admin", email: "admin@tnt.com", password: "12345678")