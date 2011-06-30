class Tree
  attr_accessor :children, :name
  
  def initialize(name, tree)
    @name = name
    @children = []
    tree.each do |name, leaves|
      @children.push Tree.new(name, leaves)
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each { |n| n.visit_all &block }
  end
  
  def visit(&block)
    block.call self
  end
end

tree = Tree.new('root',
  {'grandpa' => 
    {'dad' => 
      {'child1' => {}, 'child2' => {}}
    }
  })

tree.visit_all { |n| puts n.name }