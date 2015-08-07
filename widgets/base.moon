import underscore from require "lapis.util"
import random from math

import Widget from require "lapis.html"

date = require "date"

class Base extends Widget
  @widget_name: => underscore @__name or "some_widget"

  inner_content: =>

  content: =>
    div class: "wrapper", ->
      div class: "columns", ->
        div class: "sidebar", ->
          h1 "Mr. Justin Keenan"
          div class: "navigation", ->
            div class: "item", ->
              a href: "", "About"

            div class: "item", ->
              a href: "", "Works"

            div class: "item", ->
              a href: "", "Twitter"

        div class: "main", ->
          element @elm_type or "div", {
            class: @widget_classes!
          }, @\inner_content

          if @js_init
            script type: "text/javascript", ->
              rawtext @js_init! or ""

  widget_classes: =>
    @@widget_name!

  widget_id: =>
    unless @_widget_id
      @_widget_id = "#{@@widget_name!}_#{random 0, 100000}"
    @_widget_id

  widget_selector: =>
    "'##{@widget_id!}'"

  url_for: (page_name) =>
    for page in *@site.pages
      if page.source\match "^#{page_name}"
        return "#{@root}/#{page\url_for!}"

    error "Failed to find page: #{page_name}"

