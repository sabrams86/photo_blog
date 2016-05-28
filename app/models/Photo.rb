class Photo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  dragonfly_accessor :image    # defines a reader/writer for image

end
