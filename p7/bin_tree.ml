type 'a bin_tree = 
      Empty
    | Node of 'a * 'a bin_tree * 'a bin_tree;;

(* Arbol para test *)
let tree = Node(1,Node(2,Node(3,Empty,Empty),Node(4,Empty,Empty)),
                Node(5,Node(6,Empty,Empty),Node(7,Empty,Empty)));;

exception No_branches;;

let empty = Empty;;

let comp a bb = let (x,y) = bb in Node(a, x, y);;

let root = function
      Empty -> raise No_branches
    | Node(a,_,_) ->  a;;

let branches = function
      Empty -> raise No_branches
    | Node (_,x,y) -> (x,y);;

let is_empty = function 
      Empty -> true
    | Node(_,_,_) -> false;;

let left = function
      Empty -> raise No_branches 
    | Node (_,x,_) -> x;;

let right = function
      Empty -> raise No_branches 
    | Node(_,_,y) -> y;;

let rec size = function
      Empty -> 0
    | Node (_,x,y) -> 1 + (size x) + (size y);;

let rec height = function
      Empty -> 0
    | Node (_,x,y) -> 1 + (Pervasives.max (height x) (height y));;

let pre_order ab = 
    let rec aux s = function 
          Empty -> s
        | Node (a,x,y) -> (a::s)@(aux s x)@(aux s y)
    in aux [] ab;;

let post_order ab = 
  let rec aux s = function
          Empty -> s
        | Node (a,x,y) -> (aux s y)@(aux s x)@(a::s)
  in aux [] ab;;

let in_order ab =
  let rec aux s = function
          Empty -> s
        | Node(a,x,y) -> (aux s x)@(a::s)@(aux s y)
  in aux [] ab;;

let leaves = function 
      Empty -> raise No_branches
    | Node(a,x,y) -> [(root x);(root y)];;

let rec mirror = function 
      Empty -> Empty
    | Node(a,x,y) -> Node(a, mirror y, mirror x);;

let rec tree_map f = function
      Empty -> Empty
    | Node(a,x,y) -> Node(f a,tree_map f x, tree_map f y);;

