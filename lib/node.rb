# Node class that keeps track of value and next_node in line
class Node
  attr_accessor :value, :next_node

  def initialize(val = nil)
    @value = val
    @next_node = nil
  end
end
