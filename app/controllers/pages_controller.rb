class PagesController < ApplicationController
  def home
    @user = current_user
    @reports = @user.reports
    @report = @reports.last
   end
end
