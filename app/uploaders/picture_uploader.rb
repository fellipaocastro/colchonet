# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  if Rails.env == "production"
    include Cloudinary::CarrierWave
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
