defmodule PortfolioLandingWeb.Landing.Index do
  use PortfolioLandingWeb, :live_view

  import PortfolioLandingWeb.Components.Sections.{
    HeaderComponent,
    HeroComponent,
    ServicesComponent,
    PortfolioComponent,
    FooterComponent
  }

  @impl true
  def render(assigns) do
    ~H"""
    <div class="bg-gray-900 text-white">
      <.header_component mobile_menu_open={@mobile_menu_open} />
      <.hero />
      <.services />
      <.portfolio />
      <.footer />
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :mobile_menu_open, false)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("open-close-bar", _, socket) do
    {:noreply, assign(socket, :mobile_menu_open, !socket.assigns.mobile_menu_open)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "AlissonMachado.dev")
  end
end
