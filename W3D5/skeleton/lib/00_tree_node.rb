# def parent=(new_parent)
# maybe recursively parent=(arg)
# @parent.children << child
# pop child from old parent
# how to reference parent of child
# element from children .parent reassign to new parent

#def child(idx)
#

class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @children = [] #those without children
        @parent = nil #nil is for node's who are parents
    end

    #node1, node2, node3
    #node1 as child of node2
    def parent=(node)
        #trying to make node3 parentless (node = nil)
        #node3.parent = nil
        if node == nil
            return nil if @parent = nil
            location = @parent.children.index(self)
            @parent.children.delete_at(location) #node3's parent => node2's children => [node3, node1]
        end
        #before we reassign anything, we want to check
        #does new parent try to take child that already has parent

        # #does current parent already have child (no duplicates)
        if !node.children.include?(self) #if child is not included in node
            @parent = node #node1's parent will become node2
            node.children << self #because node1 is calling parent= method
            #node2.children << node1
        end
    end

end