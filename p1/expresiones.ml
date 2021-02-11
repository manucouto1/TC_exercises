(* expresiones *)
();;
(* Prediccion = - : function = () *)
(* Resultado = - : unit = () *)

2 + 5 * 3;;
(* Prediccion = - : int = 17 *)
(* Resultado = - : int = 17 *)

1.0;;
(* Prediccion = - : float = 1.0 *)
(* Resultado = - : float = 1. *)

(* 1.0 * 2;; *)
(* Prediccion = -: float = 2. *)
(* Result = ERROR : de tipo *)
1.0 *. 2.0;;
(* Result - : float = 2. *)
1 * 2;;
(*Result - : int = 2 *)

(* 2 - 2.0;;*)
(* Prediccion = ERROR : de tipo *)
(* Result = ERROR : de tipo *)
2 - 2;;
(* Result - : int = 0 *)
2.0 -. 2.0;;
(* Result - : float = 0. *)

(*3.0 + 2.0;;*)
(* Prediccion = Error : de tipo *)
(* Result = Error : de tipo *)
3.0 +. 2.0;;
(* Result - : float = 5. *)
3 + 2;;
(* Result - : int = 5 *)

(*5 / 3;;*)
(* Prediccion = - : float = ?. *)
(* Result = ERROR : lexico *)

5.0 /. 1.0;;
(* - : float = 1.66666 *)

5 mod 3;;
(* Prediccion = - : int = 2 *)
(* Result = - : int = 2 *)

3.0 *. 2.0 ** 3.0;;
(* Prediccion = ERROR = lexico *)
(* Result = - float = 24.*)

3.0 = float_of_int 3;;
(* Prediccion = ERROR = lexico *)
(* Result = - : bool = true *)

(* sqrt 4;; *)
(* Prediccion = - : int = 2 *)
(* Result = ERROR = de tipo *)
sqrt 4.0;;
(* Result = - : float = 2.0 *)

int_of_float 2.1 + int_of_float (-2.9);;
(* Prediccion = - : int = 0 *)
(* Result = - : int = 0 *)

truncate 2.1 + truncate (-2.9);;
(* Prediccion = - : int = 0 *)
(* Result = - : int = 0 *)

floor 2.1 +. floor (-2.9);;
(* Prediccion = - : float = 0. *)
(* Result = - float = -1. *)

ceil 2.1 +. ceil (-2.9);;
(* Prediccion = - : float = 0. *)
(* Result = - : -float = 1. *)

'B';;
(* Prediccion = - : char = B *)
(* Result = - : char = 'B' *)

int_of_char 'A';;
(* Prediccion = - : int = ? *)
(* Result = - : int = 65*)

char_of_int 66;;
(* Prediccion = - : char = 'B' *)
(* Result = - : char = 'B' *)

Char.code 'B';;
(* Prediccion = - : int = 66 *)
(* Result = - : int = 66 *)

Char.chr 67;;
(* Prediccion = - : char = 'C' *)
(* Result = - : char = 'C' *)

'\067';;
(* Prediccion = - : char = 'C' *)
(* Result = - : char = 'C' *)

(*Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'Ñ');;*)
(* Prediccion = - : char = 'ñ' *)
(* Result = - : char = '\241' *)
(* ERROR al compilar *)

(*Char.uppercase 'ñ';;*)
(* Prediccion = - : char = 'Ñ' *)
(* Result = WARNING : Deprecated use  Char.uppercase_ascii
			- : char = '\209'  *)
(*Char.uppercase_ascii 'ñ';;*)
(* Result - : char = '\241' *)
(* ERROR al compilar *)

Char.lowercase_ascii 'O';;
(* Char.lowercase 'O';; DEPRECATED*)
(* Prediccion = WARNING : Deprecated use Char.lowercase_ascii
			- : char = '\???' *)
(* Result = WARNING : Deprecated use Char.lowercase_ascii 
			- : char = 'o' *)
