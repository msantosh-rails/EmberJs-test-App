# encoding: utf-8
#require 'carrierwave/processing/rmagick'
#require 'mini_magick'
#require 'RMagick'
class PicUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   include CarrierWave::RMagick
#   include CarrierWave::MiniMagick
#   include Magick
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


process :poster

def poster
 manipulate! do |source|
  txt = Magick::Draw.new
#  txt.family
  txt.pointsize = 64
  txt.gravity = Magick::SouthGravity
  txt.stroke = "transparent"
  txt.fill="black"
  title = model.pic_name
  left=model.left
  top=model.top
#  source = source.resize_to_fit(500, 500)#.border(10, 10, "black")
#  source.annotate(txt, 0, 0, top, left, title)
  if model.left && model.pic_name
  	source.annotate(txt, 0, 0, left, top, title)
  else
    	source.annotate(txt, 0, 0, 0, 40, " ")
  end

end
end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
def uploaded_filename 
    model.read_attribute mounted_as 
end

end
