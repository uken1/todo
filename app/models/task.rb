class Task < ActiveRecord::Base
    
 belongs_to :user
    
    scope :closed,      lambda { where(:status => true) }
    scope :unclosed,    lambda { where.not(:status => true) }
    scope :recently,    lambda { where("deadline <= ?", 3.days.since) }
    scope :search,      lambda { |name| where("name like ?", "%#{name}") if name.present? }

    validates :name, :presence => true, :uniqueness => true
    validates :status, :inclusion => [true, false]
    validates :deadline, :presence => true
end
