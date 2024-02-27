class HomesController < ApplicationController
  def index

  end

  def dashboard
    
  end

  def signup
    @user = User.new
  end
end
