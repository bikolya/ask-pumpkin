def make_users
  10.times do |n|
    email = "q#{n+1}@q.com"
    password = "qweqweqwe"
    username = "q#{n+1}"
    nickname = Faker::Name.name
    avatar = Faker::Company.logo
    nickname = Faker::Name.name
    user = User.new
    user.email = email
    user.password = password
    user.username = username
    user.nickname = nickname
    user.remote_avatar_url = avatar
    user.save
  end
end

def make_tags
  10.times do |n|
    tag = Tag.new
    tag.name = Faker::Hacker.abbreviation
    tag.save
  end
end

def make_questions
  50.times do |n|
    question = Question.new
    question.user_id = rand(User.count) + 1
    question.title = Faker::Hacker.say_something_smart
    question.body = Faker::Lorem.paragraph(5)
    question.save
  end
end

def make_answers
  200.times do |n|
    answer = Answer.new
    answer.user_id = rand(User.count) + 1
    answer.question_id = rand(Question.count) + 1
    answer.body = Faker::Lorem.paragraph(5)
    answer.save
  end
end

def make_question_likes
  500.times do |n|
    user_id = rand(User.count) + 1
    question_id = rand(Question.count) + 1
    user = User.find_by(id: user_id)
    question = Question.find_by(id: question_id)
    if rand(3) == 0
      user.dislike(question)
    else
      user.like(question)
    end
  end
end

def make_answer_likes
  1000.times do |n|
    user_id = rand(User.count) + 1
    answer_id = rand(Answer.count) + 1
    user = User.find_by(id: user_id)
    answer = Answer.find_by(id: answer_id)
    if rand(3) == 0
      user.dislike(answer)
    else
      user.like(answer)
    end
  end
end

make_tags
make_users
make_questions
make_answers
make_question_likes
make_answer_likes