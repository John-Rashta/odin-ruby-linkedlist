# Methods to help doing basic linkedlist actions
module LinkedListHelper
  def insert_remove_iterator(head, index)
    current_node = head
    after_node = head.next_node
    current_index = 0

    while current_index < index - 1
      current_node = after_node
      after_node = current_node.next_node
      current_index += 1
    end

    [current_node, after_node]
  end
end
