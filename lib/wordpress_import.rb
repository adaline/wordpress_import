require 'nokogiri'
require 'time'

require 'wordpress_import/author'
require 'wordpress_import/category'
require 'wordpress_import/tag'
require 'wordpress_import/attachment'
require 'wordpress_import/about'
require 'wordpress_import/post'

module WordpressImport
  class << self
    def new(content)
      @doc = Nokogiri::XML(content)
      puts @doc.errors
      self
    end

    def authors
      @doc.xpath('//wp:author').map { |author| Author.new(author) }
    end

    def categories
      @doc.xpath('//wp:category').map { |category| Category.new(category) }
    end

    def tags
      @doc.xpath('//wp:tag').map { |tag| Tag.new(tag) }
    end

    def items
      @doc.xpath('//item').map do |item|
        case item.xpath('wp:post_type').first.content
        when 'attachment'
          Attachment.new(item)
        when 'about'
          About.new(item)
        when 'post'
          Post.new(item)
        end
      end
    end
  end
end
