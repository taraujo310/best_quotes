class QuotesController < Amy::Controller
  def index
    begin
      @quotes = Quotes.all
      render_response :index
    rescue => e
      puts e.inspect
    end
  end

  def create
    @quote = Quotes.create({
      "text" => "It is during our darkest moments that we must focus to see the light.",
      "submitter" => "hubspot",
      "attribution" => "Aristotle"
    })

    render_response :show
  end

  def show
    @quote = Quotes.find(params["id"])
    render_response :show
  end

  def exception
    raise "this is an exception"
  end
end