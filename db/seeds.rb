def make_users
  10.times do |n|
    email = "q#{n+1}@q.com"
    password = "qweqweqwe"
    username = "q#{n+1}"
    nickname = Faker::Name.name
    user = User.new
    user.email = email
    user.password = password
    user.username = username
    user.nickname = nickname
    user.save
  end
end

def make_questions
  20.times do |n|
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

make_users
make_questions
make_answers