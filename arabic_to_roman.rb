class RomanNumeralGenerator
	TABLE = {
		1000 => "M",
		900  => "CM",
		500  => "D",
		400  => "CD",
		100  => "C",
		90   => "XC",
		50   => "L",
		40   => "XL",
		10   => "X",
		9    => "IX",
		5    => "V",
		4    => "IV",
		1    => "I"
	}

  def convert(arabic_numeral)
  	roman_numeral = ""

  	TABLE.each do |arabic, roman|
  		while arabic_numeral >= arabic
  			roman_numeral << roman
  			arabic_numeral -= arabic
  		end
  	end
	  return roman_numeral
	end

end


require 'test/unit'

class RomanNumeralGeneratorTest < Test::Unit::TestCase

	def setup
		@converter = RomanNumeralGenerator.new
	end

	def test_one_returns_xx
		assert_equal "XX", @converter.convert(20)
	end

	def test_one_returns_xix
		assert_equal "XIX", @converter.convert(19)
	end

	def test_one_returns_xvi
		assert_equal "XVI", @converter.convert(16)
	end

	def test_one_returns_xv
		assert_equal "XV", @converter.convert(15)
	end

	def test_one_returns_xiv
		assert_equal "XIV", @converter.convert(14)
	end

	def test_one_returns_xi
		assert_equal "XI", @converter.convert(11)
	end

	def test_one_returns_x
		assert_equal "X", @converter.convert(10)
	end

	def test_one_returns_ix
		assert_equal "IX", @converter.convert(9)
	end

	def test_one_returns_viii
		assert_equal "VIII", @converter.convert(8)
	end

	def test_one_returns_vii
		assert_equal "VII", @converter.convert(7)
	end

	def test_one_returns_vi
		assert_equal "VI", @converter.convert(6)
	end

	def test_one_returns_v
		assert_equal "V", @converter.convert(5)
	end

	def test_one_returns_iv
		assert_equal "IV", @converter.convert(4)
	end

	def test_one_returns_iii
		assert_equal "III", @converter.convert(3)
	end

	def test_one_returns_ii
		assert_equal "II", @converter.convert(2)
	end

	def test_one_returns_i
		assert_equal "I", @converter.convert(1)
  end
	

end