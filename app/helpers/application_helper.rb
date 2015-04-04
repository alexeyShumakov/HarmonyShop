module ApplicationHelper
	def rus_number_to_currency(price)
		number_to_currency(price,
		                   unit: "руб.",separator: ",",
		                   delimiter: " ",
		                   format: "%n %u" )
	end
end
