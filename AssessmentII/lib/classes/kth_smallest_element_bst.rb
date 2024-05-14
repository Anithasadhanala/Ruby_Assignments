
=begin

Write a Program to find the Nth smallest element in a Binary Search Tree. 
Eg: Given n = 7, the output should be the 7th smallest element in the BST.
 We should throw an error if the tree does not have as many nodes as specified

=end



# imported the helper function
require_relative "../helpers/construct_binary_tree"



# main function
def main()


    # input from the user
    k  = gets().chomp().to_i
    arr = gets().chomp().split()

    
    #constructing BST
    binary_tree  = BinaryTree.new()
    root = binary_tree.construct_binary_tree(arr)


    #inorder traversal Arr
    inorder_arr = binary_tree.inorder_traversal(root,[])


    # inorder but, removing all the non integer values
    int_arr = inorder_arr.select { |x| x =~ /\A-?\d+\z/ }.map(&:to_i)
   


    #condition that handles the kth index smallest value in BST
    if(k > int_arr.size())
        raise "kth value is greater than the no, of nodes"
    else
        puts(int_arr[k-1])
    end
end



#explicitly calling the main
main()