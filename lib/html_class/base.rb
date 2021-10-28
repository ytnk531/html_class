module HtmlClass
  class Base
    def initialize(*static_classes, **dynamic_classes)
      @static_classes = static_classes
      @dynamic_classes = dynamic_classes
    end

    def to_s
      active_class_names = dynamic_classes.map do |class_name, predicate|
        class_name if predicate.call
      end.compact

      (static_classes + active_class_names).join(" ")
    end

    private

    attr_accessor :static_classes, :dynamic_classes
  end
end
