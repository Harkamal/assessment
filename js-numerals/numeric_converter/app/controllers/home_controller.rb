require "numeric_to_english_converter"
class HomeController < ApplicationController
  include NumericToEnglishConverter
  def index
    if params[:number].present?
      @number = params[:number].to_i
      @translated_number = convert_numeric_to_english(params[:number].to_i)
    end

    respond_to do |format|
      format.html
      # render numeric_to_english_conversion.js.erb on js request.
      format.js { render 'numeric_to_english_conversion'}
    end
  end
end
