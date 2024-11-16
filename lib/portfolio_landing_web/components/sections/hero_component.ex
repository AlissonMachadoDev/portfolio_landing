defmodule PortfolioLandingWeb.Components.Sections.HeroComponent do
  use Phoenix.Component
  use PortfolioLandingWeb, :verified_routes

  def hero(assigns) do
    ~H"""
    <section class="flex items-center justify-center relative bg-black p-20">
      <div class="container mx-auto px-6">
        <div class="flex flex-col md:flex-row items-center">
          <div class="md:w-1/2 space-y-6">
            <h1
              class="text-4xl md:text-6xl font-bold opacity-100"
              x-data="{ text: 'Hi, I am Alisson Machado' }"
              x-init="setTimeout(() => $el.classList.add('opacity-100'), 500)"
            >
              <span x-text="text">Hi, I am Alisson Machado</span>
            </h1>
            <p class="text-gray-400 text-lg">Hey, you! Follow my  lead!</p>
            <div class="flex gap-4">
              <.link
                navigate="https://github.com/ali1ariel"
                class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-3 rounded-lg transition duration-300"
                target="_blank"
                rel="noopener noreferrer"
              >
                My GitHub
              </.link>
              <.link
                navigate="https://www.linkedin.com/in/alisson-machado/"
                class="border border-purple-600 text-purple-600 hover:bg-purple-600 hover:text-white px-6 py-3 rounded-lg transition duration-300"
                target="_blank"
                rel="noopener noreferrer"
              >
                My LinkedIn
              </.link>
            </div>
          </div>
          <div class="md:w-1/2 mt-8 md:mt-0">
            <img
              src={~p"/images/profile.jpeg"}
              alt="Developer Profile"
              class="rounded-lg shadow-xl transform transition duration-500 hover:scale-105"
            />
          </div>
        </div>
      </div>
    </section>
    """
  end
end
