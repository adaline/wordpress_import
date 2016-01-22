module WordpressImport
  class Post
    attr_accessor :id, :parent, :link, :date, :creator, :name, :title, :content, :excerpt, :status, :meta, :tags, :categories

    def initialize(node)
      @id = node.xpath('wp:post_id').first.content
      @parent = node.xpath('wp:post_parent').first.content
      @link = node.xpath('link').first.content
      @date = node.xpath('wp:post_date').first.content
      @creator = node.xpath('dc:creator').first.content
      @name = node.xpath('wp:post_name').first.content
      @status = node.xpath('wp:status').first.content

      @title = node.xpath('title').first.content
      @content = node.xpath('content:encoded').first.content
      @excerpt = node.xpath('excerpt:encoded').first.content

      @tags = node.xpath('category[@domain="post_tag"]').map { |t| t.attr('nicename') }
      @categories = node.xpath('category[@domain="category"]').map { |t| t.attr('nicename') }
      @meta = {}
      node.xpath('wp:postmeta').each do |postmeta|
        @meta[postmeta.xpath('wp:meta_key').first.content] = postmeta.xpath('wp:meta_value').first.content
      end
    end
  end
end
