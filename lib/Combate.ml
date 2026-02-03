(* Turno del jugador de atacar al enemigo *)
let turno_jugador (jugador : Jugador.jugador) (enemigo : Enemigo.enemigo) =
  (* Mensaje para el usuario *)
  print_endline "⚔️ ¡Atacaste al enemigo!";
  (* Se le resta vida al enemigo según el ataque del jugador *)
  Enemigo.recibir_danio enemigo jugador.Jugador.ataque


(* Turno del enemigo de atacar al jugador *)
let turno_enemigo (jugador : Jugador.jugador) (enemigo : Enemigo.enemigo) =
  (* Mensaje para el usuario *)
  print_endline "⚔️ ¡El enemigo te ataca!";
  (* Se le resta vida al jugador según el ataque del enemigo *)
  Jugador.recibir_danio jugador enemigo.Enemigo.ataque


(* Función para defenderse *)
(* Al defenderse, se aumenta la defensa para reducir daño *)
let defender jugador =
  print_endline "🛡️ ¡Te pones en posición defensiva!";
  { jugador with Jugador.defensa = jugador.Jugador.defensa + 3}

(* Función para verificar si el jugador está muerto *)
let jugador_muerto (jugador : Jugador.jugador) =
  (* Si la vida es menor o igual a 0, el jugador esta muerto *)
  jugador.Jugador.vida <= 0

  
(* Función para verifica si el enemigo está muerto *)
let enemigo_muerto (enemigo : Enemigo.enemigo) =
  (* Si la vida es menor o igual a 0, el enemigo esta muerto *)
  enemigo.Enemigo.vida <= 0
