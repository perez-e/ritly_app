module RitliesHelper
	def shorten(link)
		link.slice!("http://")
		link.split("/")[0]
	end
end
