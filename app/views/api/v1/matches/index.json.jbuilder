json.matches @matches do |match|
  json.id match.id

  matchee = match.matchee
  matchee = match.matcher if matchee == current_user
  if matchee.default_photo && matchee.default_photo.file.attached?
    json.matchee_photo_url polymorphic_url(matchee.default_photo.file)
  else
    json.matchee_photo_url ""
  end
end