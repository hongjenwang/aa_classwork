
def bfs(target_value)
    arr = []
    arr.unshift(self) #enqueue = shift
    until arr.empty?
        first_value = arr.pop #dequeue = pop
        return first_value if first_value.value == target_value
        first_value.children.each do |child|
            arr.unshift(child)
        end
    end
    nil
end

# def bfs(target)
#     queue = MyQueue.new
#     queue.enqueue(self)
#     until queue.empty?
#         curr_node = queue.dequeue
#         return curr_node if curr_node.value == target
#         curr_node.children.each do |child|
#             queue.enqueue(child)
#         end
#     end
#     nil
# end

# For both of these problems, assume there is a Node class. The node class will take in a value as part of its initialization. You will monkeypatching the following methods:

# 1. Write a method `bfs` that does a breadth-first search starting at a root node. It takes in a target as an argument.

# 2. Write a method `dfs` that does a depth-first search starting at a root node. It takes in a target as an argument.

# Example usage:

# n1 = Node.new(1) # making a node with a value of 1
# n1.bfs(1) #=> n1
# n1.dfs(1) #=> n1 (found a node with value == 1)

class Node

    # -- Assume nodes have a value, and a attr_reader on value
    # -- Also, assume there are working parent/child-related methods for Node
    def dfs(target)
        return self if self.value == target
        self.children.each do |ele|
            new_var = ele.dfs(target)
            return new_var if !new_var.nil?
        end
        nil
    end

    def bfs(target)
        arr = []
        arr.unshift(self)
        until arr.emtpy?
            popped_node = arr.pop
            return popped_node if target == popped_node.value
            popped_node.children.each do |child|
                arr.unshift(child)
            end
        end
        nil
    end

    #start with an empty array
    #unshift item into the empty array
    #untrepeat the following il the array is emtpy:
        # pop off the node and check if the value is the same as the target value, and return if it is
        # add its children by unshifting into the array
    #return nil if children's value isn't target
        

end

n1 = Node.new(50)

n1.bfs(500) #= nil
n1.bfs(50) #= n1

