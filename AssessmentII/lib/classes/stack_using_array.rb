require_relative '../modules/stack_operations'




=begin

Write a Program to Implement Stack with an Array and perform the following operations:
Push Data
Pop Data
Peek Data

=end




#class for stack implementations
class Stack

    #imported from module and implemented abstract methods
    include StackOperations


    #getter access variables
    attr_accessor :stack
    attr_accessor :top
    

    def initialize(size)
        @stack = Array.new(size,0)
        @top = -1
    end


    #method that returns the size of the stack
    def get_size()
        return top+1
    end

    

    #method that prints the elements in stack
    def display()
        puts("Elements in stack : ")
        if(get_size==-1)
            puts("Stack is empty")
            return
        end
        for i in (top).downto(0)
            print(@stack[i]," ")
        end
        puts()
    end   


    #method that pushes the data into stack
    def push_element(data)
        if(@top+1 > get_size())
            puts("stack is out of bounds, no space to push")
        else
            @top = @top + 1
            @stack[@top]  = data
        end
        return data
    end



    #method that pops the element from the stack
    def pop_element()
        res = -1
        if(@top<0)
            res = "stack is under bounds, no elements to pop"
        else
            res = @stack[@top]
            @stack[@top] = 0
            @top-=1
        end
        return res
    end


    #method that prints the peek element from the stack
    def peek_element()
        res = 0
        if(@top<0)
            res =  "stack is empty"
        else
            res =  @stack[@top]
        end
    end
end





#main function
def main()

    puts("--------------------------------------------------")

    puts("Enter the size of a stack")
    size = gets().chomp().to_i


    puts("Enter 1 to push an element")
    puts("Enter 2 to pop an element")
    puts("Enter 3 to get peek element")
    puts("Enter 0 to exit")
    puts()


    #instance of Stack class
    stack = Stack.new(size)

    while(true)
        puts("Enter your option : ")
        option = gets().chomp().to_i

        case option
        when 1
            puts("Enter the element to push : ")
            element = gets().chomp().to_i
            stack.push_element(element)
            stack.display()
        when 2
            topEle = stack.peek_element
            print("poped element : ", stack.pop_element(),"\n")
            stack.display()
        when 3
            puts("peek element : ", stack.peek_element())
        when 0
            puts("program ended")
            break
        else
            puts("Entered input not allowed")
        end
    end
    puts("--------------------------------------------------------")
end


#explicitly calling main
main()