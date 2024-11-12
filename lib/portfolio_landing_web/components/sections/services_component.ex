defmodule PortfolioLandingWeb.Components.Sections.ServicesComponent do
  use Phoenix.Component
  use PortfolioLandingWeb, :verified_routes
  alias PortfolioLandingWeb.CoreComponents

  def services(assigns) do
    services = [
      %{
        icon: "hero-code-bracket-square-solid",
        title: "Development",
        description:
          "If you have something for me in LiveView, you'll make my eyes shine so bright."
      },
      %{
        icon: "hero-paint-brush-solid",
        title: "Design",
        description:
          "Years and years, working with tailwind to create responsive screens for your PC and your mobile."
      },
      %{
        icon: "hero-beaker-solid",
        title: "Elixir Back-end",
        description:
          "Experienced developer for fast solutions, with OTP, Oban, Broadway, and some other nice technologies."
      }
    ]

    assigns = assign(assigns, :services, services)

    ~H"""
    <section id="services" class="py-20 bg-gray-900">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12">My Services</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <%= for service <- @services do %>
            <div class="bg-gray-800 p-6 rounded-lg transform transition duration-300 hover:scale-105">
              <div class="text-purple-600 mb-4">
                <div class="flex justify-center">
                  <.icon name={service.icon} class="w-12 h-12" />
                </div>
              </div>
              <h3 class="text-xl font-semibold text-center mb-2"><%= service.title %></h3>
              <p class="text-gray-400 text-center"><%= service.description %></p>
            </div>
          <% end %>
        </div>
      </div>
    </section>
    """
  end

  defdelegate icon(assigns), to: CoreComponents
end
