

=begin
Write a Program to delete a specific node in a Binary Search Tree.
Once deleted, please re-balance the tree if the need arises
=end




#importing the helper class
require_relative "../helpers/construct_binary_tree"


# class to delete a node from the BST
class DeleteNodeBST
  # method to find the min node
  def find_min(node)
    current = node
    current = current.left until current.left.nil?
    current
  end

  # method to delete a specific node
  def delete_specific_node(node, val)
    return node if node.nil?

    # finding existence of deleting node
    if val < node.val
      node.left = delete_specific_node(node.left, val)
    elsif val > node.val
      node.right = delete_specific_node(node.right, val)
    else
      # Node has no children or only one child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # Node has two children
      successor = find_min(node.right)
      node.val = successor.val
      node.right = delete_specific_node(node.right, successor.val)
    end
    node
  end
end



# main function
def main

  puts("---------------Delete a Specific node from BST------------------","\n")
  puts("Enter the node to be deleted: ")
  delete_node = gets.chomp.to_i
  puts( "Enter the nodes of BST: ")
  arr = gets.chomp.split.map(&:to_i)

  # Constructing BST using Helper function
  # Assuming BinaryTree is defined with construct_binary_tree method
  binary_tree = BinaryTree.new
  root = binary_tree.construct_binary_tree(arr)

  # inorder arr traversal before the node deletion
  puts "Inorder traversal Before the Node Deletion"
  inorder_arr_before_deletion = binary_tree.inorder_traversal(root, [])
  binary_tree.print_arr(inorder_arr_before_deletion)

  # creating instance of DeleteNodeBST and deleting specific node
  puts "Inorder traversal After the Node Deletion"
  delete_node_instance = DeleteNodeBST.new
  root = delete_node_instance.delete_specific_node(root, delete_node)

  # inorder arr traversal after the node deletion
  inorder_arr_after_deletion = binary_tree.inorder_traversal(root, [])
  binary_tree.print_arr(inorder_arr_after_deletion)

  if inorder_arr_before_deletion.size == inorder_arr_after_deletion.size
    puts "--------No such node in the BST-------"
  else
    puts "---------Program has ended---------"
  end
end

# explicitly calling main function
main
