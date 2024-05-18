
=begin

Write a Program to Implement Queue with an Array and perform the following operations:
Enqueue Data
Dequeue Data
Show Data

=end



# imported the module
require_relative '../modules/queue_operations'



#class for Queue implementations
class Queue

    include QueueOperations

    #getter access variables
    attr_accessor :queue
    attr_accessor :top
    

    def initialize(size)
        @queue = Array.new(size,0)
        @top = -1
    end


    #method that returns the size of the queue
    def get_size()
        return top+1
    end

    

    #method that prints the elements in queue
    def display()
        puts("Elements in queue : ")
        if(get_size==-1)
            puts("queue is empty")
            return
        end
        for i in (0..top)
            print(@queue[i]," ")
        end
        puts()
    end   


    #method that pushes the data into queue
    def enqueue(data)
        if(@top+1 > get_size())
            puts("queue is out of bounds, no space to push")
        else
            @top = @top + 1
            @queue[@top]  = data
        end
        return data
    end



    #method that pops the element from the queue
    def dequeue()
        res = -1
        if(@top<0)
            res = "queue is under bounds, no elements to pop"
        else
            @top -=1
            res = queue.shift()
        end
        return res
    end
end





#main function
def main()

    puts("-----------------Queue Operations (ARRAY)----------------------")

    puts("Enter the size of a queue : ")
    size = gets().chomp().to_i


    puts("[1] Enqueue an element")
    puts("[2] Dequeue an element")
    puts("[3] Display queue")
    puts("[0] to exit program")
    puts("--------------------------------------------------------------")


    #instance of Stack class
    queue = Queue.new(size)

    while(true)
        puts("Enter  option : ")
        option = gets().chomp().to_i

        case option
        when 1
            puts("Enter the element to Enqueue : ")
            element = gets().chomp().to_i
            queue.enqueue(element)
            queue.display()
        when 2
            
            print("Dequeued element : ", queue.dequeue(),"\n")
            queue.display()
        when 3
            puts("Elements in the queue")
            queue.display()
            
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