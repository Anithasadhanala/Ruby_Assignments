=begin
Write a Program to take the adjacency matrix
 of a graph as input and perform Depth First Search
=end




# class that implements the DFS
class DepthFirstSearch

    # method that implements the bfs in graphs
    def depth_first_search_algo(graph, vis, nodes,ind,dfs)
        if( vis[ind] != -1) 
            return
        end
        dfs.push(ind+1)
        vis[ind] = 1
        graph[ind].each_with_index do |i,val|
            if(i!=0 && vis[val]==-1)
                depth_first_search_algo(graph,vis,nodes,val,dfs)
            end 
    
        end
    end
end
  



# entry point is a start point of the progrsm
def entry_point

    puts("----------------------------DFS (Graphs) ----------------------------------")
    puts("Enter number of nodes: ")
    size = gets.chomp.to_i
  
    graph = Array.new(size) { [] }
    puts("Enter the adjacency matrix")
  
    for i in (0...size)
      arr = gets.chomp.split.map(&:to_i)
      graph[i] = arr
    end
  
    dfs = DepthFirstSearch.new
    vis = Array.new(size+1,-1)
    dfs_arr = []
    dfs.depth_first_search_algo(graph,vis,size,1,dfs_arr)
  
    puts("Array after depth First Search: ")
    print(dfs_arr, "\n")
  
    puts("------------------------- Program Ends ------------------------")
  end
  

  # explicilty calling the main
  entry_point
  