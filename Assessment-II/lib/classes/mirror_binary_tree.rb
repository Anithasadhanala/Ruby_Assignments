
=begin
Write a Program to Mirror a Binary Tree
=end



# imported the helper class
require_relative "../helpers/construct_binary_tree"


#class that converts a BST to mirrorred BST
class MirrorBinaryTree

    #method that converts to mirror BST
    def mirror_tree(root)
        return nil if root.nil?
        temp = root.left
        root.left = mirror_tree(root.right)
        root.right = mirror_tree(temp)
        return root
    end
end



#main function
def main()

    #input from the user
    puts("Enter the arr of node values")
    arr = gets().chomp().split()


    #constructing BST
    binary_tree = BinaryTree.new()
    root = binary_tree.construct_binary_tree(arr)

    # creating Instance of mirror class
    mirror_tree_instance = MirrorBinaryTree.new()


    # printing the Inorder traversal Before the mirrorring
    puts("Binary Tree inorder before mirroring : ")
    before_mirror_arr = binary_tree.inorder_traversal(root,[])
    binary_tree.print_arr(before_mirror_arr)

    
    # mirrorring the tree
    mirrored_tree_root = mirror_tree_instance.mirror_tree(root)


    # printing the Inorder traversal After the mirrorring
    puts("Binary Tree inorder after mirrorring : ")
    after_mirror_arr = binary_tree.inorder_traversal(mirrored_tree_root,[])
    binary_tree.print_arr(after_mirror_arr)
end



#explicitly calling main
main()