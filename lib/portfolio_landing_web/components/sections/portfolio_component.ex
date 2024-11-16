defmodule PortfolioLandingWeb.Components.Sections.PortfolioComponent do
  use Phoenix.Component
  use PortfolioLandingWeb, :verified_routes

  def portfolio(assigns) do
    portfolio_items = [
      %{
        title: "Digistab Store",
        image: ~p"/images/logo_digistab_store.svg",
        description: "A store application made with LiveView.",
        site: "https://www.google.com/",
        code: "https:www.github.com/AlissonMachadoDev/digistab-store",
        additional_class: "bg-white p-16"
      },
      %{
        title: "Animal Showdown Backend",
        image: ~p"/images/coming-soon-text.svg",
        description: "Elixir Phoenix Application, API for a card game.",
        site: "",
        code: "https:www.github.com/AlissonMachadoDev/digistab_store",
        additional_class: "bg-white p-16"
      },
      %{
        title: "Animal Showdown Backend",
        image: ~p"/images/coming-soon-text.svg",
        description: "NextJS Application for a card game.",
        site: "",
        code: "https:www.github.com/AlissonMachadoDev/digistab_store",
        additional_class: "bg-white p-16"
      }
    ]

    assigns = assign(assigns, :portfolio_items, portfolio_items)

    ~H"""
    <section id="portfolio" class="py-20 bg-black">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12">My Portfolio</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <%= for item <- @portfolio_items do %>
            <div class={["relative group overflow-hidden rounded-lg", item.additional_class]}>
              <img
                src={item.image}
                alt={item.title}
                class="w-full transition duration-300 group-hover:scale-110"
              />
              <div class="md:absolute md:inset-0 bg-black bg-opacity-75 md:opacity-0 group-hover:opacity-100
                         transition duration-300 flex items-center justify-center">
                <div class="text-center">
                  <h3 class="text-xl font-semibold mb-2"><%= item.title %></h3>
                  <p class="text-gray-300"><%= item.description %></p>
                  <div class="flex flex-row mt-4 gap-4 justify-around">
                    <.link
                      navigate={item.code}
                      class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-3 rounded-lg transition duration-300"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Code
                    </.link>
                    <.link
                      :if={item.site != ""}
                      navigate={item.code}
                      class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-3 rounded-lg transition duration-300"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Site
                    </.link>
                  </div>
                </div>
              </div>
            </div>
          <% end %>
        </div>
      </div>
    </section>
    """
  end
end
