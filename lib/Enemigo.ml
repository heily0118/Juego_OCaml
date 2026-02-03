(* Definimos el tipo enemigo *)
type enemigo = {
  nombre : string;   (* Nombre del enemigo *)
  vida : int;        (* Vida del enemigo *)
  ataque : int;      (* Daño que hace al atacar *)
}

(* Función para crear un enemigo *)
let crear nombre =
  {
    nombre = nombre; (* Nombre del enemigo *)
    vida = 80;       (* Tiene menos vida que el jugador *)
    ataque = 15;     (* Ataque del enemigo *)
  }

(* Función para cuando el enemigo recibe daño *)
let recibir_danio e danio =
  (* Se devuelve un nuevo enemigo con menos vida *)
  { e with vida = e.vida - danio }
