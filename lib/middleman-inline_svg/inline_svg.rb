require "nokogiri"

class InlineSVG
  attr_reader :file_name, :options, :title

  def initialize(file_name, options = {})
    @file_name = file_name
    @title = options.delete(:title)
    @options = options
  end

  def to_html
    doc = asset_doc(file_name)
    svg = doc.at_css("svg")

    if title
      add_title(doc, svg, title)
    end

    options.each do |key, value|
      svg[key.to_s.tr("_", "-")] = value
    end

    doc.to_html
  end

  private

  def add_title(doc, svg, title)
    title_node = ::Nokogiri::XML::Node.new "title", doc
    title_node.content = title

    svg.search("title").each(&:remove)
    svg.prepend_child(title_node)
  end

  def asset_doc(file_name)
    File.open(file_name) do |f|
      ::Nokogiri::XML(f)
    end
  end
end
