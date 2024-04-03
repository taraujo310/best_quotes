require "byebug"

class QuotesController < Amy::Controller
  def a_quote
    @quote = "Do or do not. There is no try. - Yoda"
    render :a_quote, quote: @quote
  end

  def exception
    raise "this is an exception"
  end
end