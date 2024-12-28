require "admin_lte_dsl/dsl/base"

module AdminLteDsl
  module DSL
    class Sidebar < Base
      def builder(&block)
        @nav_items = []

        block.call(self) if block

        @view_context.render(partial: AdminLteDsl.config.dsl.sidebar.path, locals: locals)
      end

      def brand_link(&block)
        @brand_link = @view_context.instance_eval(&block) if block
      end

      def brand_logo_src(&block)
        @brand_logo_src = @view_context.instance_eval(&block) if block
      end

      def brand_logo_alt(&block)
        @brand_logo_alt = @view_context.instance_eval(&block) if block
      end

      def brand_name(&block)
        @brand_name = @view_context.instance_eval(&block) if block
      end

      def nav_header(text)
        @nav_items << "<li class=\"nav-header\">#{text}</li>".html_safe
      end

      private

      def locals
        {
          theme: @theme,
          brand_link: @brand_link,
          brand_logo_src: @brand_logo_src,
          brand_logo_alt: @brand_logo_alt,
          brand_name: @brand_name,
          nav_items: @nav_items
        }
      end
    end
  end
end
