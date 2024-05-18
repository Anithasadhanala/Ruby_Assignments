
=begin

Write a Program to Implement Queue with a Linked List and perform the following operations:
Enqueue Data
Dequeue Data
Show Data

=end



# Node class represents each element of the linked list
class Node
    attr_accessor :data, :next
  
    def initialize(data)
      @data = data
      @next = nil
    end
end
  


# class that creates and handles the queue operations
class Queue
    attr_accessor :front, :rear
  
    def initialize
      @front = nil
      @rear = nil
    end
  

    # Method to check if the queue is empty
    def empty?
      @front.nil?
    end
  

    # Method to enqueue an element to the rear of the queue
    def enqueue(data)
      new_node = Node.new(data)
      if empty?
        @front = new_node
        @rear = new_node
      else
        @rear.next = new_node
        @rear = new_node
      end
    end
  

    # Method to dequeue an element from the front of the queue
    def dequeue
      return nil if empty?
  
      data = @front.data
      if @front == @rear
        @front = nil
        @rear = nil
      else
        @front = @front.next
      end
      data
    end

  
    # Method to display the elements of the queue
    def display
      current = @front
      puts 'Queue elements:'
      while current
        print "#{current.data} "
        current = current.next
      end
      puts
    end
end



# main function
def main()

    puts("-------------------Queue operatins (LinkedList)-----------------------")
    puts ("[1] for enqueue ")
    puts("[2] for dequeue")
    puts("[3] for display")
    puts("[0] to exit program")
    puts("----------------------------------------------------------------------")


    # instance of Queue Class
    queue = Queue.new()


    #infinite loop until user enters [0] to exit
    while(true)


        puts("Enter option : ")
        option = gets.chomp().to_i

        case option
        when 1
            puts("Enter the node to enqueu : ")
            node =  gets().chomp().to_i
            queue.enqueue(node)
            queue.display()
        when 2
            queue.dequeue()
            puts("Queue after dequeue")
            queue.display()
        when 3
            puts("Queue elements")
            queue.display()
        when 0
            puts("program ends")
            break
        else
            puts("invalid input")
        end 
    end 
end



#explicitly calling the main
main()

  
  