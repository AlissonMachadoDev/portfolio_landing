defmodule PortfolioLandingWeb.Components.Sections.AboutComponent do
  use Phoenix.Component
  use PortfolioLandingWeb, :verified_routes

  def about(assigns) do
    skills = [
      %{category: "Languages", items: ["Elixir", "JavaScript", "Ruby"]},
      %{category: "Frameworks", items: ["Phoenix", "LiveView", "Rails", "React"]},
      %{category: "Tools", items: ["Tailwind", "AlpineJs", "AWS", "GitHub Actions", "RabbitMQ"]},
      %{category: "Libraries", items: ["OTP", "Oban", "Broadway", "Absinthe", "Metaprogramming"]},
      %{category: "Interests in deepening", items: ["Event-Driven", "Observability", "ETS"]}
    ]

    assigns = assign(assigns, :skills, skills)

    ~H"""
    <section id="about" class="py-20 bg-black">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12">About Me</h2>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <div class="space-y-6">
            <p class="text-gray-300 text-lg">
              I'm a software engineer focused on building robust applications with Elixir and Phoenix.
              My passion is creating elegant solutions that solve real problems.
            </p>
            <p class="text-gray-300 text-lg">
              Currently specializing in Phoenix LiveView and real-time applications,
              I like to work on projects where I can create memorable experiences and that can make me grow along with.
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <%= for skill <- @skills do %>
              <div class="bg-gray-800 p-6 rounded-lg">
                <h3 class="text-xl font-semibold text-purple-400 mb-4">
                  <%= skill.category %>
                </h3>
                <ul class="space-y-2">
                  <%= for item <- skill.items do %>
                    <li class="text-gray-300"><%= item %></li>
                  <% end %>
                </ul>
              </div>
            <% end %>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
