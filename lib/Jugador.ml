(* Definimos el tipo jugador *)
type jugador = {
  nombre : string;   (* nombre del jugador *)
  vida : int;        (* puntos de vida *)
  ataque : int;      (* fuerza de ataque *)
  defensa : int;     (* defensa contra ataques *)
}

(* Función para crear un jugador nuevo *)
let crear nombre =
  {
    nombre = nombre;
    vida = 100;
    ataque = 10;
    defensa = 10;
  }

(* Función para cuando el jugador recibe daño *)
let recibir_danio j danio =
  let danio_real = max 0 (danio - j.defensa) in
  { j with vida = j.vida - danio_real }

(* Función para curarse el jugador *)
let curar j =
  print_endline "Te curas y recuperas vida!";
  { j with vida = j.vida + 20 }
