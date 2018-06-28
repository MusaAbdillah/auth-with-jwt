class User < ApplicationRecord
	# method for bcrypt 
	has_secure_password 
end
