class Photo < ActiveRecord::Base

  dragonfly_accessor :image    # defines a reader/writer for image

end
