# Nathaniel Morrow
# 7 Languages in 7 weeks
# Ruby Day 2: Self Study

# Q: Find out how to access files with and without code blocks. What is the benefit of the code block?
# A: file = File.open("filename"), can be accessed with file.read. COde blocks allows more flexibility in your interaction with the file, you can just pass standard blocks of code.

# Q: how would you translate a hash to  an array? Can you translate arrays to hashes?
# A: You could use the each operator to place each item into an index in an array. Yes, there is a to_h method for the array class.

# Q: Can you iterate through a hash?
# A: Yes, by doing using .each 
# ex: hash.each { |key, val| puts "#{key} #{val}'" }

# Q: You can use Ruby arrays as stacks. What other common data structures do arrays support?
# A: Arrays in ruby can be used as stacks, queues, and sets. 
# Operations such as push and pop can be used.

#--------------------------------#
# Print the contents of an array of 16 numbers, four numbers at a time, using each. Now do the same with each_slice in Enumerable.
#--------------------------------#

arr = (0..15)

# using each
i = 0
arr.each do |a| 
    print "#{a} "
    puts if (i%4 == 3)
    i += 1
end

puts

# using each_slice
arr.each_slice(4) do |a|
    print a
    puts
end

puts
puts
#--------------------------------#
#The Tree class was interesting. But it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure of hashes. You should be able to speciy a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}
#--------------------------------#

#puts "Original tree (given code):\n\n"
#class Tree
#    attr_accessor :children, :node_name

#    def initialize(name, children=[])
#        @children  = children
#        @node_name = name
#    end

#    def visit_all(&block)
#        visit &block
#        children.each {|c| c.visit_all &block}
#    end

#    def visit(&block)
#        block.call self
#    end
#end

#ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
#ruby_tree.visit_all {|node| puts node.node_name}

#--------------------------------#

puts "Hash Tree:"

class HashTree
    attr_accessor :children, :node_name

    def initialize( tree = {} )
        @node_name = tree.keys().first
        @children  = []
        tree[@node_name].each{ |key, val| 
            @children.push(HashTree.new({key => val}))
        }
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

puts

myTree = HashTree.new({
    'grandpa' => {
        'dad' => {
            'child 1' => {},
            'child 2' => {}
        },
        'uncle' => {
            'first cousin 1' => {
                'second cousin 1' => {},
                'second cousin 2' => {
                    'third cousin 1' => {}
                }
            },
            'first cousin 2' => {}
        }
    }
})

myTree.visit_all {|node| puts node.node_name}
puts
puts


#--------------------------------#
#Write a  simple grep that will print lines of a file having any occurances of a phrase anywhere in that line. You will need to do a simple regular expression to match and read lines form a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
#--------------------------------#
file = File.open("text.txt")
file_data = file.readlines
file.close

file_data.each {|a| puts a if a.match(/[A-Z][A-Z a-z,;'"]*[.?!]/x)}

