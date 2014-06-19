class Sample < ActiveRecord::Base
  attr_accessible :pic_name, :pic, :left ,:top,:picname
  mount_uploader :pic, PicUploader
  validates :pic, presence: true
end
