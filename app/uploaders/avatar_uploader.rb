# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end

  version :index do
    process :resize_to_fit => [70, 70]
  end

  version :show do
    process :resize_to_fit => [125, 125]
  end

  version :profile do
    process :resize_to_fit => [150, 150]
  end
end
