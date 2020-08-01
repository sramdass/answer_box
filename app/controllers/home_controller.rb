class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show], raise: false
  def show
  end
end