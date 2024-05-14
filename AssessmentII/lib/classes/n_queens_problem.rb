=begin

Write a Program to solve N-Queen’s Problem. Explanation: 
https://en.wikipedia.org/wiki/Eight_queens_puzzle
Input: We should take the size of the board as an input (Minimum value should be 4)
Output: We should return the index where the queen will be placed

=end




# class for N queens
class NQueens
    attr_reader :grid, :n
  
    #constructor
    def initialize(n)
      @n = n
      @grid = Array.new(n) { Array.new(n, 0) }
    end
  

    def solve
        queen_positioning(0)
    end



    # method that checks the positioning a queen at [i][j] is safe or not
    def is_safe?(row, col)

        # row wise searching 
        (0...col).each do |c|
          return false if grid[row][c] == 1
        end
    
        # upper diagonal wise checking
        (row.downto(0)).each do |r|
          return false if col - (row - r) >= 0 && grid[r][col - (row - r)] == 1
        end
    
        # lower diagonal wise checking
        (row...n).each do |r|
          return false if col - (r - row) >= 0 && grid[r][col - (r - row)] == 1
        end
        return true
    end

  
  
    # method to finding the queen possible positions
    def queen_positioning(col)
      return true if col >= n
  
      (0...n).each do |row|
        if is_safe?(row, col)
          grid[row][col] = 1
  
          if queen_positioning(col + 1)
            return true
          end
          grid[row][col] = 0
        end
      end
      return false
    end
  
  
    # method that prints the grid of queens
    def print_final_grid
      if solve
        grid.each { |row| puts row.join(' ') }
      else
        puts "No ans exists"
      end
    end
  end
  


def main()

    #input from the user
    size = gets().chomp().to_i


    # validating the user input
    if(size<4)
        raise "Invalid input, enter >="
    end

    # calling n_queen class for possible queen positions
    n_queens_instance = NQueens.new(size)


    #printing the available queens
    n_queens_instance.print_final_grid
end



#explicitly calling the main
main()

