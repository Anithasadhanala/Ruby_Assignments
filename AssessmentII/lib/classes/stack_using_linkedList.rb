require_relative "../modules/stack_operations"
require_relative "linked_list"



class Stack 

    include StackOperations


    def initialize()
        @stack = LinkedList.new
    end


    #method that display the stack items
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


def main()
    puts("--------------------------------------------")

    puts("Enter 1 for push in stack")
    puts("Enter 2 for poping out of stack")
    puts("Enter 3 to get peek element")
    puts("Enter 0 for exit-----------------")


    stack = Stack.new()

    while(true)
        puts("Enter your option : ")
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

        puts("-----------------------------------------")

    end

end


puts("ki")


main()
puts("ko")

