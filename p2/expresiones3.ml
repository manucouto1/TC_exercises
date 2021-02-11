
let x = 1;;
(* Prediccion = var = x : int = 1 *)
(* Result = var = x : int = 1 *)

let y = 2;;
(* Prediccion = var y : int = 2*)
(* Result =  var y ; int = 2 *)

x - y;;
(* Prediccion = - : int = -1 *)
(* Result =  - : int = -1 *)

let y = x in x - y;;
(* Prediccion = - : int = 0 *)
(* Result =  - : int = 0 *)

(*z;;*)
(* Prediccion = var z : 'a = NULL *)
(* Result =  ERROR = unbound value*)

let z = x + y;;
(* Prediccion = val z : int = 3  *)
(* Result = val z : int = 3 *)

z;;
(* Prediccion = val z : int = 3 *)
(* Result =  - : int = 3 *)

let x = 5;;
(* Prediccion = val x : int = 5 *)
(* Result =  val x : int = 5*)

z;;
(* Prediccion = val z : int = 3 *)
(* Result =  - : int = 3 *)

let y = 5 in x + y;;
(* Prediccion = - : int = 10 *)
(* Result = - : int = 10 *)

x + y;;
(* Prediccion = - : int = 7 *)
(* Resultado = - : int = 7 *)

let p = 2,5;;
(* Prediccion = val p : int * int = (2,5) *)
(* Resultado = val p : int * int = (2,5) *)

snd p, fst p;;
(* Prediccion = - : int * int = (5,2) *)
(* Resultado = - : int * int = (5,2) *)

p;;
(* Prediccion = - int * int = (2,5) *)
(* Resultado = - int * int = (2,5) *)

let p = 0,1 in snd p, fst p;;
(* Prediccion = - : int * int = (1,0) *)
(* Resultado = - : int * int = (1,0) *)

p;;
(* Prediccion = - : int * int = (2,5) *)
(* Resultado = - : int * int = (2,5) *)

let x,y = p;;
(* Prediccion = val x : int = 2, val y : int = 5*)
(* Resultado = val x : int = 2
			   val y : int = 5 *)

let z = x + y;;
(* Prediccion = val z : int = 7 *)
(* Resultado = val z : int = 7 *)

let x,y = p, x;;
(* Prediccion = val x : int * int = (2,5)
				val y : int = 2 *)
(* Resultado =  val x : int * int = (2,5) 
				val y : int = 2 *)

let x = let x,y = 2,3 in x * x + y;; 
(* Prediccion = val x : int = 7 *)
(* Resultado = val x : int = 7 *)
(* ERROR DE COMPILACION *)

x + y;;
(* Prediccion = - : int = 9 *)
(* Resultado = - : int = 9 *)

z;;
(* Prediccion = - : int = 7 *)
(* Resultado = - : int = 7 *)

let x = x + y in let y = x * y in x + y + z;;
(* Prediccion = - : int = 34 *)
(* Resultado = - : int = 34 *)

x + y + z;;
(* Prediccion = - : int = 16 *)
(* Resultado = - : int = 16 *)

int_of_float;;
(* Prediccion = - : float -> int *)
(* Resultado = - : float -> int = <fun> *)

float_of_int;;
(* Prediccion = - : int -> float = <fun> *)
(* Resultado = - : int -> float = <fun> *)

int_of_char;;
(* Prediccion = - : char -> int = <fun> *)
(* Resultado = - : char -> int = <fun> *)

char_of_int;;
(* Prediccion = - : int -> char = <fun> *)
(* Resultado = - : int -> char = <fun> *)

abs;;
(* Prediccion = - : int -> int = <fun> *)
(* Resultado = - : int -> int = <fun> *)

sqrt;;
(* Prediccion = - : float -> float = <fun> *)
(* Resultado = - : float -> float = <fun> *)

truncate;; 
(* Prediccion = - : float -> int = <fun> *)
(* Resultado = - : float -> int = <fun> *)

ceil;;
(* Prediccion = - : float -> int = <fun> *)
(* Resultado = - : float -> int = <fun> *)

floor;;
(* Prediccion = - : float -> int = <fun> *)
(* Resultado = - : float -> float = <fun> *)

Char.code;;
(* Prediccion = - : char -> int = <fun> *)
(* Resultado = - : char -> int = <fun> *)

String.length;;
(* Prediccion = - : string -> int = <fun> *)
(* Resultado = - : string -> int = <fun> *)

fst;;
(* Prediccion = - : ('a, 'b) -> 'a = <fun> *)
(* Resultado = - : 'a * 'b -> 'a = <fun> *)

snd;;
(* Prediccion = 'a * 'b -> 'b = <fun> *)
(* Resultado = 'a * 'b -> 'b = <fun> *)

function x -> 2 * x;;
(* Prediccion = - : 'a -> int = <fun> *)
(* Resultado = - : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(* Prediccion = - : int = 6*)
(* Resultado = - : int = 6*)

function (x,y) -> x;;
(* Prediccion = - : 'a * 'b -> 'a = <fun> *)
(* Resultado = - : 'a * 'b -> 'a = <fun> *)

let f = function x -> 2 * x;;
(*(* Prediccion = val f : int -> int = <fun> *)
(* Resultado = val f : int -> int = <fun> *) *)

f (2+1);;
(*(* Prediccion = - : int = 6 *)
(* Resultado = - : int = 6 *) *)

f 2 + 1;;
(*(* Prediccion =  - : int = 5 *)
(* Resultado = - : int = 5 *)*)

let n = 10;;
(* Prediccion = val n : int = 10 *)
(* Resultado = val n : int = 10 *)

let sum n = function x -> 2 * x;;
(* Prediccion = ???*)
(* Resultado = val sum : int -> 'a -> int = <fun> *)

sum 5;;
(* Prediccion = - : int = 10 *)
(* Resultado = - : '_a -> int = <fun> *)

sum 1 2;;
(* Prediccion = - : int = 4 *)
(* Resultado = - : int = 2 *)

let n = 1;;
(* Prediccion = val n : int = 1*)
(* Resultado = val n : int = 1*)

sum n 10;;
(* Prediccion = - : int = 2 *)
(* Resultado = - : int = 2 *)

let sumn = sum n;;
(* Prediccion = val sumn : '_a -> int = <fun> *)
(* Resultado = val sumn : '_a -> int = <fun> *)

sumn 100;;
(* Prediccion = - : int = 2 *)
(* Resultado = - : int = 2 *)

let n = 1000;;
(* Prediccion = val n : int = 1000*)
(* Resultado = val n : int = 1000*)

sumn 100;
(* Prediccion = - : int = 2 *)
(* Resultado = - : int = 2 *)






