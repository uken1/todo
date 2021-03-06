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
    
    # リマインド通知機能実装前1/3　validates :deadline, :presence => true
    # 試しに戻してみる　validates :deadline, :presence => true, if: :need_reminder?
    validates :deadline, :presence => true
    
    # リマインド通知機能2/3　24時間以内のToDoならtrueを返す。
    def todays_todo?
    # if !deadline.nil?
       deadline < Time.now.since(24.hours) && deadline >= Time.zone.now
    # end
    end
     
    # private
    ## リマインダ通知機能3/3heroku addons:create scheduler:standardがtrueの時はstatusを必須とする
    #def need_reminder?
    #  status == false
    #end
end