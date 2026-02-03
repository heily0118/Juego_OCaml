type jugador = {
  nombre : string;
  vida : int;
  ataque : int;
  defensa : int;
  defendiendo : bool; (* indica si se defiende este turno *)
}

let crear nombre =
  {
    nombre;
    vida = 100;
    ataque = 10;
    defensa = 10;
    defendiendo = false;
  }

let recibir_danio j danio =
  (* Si se está defendiendo, reduce más el daño *)
  let defensa_extra =
    if j.defendiendo then j.defensa + 10 else j.defensa
  in
  let danio_real = max 0 (danio - defensa_extra) in

  {
    j with
    vida = j.vida - danio_real;
    defendiendo = false; (* la defensa solo dura 1 turno *)
  }

let curar j =
  print_endline "💖 Te curas y recuperas vida!";
  { j with vida = j.vida + 20 }
