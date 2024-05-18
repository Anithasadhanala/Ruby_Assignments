=begin
Write a Program to Implement Stack with a Linked List and perform the following operations:
Push Data
Pop Data
Peek Data
=end



# importing modules and helper class
require_relative "../modules/stack_operations"
require_relative "linked_list"


# stack class
class Stack 

    #including module methods
    include StackOperations


    def initialize()
        @stack = LinkedList.new
    end


    # method that display the stack items
    def displaying()
        @stack.display()
    end  


     #method that pushes the data into stack
     def push_element(data)
        @stack.add_at_begin(data)
    end



    #method that pops the top element from the stack
    def pop_element()
        @stack.delete_at_begin()
    end
      


    #method that prints the peek element from the stack
    def peek_element()
        if(@stack)
            res = @stack.root.data
        else
            res = "stack is empty"
        end
        return res
    end
end




# main function
def main()
    puts("-------------------Stack Operations (Linked List)-------------------------")

    puts("[1] push into stack")
    puts("[2] oping out of stack")
    puts("[3] get peek element")
    puts("[0] exit program")
    puts("--------------------------------------------------------------------------")


    # instance of the stack class
    stack = Stack.new()


    # infinite loop, untill user enters [0]
    while(true)
        puts("Enter option : ")
        option = gets().chomp().to_i

        case option
        when 1
            puts("Enter the element to push : ")
            element = gets().chomp().to_i
            stack.push_element(element)
            stack.displaying()
        when 2
            print("poped element : \n",stack.pop_element(),"\n")
            stack.displaying()
        when 3
            print("peek element : \n",stack.peek_element(),"\n")
            stack.displaying()
        when 0
            puts("program ended")
            break
        else
            puts("Invalid input entered")
        end

        puts("-----------------------------------------------------")
    end
end


#explicitly calling main
main()


