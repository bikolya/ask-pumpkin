module AnswersHelper

  def answers_count(answers)
    [answers.count, "Answer".pluralize(answers.count)]. join(" ")
  end
end