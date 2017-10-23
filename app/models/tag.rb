class Tag < ActiveRecord::Base
    validates :name, :presence => true, :uniqueness => true
    has_many :taggings
    has_many :tasks, :through => :taggings
end
