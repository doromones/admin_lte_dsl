require "admin_lte_dsl/dsl/base"

module AdminLteDsl
  module DSL
    class Navbar < Base
      def builder(&block)
        @links = []
        block.call(self) if block

        @view_context.render(partial: AdminLteDsl.config.dsl.navbar.path, locals: locals)
      end

      def link(name = nil, path = nil, options = {}, &block)
        if block
          @links << @view_context.instance_eval(&block)
        else
          options[:class] ||= "nav-link"
          @links << @view_context.link_to(name, path, class: options[:class])
        end
      end

      private

      def locals
        {
          links: @links
        }
      end
    end
  end
end
