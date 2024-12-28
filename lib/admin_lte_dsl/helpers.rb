require 'admin_lte_dsl/dsl/navbar'
require 'admin_lte_dsl/dsl/sidebar'

module AdminLteDsl
  module Helpers
    def admin_lte_navbar(&block)
      AdminLteDsl::DSL::Navbar
        .new(self)
        .builder(&block)
    end

    def admin_lte_sidebar(&block)
      AdminLteDsl::DSL::Sidebar
        .new(self)
        .builder(&block)
    end
  end
end
