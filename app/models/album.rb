class Album < ActiveRecord::Base
    validates_presence_of :directory, :title
    has_many :photos, :dependent => :destroy
end
