require "test/unit"
class ArabicGenerator 
  TABLE = {
    "I"  => 1,
    "V"  => 5,
    "X"  => 10,
    "L"  => 50,
    "C"  => 100,
    "D"  => 500,
    "M"  => 1000
  }

  def convert(roman_number)
    arabic_num = 0
    char = roman_number.split("")

    while char != []
     	if TABLE[char[1]] == nil
     		arabic_num += TABLE[char.shift]
     	elsif TABLE[char[1]] > TABLE[char[0]]
     		arabic_num += TABLE[char[1]] - TABLE[char[0]]
     		char.shift
     		char.shift
     	else
     		arabic_num += TABLE[char.shift]
     	end
    end
    arabic_num 
  end
end

class ArabicGeneratorTest < Test::Unit::TestCase
  def setup
    @converter = ArabicGenerator.new
  end
  def test_return_1
    assert_equal 1, @converter.convert("I")
  end
  def test_return_2
    assert_equal 2, @converter.convert("II")
  end
  def test_return_3
    assert_equal 3, @converter.convert("III")
  end
  def test_return_4
    assert_equal 4, @converter.convert("IV")
  end

  def test_return_9
    assert_equal 9, @converter.convert("IX")
  end

  def test_return_57
    assert_equal 57, @converter.convert("LVII")
  end

  def test_return_49
    assert_equal 49, @converter.convert("XLIX")
  end

  def test_return_crazy_num
    assert_equal 1949, @converter.convert("MCMXLIX")
  end
end