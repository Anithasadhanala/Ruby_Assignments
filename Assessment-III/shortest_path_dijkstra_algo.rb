=begin
Write a Program to take the adjacency matrix of a weighted graph
as input and find the shortest path in the same using Dijkstra’s algorithm
=end

# class that implements Dijkstra
class Dijkstra


    # parameterised constructor
    def initialize(graph, vertices)
        @graph = graph
        @vertices = vertices
    end

    
    # method that finds min distance and returns its index
    def min_distance(dis, vis)
        mini = Float::INFINITY
        min_index = -1

        @vertices.times do |v|
        if !vis[v] && dis[v] <= mini
            mini = dis[v]
            min_index = v
        end
        end

        min_index
    end


    # method that finds shortest path
    def shortest_path(start_vertex)
        dis = Array.new(@vertices, Float::INFINITY)  
        dis[start_vertex] = 0 
        vis = Array.new(@vertices, false) 
    
        @vertices.times do
        u = min_distance(dis, vis)
        vis[u] = true
    
        @graph[u].each_with_index do |weight, v|
            if !vis[v] && weight != 0 && dis[u] != Float::INFINITY && dis[u] + weight < dis[v]
            dis[v] = dis[u] + weight
            end
        end
        end
    
        print_solution(dis)
    end
    
      
    

    # method that prints the result
    def print_solution(dis)
        puts "Vertex of graph:     Distance from Source : "
        dis.each_with_index do |distance, vertex|
        puts "#{vertex}     #{distance}"
        end
    end
end



# entry point is a start point of the progrsm
def entry_point

    puts("----------------------------Dijkstra algo (Graphs) ----------------------------------")
    puts("Enter number of nodes: ")
    size = gets.chomp.to_i
  
    graph = Array.new(size) { [] }
    puts("Enter the adjacency matrix")
  
    for i in (0...size)
      arr = gets.chomp.split.map(&:to_i)
      graph[i] = arr
    end

    puts("Enter the start vertex : ")
    start_vertex = gets.chomp.to_i

    instance = Dijkstra.new(graph,size)

    instance.shortest_path(start_vertex)
    
  
    
    puts("------------------------- Program Ends ------------------------")
  end
  

  # explicilty calling the main
  entry_point
  