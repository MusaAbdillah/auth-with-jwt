class User < ApplicationRecord
	# method for bcrypt 
	has_secure_password 
	# validation
	validates_presence_of :name, :email, :password_digest
end
