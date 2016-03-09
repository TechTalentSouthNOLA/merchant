class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin_user
end