module AdminLteDsl
  module Helpers
    def admin_lte_navbar(&block)
      AdminLteDsl::DSL::Navbar
        .new(self)
        .builder(&block)
    end
  end
end
