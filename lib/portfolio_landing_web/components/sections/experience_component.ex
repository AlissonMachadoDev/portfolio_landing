defmodule PortfolioLandingWeb.Components.Sections.ExperienceComponent do
  use Phoenix.Component
  use PortfolioLandingWeb, :verified_routes

  def experience(assigns) do
    experiences = [
      %{
        period: "2023 - Present",
        company: "Credisis",
        role: "Elixir Backend Developer",
        tech_stack: ["Elixir", "Phoenix", "Absinthe", "MySQL"],
        extra_tech_stack: ["PHP", "AngularJS", "Ionic", "Banking Systems", "Payments"],
        description: [
          "Developing a tool for decrypt a file and transform the information in payments",
          "Maintain a collection of legacy systems in different languages and archtectures",
          "Leading a team with tasks distribution and teaching about the systems",
          "Support on maintanances, and emmergencial tasks"
        ],
        extra: "Currently here"
      },
      %{
        period: "2022",
        company: "Envixo",
        role: "FullStack LiveView Elixir Developer",
        tech_stack: ["LiveView", "Elixir", "Petal", "Postgres"],
        description: [
          "Porting a courses plataform from Ruby on Rails for LiveView",
          "Mixing LiveView approaches with JS scripts to let all smooth",
          "Fast flow to delivery the requires from the client"
        ]
      },
      %{
        period: "2019 - 2021",
        company: "Softaliza",
        role: "FullStack LiveView Elixir Developer",
        tech_stack: ["LiveView", "Elixir", "Petal", "Postgres"],
        description: [
          "API Development for mobile apps, with Phoenix",
          "A scientific events plataform, for submissions and subscriptions",
          "Experience handling with Payments API"
        ]
      }
    ]

    assigns = assign(assigns, :experiences, experiences)

    ~H"""
    <section id="experience" class="py-20 bg-gray-900">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12">Past Experiences</h2>

        <div class="relative">
          <!-- Timeline line -->
          <div class="absolute left-8 md:left-1/2 w-1 h-full bg-purple-600 transform -translate-x-1/2">
          </div>
          <!-- Experience cards -->
          <div class="space-y-16">
            <%= for {exp, index} <- Enum.with_index(@experiences) do %>
              <div class={[
                "relative grid grid-cols-1 md:grid-cols-2 gap-8 items-center",
                if(rem(index, 2) == 0, do: "", else: "md:rtl")
              ]}>
                <!-- Timeline dot -->
                <div class="absolute left-8 md:left-1/2 w-4 h-4 bg-purple-600 rounded-full transform -translate-x-1/2">
                </div>
                <!-- Content -->
                <div class={[
                  "bg-gray-800 rounded-lg p-6 transition duration-300 hover:bg-gray-700",
                  if(rem(index, 2) == 0, do: "md:mr-auto", else: "md:ml-auto")
                ]}>
                  <div class="space-y-4">
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-2">
                      <h3 class="text-xl font-bold text-purple-400"><%= exp.role %></h3>
                      <span class="text-gray-400"><%= exp.period %></span>
                    </div>

                    <p class="text-lg font-semibold text-gray-300"><%= exp.company %></p>

                    <div class="flex flex-wrap gap-2">
                      <%= for tech <- exp.tech_stack do %>
                        <span class="px-3 py-1 text-sm bg-purple-600 bg-opacity-20 text-purple-400 rounded-full">
                          <%= tech %>
                        </span>
                      <% end %>
                      <span
                        :if={Map.has_key?(exp, :extra_tech_stack)}
                        class="px-3 py-1 text-sm bg-purple-600 bg-opacity-20 text-purple-400 rounded-full"
                        title={
                          Enum.reduce(exp.extra_tech_stack, "", fn ts, acc -> "#{acc}#{ts}, " end)
                        }
                      >
                        +
                      </span>
                    </div>

                    <ul class="space-y-2 list-disc list-inside text-gray-300">
                      <%= for item <- exp.description do %>
                        <li><%= item %></li>
                      <% end %>
                    </ul>
                  </div>
                </div>
                <!-- Empty column for alternating layout -->
                <div :if={Map.has_key?(exp, :extra)}><%= exp.extra %></div>
              </div>
            <% end %>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
