require "admin_lte_dsl/helpers"
require "admin_lte_dsl/dsl/navbar"

module AdminLteDsl
  class Railtie < ::Rails::Railtie
    initializer "admin_lte_dsl.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include AdminLteDsl::Helpers
      end
    end
  end
end
