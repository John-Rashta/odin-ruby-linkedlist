require_relative "lib/linkedlist"

list = LinkedList.new

list.append("dog")
list.append("cat")
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")
list.prepend("jaguar")

list.pop
puts list.contains?("turtle")
puts list.contains?("snake")
puts list.find("snake")
list.insert_at("bear", 4)
list.remove_at(3)
p list.at(3)
puts list
