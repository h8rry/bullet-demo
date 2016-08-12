json.users @users do |user|
  json.questions user.questions do |question|
    json.id question.id
    json.user_id question.user_id
    json.title question.title
    json.created_at question.created_at
    json.updated_at question.updated_at
  end
end
