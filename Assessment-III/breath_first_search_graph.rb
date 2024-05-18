=begin
Write a Program to take the adjacency matrix of a graph 
as input and perform Breadth-First Search
=end



# class that implements the BFS
class BreadthFirstSearch

    # method that implements the bfs in graphs
    def breadth_first_search_algo(graph, nodes)
      vis = Array.new(nodes+1, -1) 
      queue = []
      bfs = []
  
      queue.push(1)
      vis[1] = 1  
  
      while !queue.empty?
        front = queue.shift
        bfs.push(front)
  
        graph[front-1].each do |i|
          if (i!= 0 && vis[i] == -1)
            queue.push(i)
            vis[i] = 1 
          end
        end
      end
      bfs
    end
end
  

# entry point is a start point of the progrsm
def entry_point

    puts("----------------------------BFS (Graphs) ----------------------------------")
    puts("Enter number of nodes: ")
    size = gets.chomp.to_i
  
    graph = Array.new(size) { [] }
    puts("Enter the adjacency matrix")
  
    for i in (0..size)
      arr = gets.chomp.split.map(&:to_i)
      graph[i] = arr
    end
  
    bfs = BreadthFirstSearch.new
    bfs_arr = bfs.breadth_first_search_algo(graph, size)
  
    puts("Array after Breadth First Search: ")
    print(bfs_arr, "\n")
  
    puts("------------------------- Program Ends ------------------------")
  end
  

  # explicilty calling the main
  entry_point
  