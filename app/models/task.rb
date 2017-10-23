class Task < ActiveRecord::Base
    
 belongs_to :user
 
 #STEp11-5で追加
 has_many :taggings
 has_many :tags, :through => :taggings
    
    scope :closed,      lambda { where(:status => true) }
    scope :unclosed,    lambda { where.not(:status => true) }
    scope :recently,    lambda { where("deadline <= ?", 3.days.since) }
    scope :search,      lambda { |name| where("name like ?", "%#{name}%") if name.present? }
    #STEp11-10で追加
    scope :by_tag,      lambda {|tag| includes(:tags).where(:tags => {:name => tag}) if tag.present? }    

    validates :name, :presence => true, :uniqueness => {:scope => :user_id}
    validates :status, :inclusion => [true, false]
    validates :deadline, :presence => true
end
