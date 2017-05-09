require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require('pg')


get ("/") do
  @surveys = Survey.all()
  erb(:index)
end
post("/topics") do
  @surveys = Survey.all()
  topic = params.fetch('topic')
  @survey = Survey.new({:topic => topic})
  @survey.save()
  erb(:index)
end

get ("/surveys/:id/edit") do
  @question = Question.all()
  @survey = Survey.find(params.fetch("id").to_i())
  @question = @survey.questions()
  erb(:survey_edit)
end


post("/surveys/:id") do
  question = params.fetch('question')
  id = params.fetch('id').to_i()
  @survey = Survey.find(id)
  @survey.questions().new({:question=> question})
  @survey.save()
  erb(:survey_edit)
end

get('/questions/:id/edit') do
  @question = Question.all()
  @question = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end

patch("/questions/:id") do
  question = params.fetch("question")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:question => question})
  @questions = Question.all()
  erb(:survey_edit)
end

delete("/questions/:id") do
  @question = Question.find(params.fetch("id").to_i())
  @question.delete()
  @questions = Question.all()
  erb(:index)
end
