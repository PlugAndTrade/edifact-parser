defmodule Edifact.UNA do
  @enforce_keys [:component, :element, :decimal, :release, :segment]
  defstruct [:component, :element, :decimal, :release, :segment]

  @type t :: %__MODULE__{
          component: String.t(),
          element: String.t(),
          decimal: String.t(),
          release: String.t(),
          segment: String.t()
        }

  def init(c, e, d, r, s) do
    %__MODULE__{
      component: c,
      element: e,
      decimal: d,
      release: r,
      segment: s
    }
  end

  def default, do: init(":", "+", ".", "?", "'")

  def tokens(%__MODULE__{
        component: c,
        element: e,
        decimal: d,
        release: r,
        segment: s
      }),
      do: [[c, e, d, r, s]]
end
