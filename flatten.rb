# # To run tests in shell:
# $ ruby flatten.rb
#
# # To use module in irb:
# irb(main):001:0> require_relative 'flatten'
# => true
# irb(main):001:1> Flatten.run([[1, 2, [3]], 4])
# => [1, 2, 3, 4]
module Flatten
  def self.run(enum)
    raise ArgumentError, 'must be iterable' unless enum.respond_to?(:each)
    return enum if enum.empty?
    recursive_flatten([], enum)
  end

  def self.recursive_flatten(acc, ele)
    head, *tail = ele
    head.respond_to?(:each) ? recursive_flatten(acc, head) : acc << head
    recursive_flatten(acc, tail) unless tail.empty?
    acc
  end

  private_class_method :recursive_flatten
end

require 'minitest/autorun'

class FlattenTest < Minitest::Test
  def test_for_integer
    exception = assert_raises(ArgumentError) { Flatten.run(1) }
    assert_equal 'must be iterable', exception.message
  end

  def test_for_string
    exception = assert_raises(ArgumentError) { Flatten.run('1') }
    assert_equal 'must be iterable', exception.message
  end

  def test_for_empty_array
    result = Flatten.run([])
    assert_equal [], result
  end

  def test_for_size_1_array
    result = Flatten.run([1])
    assert_equal [1], result
  end

  def test_for_nested_array
    result = Flatten.run([[1, 2, [3]], 4])
    assert_equal [1, 2, 3, 4], result
  end
end
