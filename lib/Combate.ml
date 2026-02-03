let turno_jugador jugador enemigo =
  print_endline "⚔️ ¡Atacaste al enemigo!";
  Enemigo.recibir_danio enemigo jugador.Jugador.ataque

let turno_enemigo jugador enemigo =
  print_endline "⚔️ El enemigo te ataca!";
  Jugador.recibir_danio jugador enemigo.Enemigo.ataque

let defender jugador =
  print_endline "🛡️ Te preparas para defender el próximo ataque";
  { jugador with defendiendo = true }

let jugador_muerto jugador =
  jugador.Jugador.vida <= 0

let enemigo_muerto enemigo =
  enemigo.Enemigo.vida <= 0
