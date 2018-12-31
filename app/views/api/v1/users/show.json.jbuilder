json.id @user.id
json.name @user.name
json.college @user.college
json.company @user.company

json.photos @user.photos do |photo|
  json.url photo.file.attached? ? polymorphic_url(photo.file) : "" 
end