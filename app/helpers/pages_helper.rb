module PagesHelper
	def apostrophe(user = "User Name")
		if user.name.split("").last == 's'
    		user.name + "'"
		else
    		user.name + "'s"
		end
	end
end
