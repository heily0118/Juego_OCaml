(* Definimos el tipo enemigo *)
type enemigo = {
  nombre : string;  (* nombre del enemigo *)
  vida : int;       (* vida del enemigo *)
  ataque : int;     (* ataque del enemigo *)
}

(* Función para crear un enemigo *)
let crear nombre =
  {
    nombre = nombre;
    vida = 80;       (* menos vida que el jugador *)
    ataque = 15;     (* ataque menor *)
  }

(* Función para recibir daño *)
let recibir_danio e danio =
  (* devolvemos un enemigo con menos vida *)
  { e with vida = e.vida - danio }
