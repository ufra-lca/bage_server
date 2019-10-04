defmodule OndeServerWeb.Api.HorarioView do
  use OndeServerWeb, :view
  alias OndeServerWeb.Api.HorarioView

  def render("index.json", %{horarios: horarios}) do
    %{data: render_many(horarios, HorarioView, "horario.json")}
  end

  def render("show.json", %{horario: horario}) do
    %{data: render_one(horario, HorarioView, "horario.json")}
  end

  def render("horario.json", %{horario: horario}) do
    %{id: horario.id,
      hora_inicio: horario.hora_inicio,
      hora_fim: horario.hora_fim,
      n_voltas: horario.n_voltas,
      zootec: horario.zootec}
  end
end
