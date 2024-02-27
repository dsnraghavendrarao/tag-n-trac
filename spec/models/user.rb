require 'rails_helper'

RSpec.describe User do
	let(:create_user){create(:user)}
	describe "ActiveRecord Association" do
	  context do
		context { expect(create_user).to have_many(:shipmetns) }
	  end
	end
end