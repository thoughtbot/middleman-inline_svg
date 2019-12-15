# Middleman Inline SVG

[![CircleCI](https://circleci.com/gh/thoughtbot/middleman-inline_svg.svg?style=svg)](https://circleci.com/gh/thoughtbot/middleman-inline_svg)

A [Middleman] extension embed SVG documents in your Middleman views.

[Middleman]: https://middlemanapp.com/

## Installation

1. Add `middleman-inline_svg` to your `Gemfile` and run Bundler:

    ```ruby
    gem "middleman-inline_svg"
    ```

    ```bash
    bundle install
    ```

1. Activate the extension in `config.rb`:

    ```ruby
    activate :inline_svg
    ```

## Usage

`middleman-inline_svg` provides an `inline_svg` helper that you can use in your
templates. Using it will inline your SVG document directly into the HTML
enabling you to style it with CSS and pass in HTML attributes.

Given the following SVG file named `heart.svg`:

```xml
<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
</svg>
```

And the following code in a Middleman template:

```erb
<%= inline_svg "heart.svg", class: "icon icon--small" %>
```

Middleman will output the following:

```html
<svg class="icon icon--small" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
</svg>
```

It's possible to specify a title for the SVG. And any other options passed will
be rendered as attributes on the `<svg>` element. Adding a title to your SVG
will improve accessibility.

```erb
<%= inline_svg(
  "heart.svg",
  role: "img",
  title: "Like this comment",
) %>
```

```html
<svg role="img" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <title>Like this comment</title>
  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
</svg>
```

Underscores are translated into hyphens in the output.

```erb
<%= inline_svg(
  "heart.svg",
  aria_hidden: true,
) %>
```

```html
<svg aria-hidden="true" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <title>Like this comment</title>
  <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
</svg>
```

## Configuration

You can configure the default attributes/title in the Middleman `config.rb` file
when the extension is activated:

```ruby
activate :inline_svg do |config|
  config.defaults = {
    role: img,
  }
end
```
