$VERBOSE = true

require 'rubygems'
require 'minitest/autorun'
require 'colored/not'

class TestColoredNot < MiniTest::Unit::TestCase
  def test_colored_not
    3.times do
      assert_equal "\e[31mred\e[0m", 'red'.red
      assert_equal "\e[41mred\e[0m", 'red'.on_red
      assert_equal "\e[31m\e[44mred\e[0m", 'red'.red_on_blue
      assert_equal "\e[1mred\e[0m", 'red'.bold
      assert_equal "\e[4m\e[44m\e[31mred\e[0m\e[0m\e[0m", 'red'.red.on_blue.underline
      assert_equal "", 'red'.clear if 'red'.respond_to?(:clear)

      nots = Colored.not!

      assert_equal "red", 'red'.red
      assert_equal "red", 'red'.on_red
      assert_equal "red", 'red'.red_on_blue
      assert_equal "red", 'red'.bold
      assert_equal "red", 'red'.red.on_blue.underline
      assert_equal "", 'red'.clear if 'red'.respond_to?(:clear)

      cols = Colored!

      assert nots.include?(:bold)
      assert nots.include?(:red)
      assert nots.include?(:on_red)
      assert nots.include?(:red_on_blue)
      assert !nots.include?(:red_on_red)
      assert (nots - cols).empty?
    end
  end
end

