open Tipos

(* Cálculo de daño: Ataque del uno menos defensa del otro *)
let calcular_daño atacante defensor =
  let d = atacante.ataque - defensor.defensa in
  if d > 0 then d else 1 (* Siempre hace al menos 1 de daño *)

(* Aplicar ataque: Resta la vida al defensor *)
let realizar_ataque p1 p2 =
  let daño = calcular_daño p1 p2 in
  p2.vida <- p2.vida - daño;
  print_endline (p1.nombre ^ " atacó a " ^ p2.nombre ^ " quitando " ^ string_of_int daño ^ " HP.")

(* Revisa si alguien llegó a 0 de vida *)
let ha_terminado p1 p2 =
  p1.vida <= 0 || p2.vida <= 0