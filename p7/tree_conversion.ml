open Bin_tree;;
open St_tree;;

let is_single ab = 
  try (function _ -> false) (St_tree.branches ab)
  with No_branches -> true;;

let rec bin_tree_of_st_tree stt = match(is_single stt) with 
    true -> Empty
  | false -> let (x,y) = St_tree.branches stt in 
             Node(St_tree.root stt, bin_tree_of_st_tree x, 
                  bin_tree_of_st_tree y) ;;

let rec st_tree_of_bin_tree = function 
      Empty -> raise Bin_tree.No_branches
    | Node(a,Empty,Empty) -> St_tree.single a
    | Node(a,x,y) -> St_tree.comp a (st_tree_of_bin_tree x, st_tree_of_bin_tree y);; 
