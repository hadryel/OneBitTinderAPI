json.chat @messages do |message|
  json.body message.body
  json.match_id message.match_id
  json.user_id message.user_id
  json.created_at message.created_at
end
