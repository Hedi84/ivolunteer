class Note < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :report
 end
