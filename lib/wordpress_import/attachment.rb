module WordpressImport
  class Attachment
    attr_accessor :id, :parent, :url, :date, :creator, :name, :meta

    def initialize(node)
      @id = node.xpath('wp:post_id').first.content.to_i
      @parent = node.xpath('wp:post_parent').first.content
      @url = node.xpath('wp:attachment_url').first.content
      @date = node.xpath('wp:post_date').first.content
      @creator = node.xpath('dc:creator').first.content
      @name = node.xpath('wp:post_name').first.content

      @meta = {}
      node.xpath('wp:postmeta').each do |postmeta|
        @meta[postmeta.xpath('wp:meta_key').first.content] = postmeta.xpath('wp:meta_value').first.content
      end
    end
  end
end
