require('spec_helper')

describe(Survey) do
  describe("#questions") do
    it("tells which questions are in it") do
      test_survey = Survey.create({:topic => "survey"})
      test_question1 = Question.create({:question => "Who let the dogs out?", :survey_id => test_survey.id})
      test_question2 = Question.create({:question => "What if god was one of us?", :survey_id => test_survey.id})
     expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
  it("valicates presence of topic")do
    survey = Survey.new({:topic => ""})
    expect(survey.save()).to(eq(false))
  end
  it('converts the name to lowercase') do
    survey = Survey.create({:topic => "SPORTS"})
    expect(survey.topic()).to(eq("sports"))
  end
  it("ensures length of description is at least 50 characters")do
    survey = Survey.new({:topic => "a".*(51)})
    expect(survey.save()).to(eq(false))
  end
end
