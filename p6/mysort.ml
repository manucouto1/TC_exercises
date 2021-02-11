
(*Ejercicio 1 - Revisado*)
let rlist_t r n =
    if n <= 0 then []
    else let rec aux result x = match x with 
        | 0 -> result 
        | x -> aux ((Random.int r)::result) (x-1)
    in aux [] n;;

(*Ejercicio 2 - Revisado*)
let rec insert x = function
    [] -> [x]
    | h::t -> if x <= h then x::h::t 
                else h::insert x t;;

let rec isort = function
    [] -> [] 
    | h::t -> insert h (isort t);;

    
let rec isort_aux acum = function 
     [] -> List.rev acum
    | h::t -> isort_aux (h::acum) t;;

let insert_t x l = 
    let rec aux rev_head = function
        [] -> (List.rev (x::rev_head))
        | h::t -> if x <= h 
            then 
                isort_aux rev_head (x::h::t) 
            else 
                aux (h::rev_head) t
    in aux [] l;;

let isort_t l =
    let rec aux s = function
        [] -> s 
        | h::t -> aux(insert_t h s) t
    in aux [] l;; 

(* Ejercicio 3 - revisado*)
let rec divide = function 
        h1::h2::t -> let t1,t2 = divide t in h1::t1 , h2::t2
        | l -> l , [];;

let rec merge l1 l2 = match l1,l2 with
        [], l | l, [] -> l
        | h1::t1, h2::t2 -> if h1 <= h2 then h1::merge t1 l2 else h2::merge l1 t2;; 

let rec msort l = match l with 
        [] | [_] -> l
        | _ -> let l1,l2 = divide l in merge (msort l1) (msort l2);;
        
let divide_t = fun(l)->
    let rec aux t1 t2 = function
        | [] -> List.rev t1, List.rev t2
        | h::[] -> aux (h::t1) t2 [] 
        | h1::h2::t -> aux (h1::t1) (h2::t2) t
    in aux [] [] l;;

let merge_t l1 l2 =
    let rec aux s s1 s2 = match (s1,s2) with       
          [],[] -> List.rev s
        | [], h::t -> aux (h::s) s1 t 
        | h::t, [] -> aux (h::s) t s2
        | h1::t1, h2::t2 -> if h1 <= h2 
            then 
                aux (h1::s) t1 s2 
            else 
                aux (h2::s) s1 t2      
    in aux [] l1 l2;;

let rec msort_qt l = match l with 
        | [] | [_] -> l
        | _ -> let l1,l2 = divide_t l in merge_t (msort_qt l1) (msort_qt l2);;

(*Ejercicio 4*)
let partition piv l = 
    let rec aux left right = function
        | [] -> (left, right)
        | h::t -> if h < piv then aux (h::left) right t else aux left (h::right) t
    in aux [] [] l;;

let rec qsort_qt = function
    | [] | _::[] as l -> l
    | h::t ->  let left, right = partition h t 
               in qsort_qt left @ (h::qsort_qt right);;

let rec qsort = function
    | [] | _::[] as l -> l
    | h::t ->  let right, left = List.partition ((<=) h) t 
               in qsort_qt left @ (h::qsort right);;




let rec insert_gen f x = function
    [] -> [x]
    | h::t -> if f x h then x::h::t else h::insert_gen f x t;;
 
let rec isort_gen f = function
    [] -> []
    | h::t -> insert_gen f h (isort_gen f t);;

let insert_t_gen f x l =
    let rec aux rev_head = function
        [] -> (List.rev (x::rev_head))
        | h::t -> if f x h then isort_aux rev_head (x::h::t) else aux (h::rev_head) t
    in aux [] l;;

let isort_t_gen f = fun(l)->
    let rec aux s = function
        [] -> s
        | h::t -> aux (insert_t_gen f h s) t
    in aux [] l;;

let rec merge_gen f l1 l2 = match l1,l2 with
        [], l | l, [] -> l
        | h1::t1, h2::t2 -> if f h1 h2 then h1::merge t1 l2 else h2::merge l1 t2;;
  
let rec msort_gen f l = match l with
        [] | [_] -> l
        | _ -> let l1,l2 = divide l in merge (msort_gen f l1) (msort_gen f l2);;

let merge_t_gen f l1 l2 =
    let rec aux s s1 s2 = match (s1,s2) with
          [],[] -> List.rev s
        | [], h::t -> aux (h::s) s1 t 
        | h::t, [] -> aux (h::s) t s2
        | h1::t1,h2::t2 -> if f h1 h2 then aux (h1::s) t1 s2 else aux (h2::s) s1 t2
    in aux [] l1 l2;;

let rec msort_qt_gen f l = match l with
        | [] | [_] -> l
        | _ -> let l1,l2 = divide_t l in merge_t_gen f (msort_qt_gen f l1) (msort_qt_gen f l2);;

let rec qsort_gen f l = match l with
        [] | [_] -> l
        | h::t -> let l1,l2 = List.partition (f h) t in qsort_gen f l2 @ (h::qsort_gen f l1);;

let partition_gen f piv l =
        let rec aux left right = function
            | [] -> (left, right)
            | h::t -> if (f h piv) then aux (h::left) right t else aux left (h::right) t
        in aux [] [] l;;
 
let rec qsort_qt_gen f = function
    | [] | _::[] as l -> l
    | h::t -> let left, right = partition_gen f h t
              in qsort_qt_gen f left @ (h::qsort_qt_gen f right);;



