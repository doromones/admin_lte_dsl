module AdminLteDsl
  module DSL
    class Base
      def initialize(view_context)
        @view_context = view_context
        @theme = AdminLteDsl.config.theme
      end
    end
  end
end