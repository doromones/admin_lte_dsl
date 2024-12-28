require "test_helper"
require "admin_lte_dsl/dsl/navbar"

class TestController < ActionController::Base
end

class AdminLteDsl::DSL::NavBarTest < ActiveSupport::TestCase
  test "AdminLteDsl::DSL::Navbar" do
    @controller_view = TestController.new.view_context

    result =
      AdminLteDsl::DSL::Navbar.new(@controller_view).builder do |b|
        b.link("Test Link", "#")
        b.link("Test Link 2", "#")
      end

    expectation = <<-HTML
<nav class="app-header navbar navbar-expand bg-body">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
          <i class="bi bi-list"></i>
        </a>
      </li>
        <li class="nav-item d-none d-md-block">
          <a class="nav-link" href="#">Test Link</a>
        </li>
        <li class="nav-item d-none d-md-block">
          <a class="nav-link" href="#">Test Link 2</a>
        </li>
    </ul>
  </div>
</nav>
HTML

    assert_equal expectation, result
  end
end
