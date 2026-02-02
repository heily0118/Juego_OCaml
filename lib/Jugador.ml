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
    nombre = nombre; (* se asigna el nombre *)
    vida = 100;      (* vida inicial *)
    ataque = 10;     (* ataque inicial *)
    defensa = 10;    (* defensa inicial *)
  }

(* Función para cuando el jugador recibe daño *)
let recibir_danio j danio =
  (* calculamos el daño real restando la defensa *)
  let danio_real = max 0 (danio - j.defensa) in
  (* devolvemos un nuevo jugador con menos vida *)
  { j with vida = j.vida - danio_real }

(* Función para curarse el jugador *)
let curar j =
  print_endline "Te curas y recuperas vida!";
  { j with vida = j.vida + 20 }
