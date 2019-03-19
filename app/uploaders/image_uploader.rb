class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process :resize_to_limit => [100, 100]
  
  version :thumb_300 do
     process :resize_to_fit => [300, 300]
   end

   def default_url
      "/images/fallback/" + [version_name, "default.jpg"].compact.join('_')
   end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
