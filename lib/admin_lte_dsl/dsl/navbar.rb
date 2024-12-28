module AdminLteDsl
  module DSL
    class Navbar
      def initialize(view_context)
        @links = []
        @view_context = view_context
      end

      def builder(&block)
        block.call(self) if block

        @view_context.render(partial: AdminLteDsl.config.dsl.navbar.path, locals: { links: @links })
      end

      def link(name = nil, path = nil, options = {}, &block)
        if block
          @links << @view_context.instance_eval(&block)
        else
          options[:class] ||= "nav-link"
          @links << @view_context.link_to(name, path, class: options[:class])
        end
      end
    end
  end
end
