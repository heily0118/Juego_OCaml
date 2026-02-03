open Juego_ocaml

(* Muestra el estado actual del jugador y del enemigo *)
let mostrar_estado jugador enemigo =
  print_endline "--------------------";
  Printf.printf "Jugador %s - ❤️ Vida: %d\n"
    jugador.Jugador.nombre jugador.Jugador.vida;
  Printf.printf "Enemigo %s - 💚 Vida: %d\n"
    enemigo.Enemigo.nombre enemigo.Enemigo.vida;
  print_endline "--------------------"

(* Menú de opciones *)
let mostrar_menu () =
  print_endline "";
  print_endline "¿Qué deseas hacer?";
  print_endline "1. Atacar";
  print_endline "2. Defenderse";
  print_endline "3. Curarse";
  print_endline "4. Salir";
  print_string "Elige una opción: "

(* Bucle principal del juego *)
let rec bucle_juego jugador enemigo =
  mostrar_estado jugador enemigo;

  if Combate.jugador_muerto jugador then
    print_endline "☠️ ¡Has perdido, el enemigo te derrotó!"
  else if Combate.enemigo_muerto enemigo then
    print_endline "🏆 ¡Has ganado, derrotaste al enemigo!"
  else begin
    mostrar_menu ();
    let opcion = read_int () in

    match opcion with
    | 1 ->
        (* Atacar *)
        let enemigo_nuevo =
          Combate.turno_jugador jugador enemigo
        in
        if Combate.enemigo_muerto enemigo_nuevo then
          bucle_juego jugador enemigo_nuevo
        else
          let jugador_nuevo =
            Combate.turno_enemigo jugador enemigo_nuevo
          in
          bucle_juego jugador_nuevo enemigo_nuevo

    | 2 ->
        (* Defenderse *)
        let jugador_defendido = Combate.defender jugador in
        let jugador_nuevo =
          Combate.turno_enemigo jugador_defendido enemigo
        in
        bucle_juego jugador_nuevo enemigo

    | 3 ->
        (* Curarse *)
        let jugador_curado = Jugador.curar jugador in
        let jugador_nuevo =
          Combate.turno_enemigo jugador_curado enemigo
        in
        bucle_juego jugador_nuevo enemigo

    | 4 ->
        print_endline "👋 Saliendo del juego, gracias por jugar."

    | _ ->
        print_endline "❌ Opción inválida";
        bucle_juego jugador enemigo
  end

(* Punto de inicio *)
let () =
  print_endline "🎮 Bienvenido al juego de combate en OCaml!";
  print_string "Ingresa tu nombre: ";
  let nombre = read_line () in

  let jugador = Jugador.crear nombre in
  let enemigo = Enemigo.crear "Goblin" in

  bucle_juego jugador enemigo
