require_relative '../modules/linkedlist_operations'



=begin

Write a Program to create a Singly Linked List and perform the following operations on the same:
Add data to the beginning of the list
Add data to the end of end of the list
Add data in the middle of the list - index provided by the user
Reverse the Linked List
You can create your own Linked List and perform these operations. We should display the linked list after each operation


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ENHANCEMENTS : 
 1. added delete functionality
 2. modular code (scalable)
 3. taken care of edge cases
 



=end




#class for creating node
class Node 
    attr_accessor :data
    attr_accessor :next

    #parameterized constrctor
    def initialize(data = 0)
        @data = data
        @next = nil
    end 
end



#class that creates linkedlist
class LinkedList

    puts("******************")
    #imported from module for implementing abstract methods
    include LinkedListOperations
    attr_accessor :root

    def initialize()
        @root = nil
    end 


    def is_empty()
        @root.nil?
    end


    def get_size()
        ptr  = @root
        count = 0 
        while(ptr)
            count+=1
            ptr = ptr.next
        end
        count
    end


    #method that displays the linked list
    def display()
        puts("After the operation")
        if(is_empty())
            puts("LinkedList is empty")
        else
            ptr = @root
            while(ptr)
                print(ptr.data," ")
                ptr = ptr.next
            end
            print("\n")
        end
    end 


    #method that add a node at the beginning
    def add_at_begin(data)

        new_node = Node.new(data)

        if(is_empty())
            @root = new_node
        else
            new_node.next = @root
            @root = new_node
        end
        return @root.data
    end


    #method that add a node ar the ending
    def add_at_end(data)

        new_node = Node.new(data)
        ptr = @root
        if(is_empty())
            @root = new_node
        else
            while(ptr.next!=nil)
                ptr = ptr.next
            end
            ptr.next = new_node
        end
    end
    

    #method that insert a node at an index
    def insert_at_index(data,index)
        new_node = Node.new(data)

        ptr = @root
        if(index==0)
            new_node.next = @root
            @root = new_node
        elsif(index > get_size()-1)
            puts("index is not allowed")
        else 
            index.times do
                ptr = ptr.next
            end
            ptr2 = ptr.next
            ptr.next  = new_node
            new_node.next  = ptr2
        end
    end 


    #delete a node at the beginning
    def delete_at_begin()

        res = 0
        if(is_empty())
            res = "empty"
        else
            @root = @root.next
            res = root.data
        end
        return res

    end

    

    #delete a node at the end
    def delete_at_end()
        if(is_empty())
            return
        end
    
        ptr = @root
        while ptr.next.next
          ptr = ptr.next
        end
        ptr.next = nil
    end
    


    #delete a node at the index
    def delete_at_index(index)

        if(is_empty())
            return
        end

        if(index > get_size()-1)
            puts("index not allowed")
        elsif(index==0)
            @root = @root.next
        else
            ptr = @root
            (index - 1 ).times do
            ptr = ptr.next
            end
            return if ptr.next.nil?
            ptr.next = ptr.next.next
        end
    end



    #method that reverses the nodes
    def reverse
        current = @root
        prev = nil
    
        while current
          next_node = current.next
          current.next = prev
          prev = current
          current = next_node
        end
    
        @root = prev
    end

end



#main function
def main_function()
    print("--------------------------------------------\n")
    puts("Enter 1 to add node at ---- the beginning")
    puts("Enter 2 to add node at index i ")
    puts("Enter 3 to add node at ending")
    puts("Enter 4 to reverse the nodes")
    puts("Enter 5 to delete node at the beginning")
    puts("Enter 6 to delete node at the ending")
    puts("Enter 7 to delete node at index i")
    puts("Enter 0 to exit the code\n")
    puts()


    #instance of the linkedlist class
    linkedList = LinkedList.new


    #infinite loop
    while(true)
        print("Enter your option : ")
        option = gets().chomp().to_i

        case option

        when 1
            puts("Enter the node to add at begin: ")
            node = gets().chomp().to_i
            linkedList.add_at_begin(node)
            linkedList.display()
        when 2
            puts("Enter node, index at same line to add")
            node,index = gets().chomp().split().map(&:to_i)
            linkedList.insert_at_index(node,index)
            linkedList.display()
        when 3
            puts("Enter the node to add at end: ")
            node = gets().chomp().to_i
            linkedList.add_at_end(node)
            linkedList.display()
        when 4
            linkedList.reverse()
            linkedList.display()
        when 5
            linkedList.delete_at_begin()
            linkedList.display()
        when 6
            linkedList.delete_at_end()
            linkedList.display()
        when 7 
            puts("Enter the index to be deleted: ")
            index = gets().chomp().to_i
            linkedList.delete_at_index(index)
            linkedList.display()
        when 0
            puts("Program has ended")
            puts("----------------------------------------------\n")
            break
        else
            puts("invalid input")
        end 
        
    end

end


#explicitly calling main
main_function()