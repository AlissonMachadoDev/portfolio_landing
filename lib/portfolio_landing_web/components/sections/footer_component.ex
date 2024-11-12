defmodule PortfolioLandingWeb.Components.Sections.FooterComponent do
  use Phoenix.Component

  def footer(assigns) do
    ~H"""
    <footer class="bg-black py-12">
      <div class="container mx-auto px-6 text-center">
        <p class="text-gray-400">© 2024 Alisson Machado. All rights reserved.</p>
      </div>
    </footer>
    """
  end
end
