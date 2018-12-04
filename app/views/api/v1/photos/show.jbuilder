json.photo do
  json.url @photo.file.attached? ? polymorphic_url(@photo.file) : ""
  json.default @photo.default
end