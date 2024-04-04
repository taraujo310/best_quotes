require './config/application'

class Copyrighter
  attr_reader :company_name, :start_year, :current_year

  def initialize(app, start_year, company_name = "")
    @app = app
    @company_name ||= company_name
    @start_year ||= start_year
    @current_year ||= Date.today.year
  end

  def call(env)
    status, headers, content = @app.call(env)
    new_content = content[0] || ""

    if content[0]
      html_start = content[0][0...(content.size-17)]
      html_end = content[0][-17..-1]
      copyright = "<p>© #{start_year} – #{current_year} #{company_name}.</p>\n"

      new_content = html_start + copyright + html_end
    end

    [ status, headers, [new_content] ]
  end
end

use Rack::ContentType
use Rack::ContentLength
use Rack::Reloader
use Rack::Static, :urls => ["/public"]
use Copyrighter, 2010, "BestQuote"
run BestQuotes::Application.new