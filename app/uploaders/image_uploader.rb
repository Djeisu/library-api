class ImageUploader < Shrine
  plugin :remove_attachment
  plugin :store_dimensions, analyzer: :mini_magick

  Attacher.validate do
    validate_max_size 5.megabyte, message: 'is too large (max is 5 MB)'
  end
end
