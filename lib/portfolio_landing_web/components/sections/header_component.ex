defmodule PortfolioLandingWeb.Components.Sections.HeaderComponent do
  use Phoenix.Component
  use PortfolioLandingWeb, :verified_routes
  alias PortfolioLandingWeb.CoreComponents

  def header_component(assigns) do
    ~H"""
    <header
      class="fixed w-full z-50 bg-gray-900 bg-opacity-90 backdrop-blur-sm"
      x-data="{ isScrolled: false }"
      @scroll.window="isScrolled = (window.pageYOffset > 20)"
    >
      <div class="container mx-auto px-6 py-4">
        <div class="flex justify-between items-center text-white">
          <a href="#" class="text-2xl font-bold">AlissonMachado.dev</a>
          <!-- Mobile menu button -->
          <button phx-click="open-close-bar" class="md:hidden">
            <.icon name="hero-bars-3" class="w-6 h-6" />
          </button>
          <!-- Desktop menu -->
          <div class="hidden md:flex space-x-8">
            <a href="#services" class="hover:text-purple-600 transition">Services</a>
            <a href="#portfolio" class="hover:text-purple-600 transition">Portfolio</a>
          </div>
        </div>
        <!-- Mobile menu -->
        <div
          x-show={@mobile_menu_open}
          x-transition
          class={[
            "md:hidden mt-4 transition-all duration-300 ease-in-out",
            "transform origin-top",
            if(@mobile_menu_open, do: "opacity-100 scale-y-100", else: "opacity-0 scale-y-0 h-0")
          ]}
        >
          <a href="#services" class="block py-2 hover:text-purple-600">Services</a>
          <a href="#portfolio" class="block py-2 hover:text-purple-600">Portfolio</a>
        </div>
      </div>
    </header>
    """
  end

  defdelegate icon(assigns), to: CoreComponents
end
