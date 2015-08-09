require_relative 'edge_list'

LinkNode = Struct.new(:name, :id, :weight, :point)
LinkList = Struct.new(:name, :pointer)

class AdjacencyList
   attr_accessor :listgroup, :list
    
    def initialize(edgelist)
       @list = edgelist 
       @listgroup = []
       group_construct
    end
    
    def group_construct
       @list.each do |connect|
           @listgroup[connect[0].id] = LinkList.new(connect[0].name, nil) if listgroup[connect[0].id] == nil
           @listgroup[connect[1].id] = LinkList.new(connect[1].name, nil) if listgroup[connect[1].id] == nil
           @listgroup[connect[0].id] = link(@listgroup[connect[0].id], LinkNode.new(connect[1].name, connect[1].id, connect[2], nil))
           @listgroup[connect[1].id] = link(@listgroup[connect[1].id], LinkNode.new(connect[0].name, connect[0].id, connect[2], nil))
       end
    end
    
   def link(linklist, linknode)
      raise"not right type" if linklist.class != LinkList
      if linknode.class == LinkNode
          if linklist.pointer == nil
             linklist.pointer = linknode
          else
              nodelink(linklist.pointer, linknode)
          end
      end 
      return linklist
   end
   
   def nodelink(linknode1, linknode2)
      raise"not right type" if linknode1.class != LinkNode || linknode2.class != LinkNode
      if linknode1.point == nil
          linknode1.point = linknode2
      else
          nodelink(linknode1.point, linknode2)
      end
   end
   
   def list_print
      @listgroup.each do |linklist|
          print linklist.name + "  " 
          node_print(linklist.pointer)
          print "\n"
      end
   end
   
   def node_print(node)
       if node == nil
        print ""
       else
        print node.name + "(" + node.weight.to_s + ")"
        print "  "
        node_print(node.point)
       end
   end
   
   def edge_weight(p1, p2)
     weight = findweight(@listgroup[p1].pointer, p2)
     return "not fine" if weight == -1
     return weight
   end
   
   def findweight(node, id)
      return -1 if node == nil
      return node.weight if node.id == id
      findweight(node.point, id) 
   end
   
end

testcase = EdgeList.new
test_list = testcase.list
list = AdjacencyList.new(test_list)
#puts list.list
#puts list.listgroup
list.list_print
puts list.edge_weight(1, 2)
