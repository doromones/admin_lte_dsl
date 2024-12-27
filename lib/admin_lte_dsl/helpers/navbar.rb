module AdminLteDsl
  module Helpers
    module Navbar
      def admin_lte_navbar(&block)
        DSL::Navbar.new(self).builder(&block)
      end
    end
  end
end
