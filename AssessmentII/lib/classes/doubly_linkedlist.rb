

=begin

Write a Program to create a Doubly Linked List and perform the following operations on the same:
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





#importing from the module
require_relative '../modules/doubly_linkedlist_operations'


#class for creating node
class Node 
    attr_accessor :data
    attr_accessor :next
    attr_accessor :prev

    #parameterized constrctor
    def initialize(data = 0)
        @data = data
        @next = nil
        @prev = nil
    end 
end



#class that creates doublyLinkedlist
class DoublyLinkedList

    #imported from module for implementing abstract methods
    include DoublyLinkedListOperations
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


    #method that displays the Doubly linked list
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
            @root.prev = new_node
            @root = new_node
        end
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
            new_node.prev = ptr
        end
    end
    

    #method that insert a node at an index
    def insert_at_index(data,index)
        new_node = Node.new(data)

        ptr = @root
        if(index==0)
            new_node.next = @root
            @root.prev = new_node
            @root = new_node
        elsif(index > get_size()-1)
            puts("index is not allowed")
        else 
            index.times do
                ptr = ptr.next
            end
            new_node.next  = ptr.next
            new_node.prev  =ptr
            ptr.next = new_node
            if(new_node.next.next)
                new_node.next.prev = new_node
            end
        end
    end 


    #delete a node at the beginning
    def delete_at_begin()
        if(is_empty())
            return
        end
        @root = @root.next
        @root.prev  = nil
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

        if(index > get_size()-1 && index < 0)
            puts("index not allowed")
        elsif(index==0)
            @root = @root.next
            @root.prev = nil
        else
            ptr = @root
            (index - 1 ).times do
                ptr = ptr.next
            end
            
            if(ptr.next!=nil)
    
                ptr.next = ptr.next.next
                if(ptr.next != nil)
                    ptr.next.prev = ptr
                end
            else
                ptr.prev.next  = nil
            end
        end
    end



    #method that reverses the nodes
    def reverse()
        current = @root
        while current
            temp = current.next
            current.next = current.prev
            current.prev = temp
            @root = current if temp.nil?
            current = temp
        end
    end

end



#main function
def main()
    print("----------------Doubly Linked List Operations-----------------\n")
    puts("[1] add at beginning")
    puts("[2] add node at index i")
    puts("[3] add node at ending")
    puts("[4] reverse the nodes")
    puts("[5] delete node at the beginning")
    puts("[6] delete node at the ending")
    puts("[7] delete node at index i")
    puts("[0] to exit the program\n")

    puts("---------------------------------------------------------------")


    #instance of the doubly linkedlist class
    doublyLinkedList = DoublyLinkedList.new


    #infinite loop
    while(true)
        print("Enter option : ")
        option = gets().chomp().to_i

        case option

        when 1
            puts("Enter the node to add at begin: ")
            node = gets().chomp().to_i
            doublyLinkedList.add_at_begin(node)
            doublyLinkedList.display()
        when 2
            puts("Enter node, index at same line to add")
            node,index = gets().chomp().split().map(&:to_i)
            doublyLinkedList.insert_at_index(node,index)
            doublyLinkedList.display()
        when 3
            puts("Enter the node to add at end: ")
            node = gets().chomp().to_i
            doublyLinkedList.add_at_end(node)
            doublyLinkedList.display()
        when 4
            
            doublyLinkedList.reverse()
            doublyLinkedList.display()
        when 5
            doublyLinkedList.delete_at_begin()
            doublyLinkedList.display()
        when 6
            doublyLinkedList.delete_at_end()
            doublyLinkedList.display()
        when 7 
            puts("Enter the index to be deleted: ")
            index = gets().chomp().to_i
            doublyLinkedList.delete_at_index(index)
            doublyLinkedList.display()
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
main()