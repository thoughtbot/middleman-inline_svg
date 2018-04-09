require "middleman-core"
require "nokogiri"

class MiddlemanInlineSVG < ::Middleman::Extension
  def initialize(app, options_hash = {}, &block)
    super
  end

  def inline_svg(file_name, options = {})
    doc = asset_doc(file_name)
    svg = doc.at_css("svg")

    title = options.delete(:title)

    if title.present?
      add_title(doc, svg, title)
    end

    options.each do |key, value|
      svg[key.to_s.tr("_", "-")] = value
    end

    doc.to_xml
  end

  private

  def add_title(doc, svg, title)
    title_node = Nokogiri::XML::Node.new "title", doc
    title_node.content = title

    svg.search("title").each { |node| node.remove }
    svg.prepend_child(title_node)
  end

  def asset_doc(file_name)
    File.open(asset_file(file_name)) do |f|
      Nokogiri::XML(f)
    end
  end

  def asset_file(file_name)
    File.join(app.config[:source], app.config[:images_dir], file_name)
  end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

MiddlemanInlineSVG.register(:inline_svg)
