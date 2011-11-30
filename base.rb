
require 'erb'

class Base

	def read(template)
		@template = File.read(template)
	end

	def parse_to(path)
			template = ERB.new(@template)
			file = File.new(path,"w")
			file.write(template.result(binding))
			file.close
	end

end