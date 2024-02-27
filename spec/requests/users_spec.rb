# require 'rails_helper'

# RSpec.describe 'Users', type: :controller do
#   describe 'GET /users/sign_up' do
#     it 'renders the sign-up form' do
      
#     end
#   end
#   describe 'GET /users/sign_up' do
#     it 'renders the sign-up form' do
#       get new_user_registration_path
#       expect(response).to have_http_status(200)
#       expect(response.body).to include('Sign up')
#     end
#   end

#   describe 'POST /users' do
#     it 'creates a new user' do
#       expect {
#         post user_registration_path, params: { user: { email: 'test@example.com', password: 'password' } }
#       }.to change(User, :count).by(1)
#       expect(response).to redirect_to(root_path)
#     end
#   end

#   describe 'POST /users/sign_in' do
#     it 'signs in the user' do
#       user = User.create(email: 'test@example.com', password: 'password')
#       post user_session_path, params: { user: { email: 'test@example.com', password: 'password' } }
#       expect(response).to redirect_to(root_path)
#     end
#   end
# end