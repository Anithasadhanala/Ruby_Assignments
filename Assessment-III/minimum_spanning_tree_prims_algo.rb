
=begin
Write a Program to take the adjacency matrix of a weighted graph
 as input and find the MST using Prim’s Algorithm
=end



# class that findsMST
class PrimsAlgo


    # method prims algo using space  O(n)
    def prims_mst_algo(graph, vertices)
        key = Array.new(vertices, Float::INFINITY) 
        large = Array.new(vertices, -1)          
        vis = Array.new(vertices, false)      
    
        key[0] = 0     
        large[0] = -1 
    
        (vertices - 1).times do
          
          u = find_min_key(key,vis, vertices)
    
          vis[u] = true 
    
          
          graph[u].each_with_index do |w, v|
            if w != 0 && vis[v] == false && w < key[v]
                large[v] = u
              key[v] = w
            end
          end
        end
    
        print_mst(large, graph)
      end
    
     
      # method that finds the min key among vertices
      def find_min_key(key, vis, vertices)
        min = Float::INFINITY
        min_index = -1
    
        vertices.times do |v|
          if vis[v] == false && key[v] < min
            min = key[v]
            min_index = v
          end
        end
        min_index
      end
    
      # method for printing result
      def print_mst(large, graph)
        puts "Edge of graph  \tWeight"
        (1...large.length).each do |i|
          puts "#{large[i]} - #{i} \t#{graph[i][large[i]]}"
        end
      end
end


# entry point is a start point of the progrsm
def entry_point

    puts("----------------------------MST (Graphs) ----------------------------------")
    puts("Enter number of nodes: ")
    size = gets.chomp.to_i
  
    graph = Array.new(size) { [] }
    puts("Enter the adjacency matrix")
  
    for i in (0...size)
      arr = gets.chomp.split.map(&:to_i)
      graph[i] = arr
    end

    prim = PrimsAlgo.new
    prim.prims_mst_algo(graph,size)
  
    
    puts("------------------------- Program Ends ------------------------")
  end
  

  # explicilty calling the main
  entry_point
  