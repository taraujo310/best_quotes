require "byebug"

class QuotesController < Amy::Controller
  def index
    begin
      @quotes = Amy::Model::FileModel.all
      render :index
    rescue => e
      puts e.inspect
    end
  end

  def create
    @quote = Amy::Model::FileModel.create({
      "quote" => "It is during our darkest moments that we must focus to see the light.",
      "submitter" => "hubspot",
      "attribution" => "Aristotle"
    })

    render :quote
  end

  def a_quote
    @quote = "Do or do not. There is no try. - Yoda"
    render :a_quote
  end

  def quote_1
    @quote = Amy::Model::FileModel.find(1)
    render :quote
  end

  def quote_2
    @quote = Amy::Model::FileModel.find(2)
    render :quote
  end

  def exception
    raise "this is an exception"
  end
end