class PagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @reports = @user.reports
      # @report = @reports.last
    end
   end

   def summary
     if user_signed_in?
      @user = current_user
      @reports = @user.reports



   end
end
