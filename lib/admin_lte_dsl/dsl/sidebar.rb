require "admin_lte_dsl/dsl/base"

module AdminLteDsl
  module DSL
    class Sidebar < Base
      class TreeViewItems < Base
        def builder(&block)
          @nav_items = []

          block.call(self) if block

          @nav_items
        end

        def nav_item(text, path, bootstrap_icon = nil)
          locals = {
            text: text,
            path: path,
            bootstrap_icon: bootstrap_icon,
          }

          @nav_items << @view_context.render(partial: AdminLteDsl.config.dsl.sidebar.nav_item_path, locals: locals)
        end
      end

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
        locals = {
          text: text
        }
        @nav_items << @view_context.render(partial: AdminLteDsl.config.dsl.sidebar.nav_header_path, locals: locals)
      end

      def nav_item(text, path, bootstrap_icon = nil)
        locals = {
          text: text,
          path: path,
          bootstrap_icon: bootstrap_icon,
        }

        @nav_items << @view_context.render(partial: AdminLteDsl.config.dsl.sidebar.nav_item_path, locals: locals)
      end

      def nav_tree_view(text, bootstrap_icon = nil, &block)
        locals = {
          text: text,
          bootstrap_icon: bootstrap_icon,
          tree_view_items: TreeViewItems.new(@view_context).builder(&block),
        }

        @nav_items << @view_context.render(partial: AdminLteDsl.config.dsl.sidebar.nav_tree_view_path, locals: locals)
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
