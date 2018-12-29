json.users @users do |user|
  json.id user.id
  json.name user.name
  json.college user.college
  json.company user.company
  
  distance = (user.distance / 1000)
  json.distance distance < 5.0 ? 5 : distance
  
  json.photos user.photos do |photo|
    json.url photo.file.attached? ? polymorphic_url(photo.file) : "" 
  end
end