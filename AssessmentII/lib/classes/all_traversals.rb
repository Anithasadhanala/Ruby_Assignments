=begin
Write a Program to take a Binary Search Tree (BST) as input and perform the following operations:
Perform Pre-Order Traversal
Perform In-Order Traversal
Perform Post-Order Traversal
Please ensure we validate if the tree is a BST or not
=end


# taking help of another helper class
require_relative "../helpers/construct_binary_tree"



#main function
def main()

    #input from the user
    puts("---------------------Tree Traversals----------------------","\n")
    puts("Enter all the BST nodes : ")
    arr = gets().chomp().split()


    #constructing BST
    binary_tree  = BinaryTree.new()
    root = binary_tree.construct_binary_tree(arr)


    #inorder traversed Arr
    inorder_arr = binary_tree.inorder_traversal(root,[])


    #inorder traversed Arr with only integers
    int_arr = inorder_arr.select { |x| x =~ /\A-?\d+\z/ }.map(&:to_i)
   

    #checking for Valid BST
    flag = false
    for i in (1..int_arr.size-1).to_a
        if(int_arr[i-1] > int_arr[i])
            flag = true
            break
        end
    end
    if(flag == true)
        puts("--------This is not a Valid BST-------")
    else
        puts("-------This is a Valid BST-----------")
    end


    #pre order and posr order traversed Arrays
    pre_order_arr  = binary_tree.preorder_traversal(root,[])
    post_order_arr  = binary_tree.postorder_traversal(root,[])


    puts("Inorder Traversal of BST : ")
    binary_tree.print_arr(inorder_arr)

    puts("Preorder Traversal of BST: ")
    binary_tree.print_arr(pre_order_arr)

    puts("Postorder Traversal of BST: ")
    binary_tree.print_arr(post_order_arr)


end



#explicitly calling the main function
main()