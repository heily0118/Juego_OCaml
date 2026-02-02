open Juego_ocaml

let mostrar_estado jugador enemigo =
  print_endline "--------------------";
  Printf.printf "Jugador %s - ❤️ Vida: %d\n"
    jugador.Jugador.nombre jugador.Jugador.vida;
  Printf.printf "Enemigo %s - 💚 Vida: %d\n"
    enemigo.Enemigo.nombre enemigo.Enemigo.vida;
  print_endline "--------------------"

(* Muestra las opciones disponibles en cada turno *)
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

  (* Mostrar el estado actual de ambos *)
  mostrar_estado jugador enemigo;

  (* Verificar si el jugador perdió *)
  if Combate.jugador_muerto jugador then
    print_endline "☠️ ¡Has perdido, el enemigo te derroto!"
  
  (* Verificar si el enemigo perdió *)
  else if Combate.enemigo_muerto enemigo then
    print_endline "🏆 ¡Has ganado, derrotaste al enemigo!"
  
  (* Si nadie ha muerto, continúa el turno *)
  else begin
    (* Mostrar el menú de acciones *)
    mostrar_menu ();

    (* Leer la opción del jugador *)
    let opcion = read_int () in

    match opcion with

    (* Opción 1: Atacar *)
    | 1 ->
        let enemigo_nuevo =
          Combate.turno_jugador jugador enemigo
        in

        (* Si el enemigo no murió, ataca de vuelta *)
        if Combate.enemigo_muerto enemigo_nuevo then
          bucle_juego jugador enemigo_nuevo
        else
          let jugador_nuevo =
            Combate.turno_enemigo jugador enemigo_nuevo
          in
          bucle_juego jugador_nuevo enemigo_nuevo

    (* Opción 2: Defenderse *)
    | 2 ->
        let jugador_defendido = Combate.defender jugador in
        (* El enemigo ataca después de defender *)
        let jugador_nuevo =
          Combate.turno_enemigo jugador_defendido enemigo
        in
        bucle_juego jugador_nuevo enemigo

    (* Opción 3: Curarse *)
    | 3 ->
        let jugador_curado = Jugador.curar jugador in
        (* El enemigo ataca después de curarse *)
        let jugador_nuevo =
          Combate.turno_enemigo jugador_curado enemigo
        in
        bucle_juego jugador_nuevo enemigo

    (* Opción 4: Salir del juego *)
    | 4 ->
        print_endline "Saliendo del juego, gracias por jugar.";

    (* Opción inválida *)
    | _ ->
        print_endline "Opción inválida";
        bucle_juego jugador enemigo
  end


(* Punto de inicio del programa *)
let () =
  (* Mensaje de bienvenida *)
  print_endline "🎮 Bienvenido al juego de combate en OCaml!";

  (* Pedir nombre al jugador *)
  print_string "Ingresa tu nombre: ";
  let nombre = read_line () in

  (* Crear jugador y enemigo *)
  let jugador = Jugador.crear nombre in
  let enemigo = Enemigo.crear "Goblin" in

  (* Iniciar el bucle del juego *)
  bucle_juego jugador enemigo


