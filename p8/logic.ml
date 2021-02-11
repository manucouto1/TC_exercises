type log_exp =
    Const of bool
  | Var of string 
  | Neg of log_exp
  | Conj of log_exp * log_exp
  | Disj of log_exp * log_exp
  | Cond of log_exp * log_exp
  | BiCond of log_exp * log_exp;;

let rec eval ctx = function
    Const b -> b 
  | Var s -> List.assoc s ctx
  | Neg e -> not (eval ctx e)
  | Conj (e1,e2) -> (eval ctx e1) && (eval ctx e2)
  | Disj (e1,e2) -> (eval ctx e1) || (eval ctx e2)
  | Cond (e1,e2) -> (not (eval ctx e1)) || (eval ctx e2)
  | BiCond (e1,e2) -> (eval ctx e1) = (eval ctx e2);;

type oper = Not;;

type biOper = Or | And | If | Iff;;

type prop = 
    C of bool
  | V of string
  | Op of oper * prop
  | BiOp of biOper * prop * prop;;

(*Ejercicio 1 *)

let rec prop_of_log_exp = function
    Const x -> C x
  | Var s -> V s
  | Neg x -> Op(Not, prop_of_log_exp x)
  | Conj(x,y) -> BiOp(And, prop_of_log_exp x, prop_of_log_exp y)
  | Cond(x,y) -> BiOp(If, prop_of_log_exp x, prop_of_log_exp y)
  | Disj(x,y) -> BiOp(Or, prop_of_log_exp x, prop_of_log_exp y)
  | BiCond(x,y) -> BiOp(Iff, prop_of_log_exp x, prop_of_log_exp y);;

let exp = BiCond (Cond (Var "p", Var "q"), Conj (Neg (Var "p"), Var "q"));;

let rec log_exp_of_prop = function 
    C x -> Const x
  | V s -> Var s
  | Op(Not, x) -> Neg (log_exp_of_prop x)
  | BiOp(If,x,y) -> Cond(log_exp_of_prop x, log_exp_of_prop y)
  | BiOp(Or,x,y) -> Disj(log_exp_of_prop x,log_exp_of_prop y) 
  | BiOp(Iff,x,y) -> BiCond(log_exp_of_prop x,log_exp_of_prop y)
  | BiOp(And,x,y) -> Conj(log_exp_of_prop x,log_exp_of_prop y);;

(*Ejercicio 2*)

let opval = function 
    Not -> (function true -> false | false -> true) ;;

let biopval = function
    Or -> (||)
  | And -> (&&)
  | If -> (fun x -> fun y -> (opval Not x) || y)
  | Iff -> (=);;

let rec peval ctx = function
  | C b -> b
  | V s -> List.assoc s ctx
  | Op (x,y) -> (opval x (peval ctx y))
  | BiOp(o,x,y) -> ((biopval o)(peval ctx x)(peval ctx y));;

(* Ejercicio 3 *)

let is_tau x = 
  let all = [("false",false);("false",true);("true",false);("true",true)] in 
  let rec aux = function
    [] ->  true 
  | h::t -> (peval h x) && (aux t)
  in aux all;; 
  