
val init : int -> (int -> 'a) -> 'a list
val suml : int list -> int
val maxl : 'a list -> 'a
val to0from : int -> int list
val fromto : int -> int -> int list
val from1to : int -> int list
val append : 'a list -> 'a list -> 'a list
val concat : 'a list list -> 'a list
val map : ('a -> 'b) -> 'a list -> 'b list
val power : int -> int -> int
val fib : int -> int
val fact : int -> float
val incseg : int list -> int list
val multicomp : ('a -> 'a) list -> 'a -> 'a
val insert : 'a -> 'a list -> 'a list
val insert_gen : ('a -> 'a -> bool) -> 'a -> 'a list -> 'a list

