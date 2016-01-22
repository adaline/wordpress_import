module WordpressImport
  class Category
    attr_accessor :id, :nicename, :parent, :name

    def initialize(node)
      @id = node.xpath('wp:term_id').first.content
      @nicename = node.xpath('wp:category_nicename').first.content
      @parent = node.xpath('wp:category_parent').first.content
      @name = node.xpath('wp:cat_name').first.content
    end
  end
end
