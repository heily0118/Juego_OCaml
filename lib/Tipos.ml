(* Definición de un personaje para el juego *)
type personaje = {
  nombre : string;
  mutable vida : int;   (* mutable permite que el valor cambie *)
  ataque : int;
  defensa : int;
}