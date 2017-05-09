ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("question")
require("survey")


RSpec.configure do |config|
  config.after(:each) do
    Question.all().each do |quest|
      quest.destroy()

  end
end
end
