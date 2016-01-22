module WordpressImport
  class Tag
    attr_accessor :id, :slug, :name

    def initialize(node)
      @id = node.xpath('wp:term_id').first.content
      @slug = node.xpath('wp:tag_slug').first.content
      @name = node.xpath('wp:tag_name').first.content
    end
  end
end
