
exception Failure of string

let hd l = 
	match l with 
	 [] -> raise(Failure "hd")
	| h::_ -> h;;

let tl l = 
	match l with 
	 [] -> raise(Failure "tl")
	| _::t -> t;;				

let length l =
	let rec aux s = function
	| [] -> s
	| _::t -> aux (s + 1) t
	in aux 0 l;;

exception Invalid_argument of string

let nth l n = 
	if (n > length l) then 
		raise(Failure "nth")
	else if(n < 0) then
				raise(Invalid_argument "List.nth")
			else let rec aux s = function
				| 0 -> (hd s) 
				| x -> aux (tl s) (x - 1)
			in aux l n;;


let rec append l1 l2 =
  match l1 with
  | h :: t -> h :: append t l2
  | [] -> l2;;


let rev l =
	let rec aux s l =
		match l with
		| [] -> s 
		| h::t -> aux (h::s) t 
	in aux [] l;;

let rev_append l1 l2 =
	List.rev l1 @ l2;;


let rec rev_append1 l1 l2 = 
	match l1 with
	[] -> l2
	|h::t -> rev_append1 t (h::l2);;

let concat lx =
		let rec aux l s =
			match l with
			| [] -> s
			| h::t -> aux t h@s
	in aux (rev lx) [];;


let flatten lx = concat lx;;


let map f l =
	let rec aux res li =
		match li with
		 | [] -> rev res
		 | h::t -> aux ((f h)::res) t
		in aux [] l;; 

(*No funciona*)
let map2 f l1 l2 = 
	if(length l1 != length l2) then 
		raise (Invalid_argument("Tamaño invalido"))
	else 
	let rec aux res s1 s2 =
	match (s1,s2) with
	| ([],[]) -> res
	| ([],_) -> raise (Invalid_argument("Tamaño invalido l1"))
	| (_,[]) -> raise (Invalid_argument("Tamaño invalido l2"))
	| (h::t, hh::tt) -> aux ((f h hh)::res) t tt
in aux [] l1 l2;;


let rec fold_left f a = function
	[] -> a
	| h::t -> fold_left f (f a h) t;;


let rec fold_right f l b = 
	match l with
	[] -> b
	| h::t -> fold_right f t (f h b);;


let rec find p l = 
	match l with
	| [] -> raise(Failure("Not_found"))
	| h::t -> if(p h) then h else find p t;;

let rec for_all p l = 
	match l with
 	[] -> true
	| h::t -> if (p h) then for_all p t else false;;

let rec exists p l = 
	match l with
	| [] -> false
	| h::t -> (p h) || (exists p t);;

let rec mem a l = 
	match l with
	 | [] -> false
	 | h::t -> if (h==a) then true else mem a t;;  

let rec filter p l = 
	let rec aux s = function 
		| [] -> s
		| h::t -> if(p h) then aux (h::s) t else aux s t
	in aux [] (rev l);;

let rec find_all p l = filter p l;;

let partition p l = 
	let rec aux l1 l2 s = 
		match s with
		| [] -> (l1,l2)
		| h::t -> if(p h) then aux (h::l1) l2 t else aux l1 (h::l2) t 
	in aux [] [] (rev l);;

let split l = 
	let rec aux s a =
		match s with
		[] -> let (x,y) = a in (rev x, rev y)
		| h::t -> let (x,y) = h in let (j,k) = a in aux t (x::j, y::k)
	in aux l ([],[]);;

let combine l1 l2 =
	if(length l1 != length l2) then 
		raise (Invalid_argument("Tamaño invalido"))
	else 
	let rec aux s1 s2 a = 
		match (s1,s2) with
		| ([],[]) -> a
		| (h::t,hh::tt) -> aux t tt ((h,hh)::a)
		| (_::_, []) -> raise (Invalid_argument("Tamaño invalido l1 l2"))
		| ([], _::_) -> raise (Invalid_argument("Tamaño invalido l1 l2")) 
	in aux (rev l1) (rev l2) [];;














