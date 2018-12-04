json.photos @photos do |photo|
  json.url photo.file.attached? ? polymorphic_url(photo.file) : ""
  json.default photo.default
end