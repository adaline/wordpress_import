module WordpressImport
  class Author
    attr_accessor :id, :login, :email, :display_name

    def initialize(node)
      @id = node.xpath('wp:author_id').first.content
      @login = node.xpath('wp:author_login').first.content
      @email = node.xpath('wp:author_email').first.content
      @display_name = node.xpath('wp:author_display_name').first.content
    end
  end
end
