require 'minitest/autorun'
require './lib/card'


class CardCreateTest < Minitest::Test
	def number_create
		assert_equal [1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10, 11, 12, 13, 14], Card.numbers
	end
end