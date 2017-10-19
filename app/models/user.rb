class User < ActiveRecord::Base
 before_create :encrypted_password
 
 has_many :tasks, :dependent => :destroy
 
 validates :name, :presence => true
 validates :email, :presence => true, :uniqueness => true
 
 private
 def encrypted_password
  self.password = Digest::SHA1.hexdigest(self.password)
 end
end
