require "middleman-inline_svg/inline_svg"

class MiddlemanInlineSVG < ::Middleman::Extension
  expose_to_template :inline_svg

  def initialize(app, options_hash = {}, &block)
    super
  end

  def inline_svg(file_name, options = {})
    InlineSVG.new(asset_file(file_name), options).to_html
  end

  private

  def asset_file(file_name)
    File.join(app.config[:source], app.config[:images_dir], file_name)
  end
end