- this repo building rails api authentication using jwt gem 
- rails 5.2 is version used by this application 
- when building this app, creator have some problem 
	example: when this app is building, it use rails 5.2 whereas the tutorial which followed using rails 5.1
	you must change this line:
	#app/lib
		before:   HMAC_SECRET = Rails.application.secrets.secret_key_base
	when using rails 5.2 
		after:	  HMAC_SECRET = Rails.application.credentials.secret_key_base

credit(thanks to Austin Kabiru):
https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two