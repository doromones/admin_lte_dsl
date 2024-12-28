require "admin_lte_dsl/helpers"

module AdminLteDsl
  class Railtie < ::Rails::Railtie
    initializer "admin_lte_dsl.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include AdminLteDsl::Helpers
      end
    end

    initializer "admin_lte_dsl.add_view_paths", after: :add_view_paths do |_app|
      ActiveSupport.on_load(:action_controller) do
        append_view_path AdminLteDsl.root.join("app/views").to_s
      end
    end
  end
end
