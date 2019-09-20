defmodule OndeServerWeb.BageView do
  use OndeServerWeb, :view
  alias OndeServerWeb.BageView

  def render("index.json", %{bages: bages}) do
    %{data: render_many(bages, BageView, "bage.json")}
  end

  def render("show.json", %{bage: bage}) do
    %{data: render_one(bage, BageView, "bage.json")}
  end

  def render("bage.json", %{bage: bage}) do
    %{id: bage.id,
      latitude: bage.latitude,
      longitude: bage.longitude,
      zootec: bage.zootec,
      rodando: bage.rodando,
      sentido: bage.sentido,
      one_signal: bage.one_signal}
  end
end
