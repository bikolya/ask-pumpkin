module QuestionsHelper

  BRIEF_DESC = 200

  def brief_body(body)
    if body.length > BRIEF_DESC
      body.first(BRIEF_DESC) + "..."
    else
      body
    end
  end
end