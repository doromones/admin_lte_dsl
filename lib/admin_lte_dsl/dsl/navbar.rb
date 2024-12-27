module AdminLteDsl
  module DSL
    class Navbar
      def initialize(view_context)
        @links = []
        @view_context = view_context
      end

      def builder(&block)
        block.call(self) if block
        template.html_safe
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

      def build_links
        @links.map do |link|
          <<~HTML
              <li class="nav-item">#{link}</li>
          HTML
        end
      end

      def template
        <<~HTML
          <nav class="app-header navbar navbar-expand bg-body">
            <div class="container-fluid">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
                    <i class="bi bi-list"></i>
                  </a>
                </li>
                <li class="nav-item d-none d-md-block">
                   #{build_links.join}
                </li>
              </ul>
            </div>
          </nav>
        HTML
      end
    end
  end
end
