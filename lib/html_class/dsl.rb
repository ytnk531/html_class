module HtmlClass
  module Dsl
    module_function

    def static
      -> { true }
    end

    def html_class(*static_classes, **dynamic_classes)
      HtmlClass::Base.new(*static_classes, **dynamic_classes).to_s
    end
  end
end
