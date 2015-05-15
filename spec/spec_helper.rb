ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("movie")
require("actor")

RSpec.configure do |config|
  config.after(:each) do
    Actor.all().each() do |actor|
      actor.destroy()
    end
  end
end