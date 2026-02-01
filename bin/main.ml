let () = print_endline "Hello, World!"
open Juego_lib.Tipos
open Juego_lib.Combate

let () =
  (* Creamos dos personajes de prueba *)
  let heroe = { nombre = "Caballero"; vida = 50; ataque = 20; defensa = 5 } in
  let monstruo = { nombre = "Orco"; vida = 30; ataque = 15; defensa = 10 } in

  (* Probamos tu función de ataque *)
  realizar_ataque heroe monstruo;
  
  (* Verificamos si tu lógica de vida funciona *)
  if monstruo.vida < 30 then 
    print_endline "¡La prueba fue un éxito! El daño se calculó y restó correctamente."
  else 
    print_endline "Algo falló: la vida no bajó."