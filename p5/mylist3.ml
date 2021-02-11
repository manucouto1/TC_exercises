let init n f = 
	if( n < 0) then raise (Invalid_argument "init")
	else
	let rec aux s x = 
		match x with 
		| 0 -> (f x)::s
		| _ -> aux ((f x)::s) (x - 1)
	in aux [] (n - 1);; 

let suml l = 
	let rec aux n = function
		[] -> 0
		| h::t -> aux (n+h) t
	in aux 0 l;;
(*
let maxl l = 
	let h::t = l in
	let rec aux mx = function
		[] -> raise (Failure "maxl")
		| h::[] -> max mx h
	 	| h::t -> aux (max mx h) t
 in aux h t;;
*)

(*
let maxl (h::t) = 
 	let rec aux m = function
	 	[] -> raise (Failure "maxl")
	 	| h::[] -> if (m > h) then m else h 
	 	| h::t -> if (m > h) then aux m t else aux h t
	 in aux h (h::t);; *)

let rec maxl = function
    [] -> raise (Failure "maxl")
	| h::[] -> h
	| h1::h2::t -> maxl(max h1 h2::t);;

let to0from n =
 	let rec aux x s =
 		if x < 0 then List.rev s
 		else aux (x - 1) (x :: s)
 	in aux n [];;

let to0from n = 
 	try 
 		init n ((-)n)
    with Invalid_argument _ -> [];;

let fromto m n = 
	try 
		init (n - (m - 1)) ((+)m)
	with Invalid_argument _ -> [];;

let rec from1to n =
 	if n < 1 then []
 	else from1to (n-1) @ [n];;

let append = List.append;; 

let concat = List.concat;;

let map f l =
    let rec aux s = function
          [] -> s
        | h::t -> aux ((f h)::s) t
    in aux [] (List.rev l);;

let power x y = 
	let rec innerpower x y = 
		if y = 0 then  1
		else x * innerpower x (y - 1)
	in 
		if y >= 0 then innerpower x y 
		else invalid_arg "power";;

let power x y = 
	if(y < 0) then invalid_arg "power" else 
		match y with
		| 0 -> 1
		| _ -> let rec aux j = function
			| 1 -> j
			| k -> aux (j * x) (k - 1)
		in 
			aux x y;;

let fib n =
	let rec aux i f a = 
		if i = n then f
		else aux (i+1) (f+a) f
	in 
		if n >= 0 then aux 0 0 1 
		else invalid_arg "fib";;

let fact n =
	let rec aux x = function
		| 0 -> x
  		| 1 -> x
  		| t -> aux (x *. float_of_int(t - 1)) (t - 1)
	in
 		if n >= 0 then aux 1. (n + 1)
 		else invalid_arg "fact";;

(*tail recursive*)
(*let incseg l = List.fold_left (fun x t -> x::List.map ((+) x) t) l [];;*)

let incseg l = 
	let rec aux a s = function 
		[] -> List.rev s
		|h::t -> aux (a+h) ((a+h)::s) t
	in 
		aux 0 [] l;;


let rec multicomp l  x = match l with
 [] -> x
 | f::t -> multicomp t (f(x));;

 let insert x l = 
 	let rec aux s = function 
 		[] -> x::s
 		| h::t -> if x <= h then (List.rev s)@(h::x::t)
 				  else aux (h::s) t
 	in
 		aux [] l;;

let insert_gen f x l =
	let rec aux s = function
 		[] -> (List.rev s)
 		| h::t -> if f x h then (List.rev s)@(x::h::t)
 				  else aux (h::s) t
 	in
 		aux [] l;;




