class PagesController < ApplicationController
  def home
  end

  def sms
    @number = params[:q]
    @message = params[:d]
  end
end
