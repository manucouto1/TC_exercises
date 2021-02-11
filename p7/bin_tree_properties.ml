open Bin_tree;;
open St_tree;;

let is_strict bt = match Bin_tree.is_empty bt with
  | true -> false 
  | false -> let rec aux btr = match Bin_tree.branches btr with
                | (Bin_tree.Empty,Bin_tree.Empty) -> true
                | (Bin_tree.Empty, (Bin_tree.Node (_,_,_))) | ((Bin_tree.Node (_,_,_)), Bin_tree.Empty) -> false 
                | ((Bin_tree.Node _ ) as br1, ((Bin_tree.Node _ ) as br2)) -> aux br1 && aux br2
             in aux bt;; 

let is_perfect bt =
    let rec aux br = match br with 
      | Bin_tree.Empty -> true
      | Bin_tree.Node (_,x,y) -> Bin_tree.height x = Bin_tree.height y && (aux x) && (aux y)
    in (is_strict bt) && (aux bt);;


let is_complet bt = 
    let rec aux br = match br with
      | Bin_tree.Empty -> true
      | Bin_tree.Node (_,x,Empty) -> (Bin_tree.height x) <= 1 && (aux x) 
      | Bin_tree.Node (_,x,y) -> Bin_tree.height x >= Bin_tree.height y && (aux x) && (aux y)
    in aux bt;;