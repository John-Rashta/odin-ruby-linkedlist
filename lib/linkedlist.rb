require_relative "node"
require_relative "linkedlist_helper"
# LinkedList class
class LinkedList
  include LinkedListHelper

  attr_reader :size, :head, :tail

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    unless @head
      set_all(new_node, 1)
      return
    end
    @tail.next_node = new_node
    @tail = new_node
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    unless @head
      set_all(new_node, 1)
      return
    end
    new_node.next_node = @head
    @head = new_node
    @size += 1
  end

  def at(index)
    current_index = 0
    current_node = @head
    while current_index <= index && !current_node.nil?
      return current_node if current_index == index

      current_node = current_node.next_node
      current_index += 1
    end
  end

  def pop
    return unless @head

    if @head == @tail
      set_all(nil, -1)
    else
      current_node = @head
      current_node = current_node.next_node while current_node.next_node != @tail

      current_node.next_node = nil
      @tail = current_node
      @size -= 1
    end
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_index = 0
    current_node = @head
    until current_node.nil?
      return current_index if current_node.value == value

      current_index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @head
    list_string = ""
    until current_node.nil?
      list_string.concat("( #{current_node.value} ) -> ")
      current_node = current_node.next_node
    end

    list_string.concat("nil")
  end

  def insert_at(value, index)
    return if (!@head && index != 0) || @size - 1 < index

    return prepend(value) if index.zero?

    current_node, after_node = insert_remove_iterator(@head, index)

    new_node = Node.new(value)
    current_node.next_node = new_node
    new_node.next_node = after_node
    @size += 1
  end

  def remove_at(index)
    return if !@head || @size - 1 < index

    if index.zero?
      if @head == @tail
        set_all(nil, -1)
      else
        @head = @head.next_node
        @size -= 1
      end
      return
    end

    if index == @size - 1
      pop
      return
    end

    current_node, after_node = insert_remove_iterator(@head, index)

    current_node.next_node = after_node.next_node
    @size -= 1
  end

  private

  def set_all(value, size_adjust)
    @head = value
    @tail = value
    @size += size_adjust
  end
end
