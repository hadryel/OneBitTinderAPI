json.messages @messages do |message|
  json.body message.body

  owner = message.user
  if owner.default_photo && owner.default_photo.file.attached?
    json.user_photo_url polymorphic_url(owner.default_photo.file)
  else
    json.user_photo_url ""
  end
end