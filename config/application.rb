require "rr-amy"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

require "quotes_controller"

module BestQuotes
  class Application < Amy::Application
    author = Amy::Author.new(name: "Thiago", email: "tufa.araujo@gmail.com", github: "https://github.com/taraujo310")
    puts author
  end
end