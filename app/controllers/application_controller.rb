# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    return I18n.locale = session[:locale] if session[:locale] && params[:locale].nil?

    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
