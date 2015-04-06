module ApplicationHelper
	def rus_number_to_currency(price)
		number_to_currency(price,
		                   unit: "руб.",separator: ",",
		                   delimiter: " ",
		                   format: "%n %u" )
	end

	def markdown(text)
		renderer = Redcarpet::Render::HTML.new
		markdown = Redcarpet::Markdown.new(renderer, extensions = {tables: true, autolink: true})
		markdown.render(text).html_safe
	end
end
