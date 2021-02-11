type 'a st_tree = 
      S of 'a
    | C of 'a * 'a st_tree * 'a st_tree;;

exception No_branches;;

let single e = S e;;
let comp r (i,d) = C (r,i,d);;
let root = function S r | C (r,_,_) -> r;;
let branches = function C (_,i,d) -> (i,d) | _ -> raise No_branches;;
let rec print_tree f = function
    | S x -> f x
    | C (a,x,y) -> print_string "("; f a;print_string "("; print_tree (f) x;print_string ",";print_tree (f) y; print_string "))";;  

