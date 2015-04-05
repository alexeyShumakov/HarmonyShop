module ApplicationHelper
	def rus_number_to_currency(price)
		number_to_currency(price,
		                   unit: "руб.",separator: ",",
		                   delimiter: " ",
		                   format: "%n %u" )
	end

	def markdown(text)
		renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
		markdown = Redcarpet::Markdown.new(renderer, extensions = {})
		markdown.render(text).html_safe
	end
end