(* Pensaba que daría un código como en el anterior ejemplo *)


"this is a string";;
(* Prediccion = - : String = "this is a string" *)
(* Result = - : string = "this is a string" *)

String.length "longitud";;
(* Prediccion = - : int = 8 *)
(* Result = - : int = 8 *)

(*"1999" + "1";;*)
(* Prediccion = - : string  = "19991" *)
(* Result = ERROR : de tipo *)
(* Pensaba que concatenaría los dos strings*)
1999 + 1;;
(* Result - : int = 2000 *)

"1999" ^ "1";;
(* Prediccion = - : string = "19991" *)
(* Result =  - : string = "19991" *)

int_of_string "1999" + 1;;
(* Prediccion = - : int = 2000 *)
(* Result = - : int = 2000 *)

"\064\065";;
(* Prediccion = - : string = "zA" *)
(* Result = - : string ="@A" *)
(* No conozco el caracter para ése código*)

string_of_int 010;;
(* Prediccion = - : string = "?" *)
(* Result = - : string = "010" *)

not true;;
(* Prediccion = - : bool = false *)
(* Result = - : bool = false *)

true && false;;
(* Prediccion = - : bool = false *)
(* Result = - : bool = false *)

true || false;;
(* Prediccion = - : bool = true *)
(* Result = - : bool = true *)

(* true or false;;*)
(* Prediction = - : bool = true  *)
(* Result = Use (||) instead.
			- : bool = true  *)

(1 < 2) = false;; 
(* Prediccion = - : bool = false *)
(* Result =  - : bool = false *)

"1" < "2";;
(* Prediccion = - : bool = true*)
(* Result = - : bool = true*)

2 < 12;;
(* Prediccion = - : bool = true*)
(* Result = - : bool = true*)

"2" < "12";;
(* Prediccion = - : bool = true*)
(* Result = - : bool = false*)

"uno" < "dos";;
(* Prediccion = - : bool = false*)
(* Result = - : bool = false*)

2,5;;
(* Prediccion = - : vector = [2, 5]*)
(* Result = - : int * int = (2, 5) *)

"hola", "adios";;
(* Prediccion = - : string * string = ("hola", "adios") *)
(* Result = - : string * string = ("hola", "adios") *)

0, 0.0;;
(* Prediccion = - : ERROR = de tipo*)
(* Result = - : int * float = (0, 0.0) *)

fst ('a',0);;
(* Prediccion = - : char = 'a' *)
(* Result =  - : char = 'a' *)

snd (false, true);;
(* Prediccion = - : bool = true *)
(* Result =  - : bool = true *)

(1,2,3);;
(* Prediccion = - : int * int * int  = (1,2,3) *)
(* Result =  - : int * int * int  = (1,2,3) *)

(1,2),3;;
(* Prediccion = - : int * int * int  = (1,2,3) *)
(* Result =  - : (int * int) * int  = ((1,2),3) *)

fst (1,2),3;;
(* Prediccion = - : int * int  = (1,2) *)
(* Result =  - : int * int = (1,3) *)

if 3 = 4 then 0 else 4;;
(* Prediccion = - : int  = 4 *)
(* Result =  - : int = 4 *)

if 3 = 4 then "0" else "4";;
(* Prediccion = - : string = "4" *)
(* Result =  - : string = "4" *)

(* if 3 = 4 then 0 else "4";;*)
(* Prediccion = - : ERROR = de tipo *)
(* Result =  - : ERROR = de tipo *)
(* Cualquiera de las 2 opciones anteriores *)


(if 3 < 5 then 8 else 10) + 4;;
(* Prediccion = - : int = 12 *)
(* Result =  - : int = 12 *)

let pi = 2.0 *. asin 1.0;;
(* Prediccion = - : float = ? *)
(* Result =  val pi : float = 3.14159...*)

sin(pi /. 2.);;
(* Prediccion = - : float = ? *)
(* Result =  - : float = 1.*)