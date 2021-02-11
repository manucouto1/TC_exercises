
type 'a bin_tree =
     Empty
   | Node of 'a * 'a bin_tree * 'a bin_tree

exception No_branches

val empty : 'a bin_tree
val comp : 'a -> 'a bin_tree * 'a bin_tree -> 'a bin_tree
val root : 'a bin_tree -> 'a
val branches : 'a bin_tree -> 'a bin_tree * 'a bin_tree
val is_empty : 'a bin_tree -> bool
val left : 'a bin_tree -> 'a bin_tree
val right : 'a bin_tree -> 'a bin_tree
val size : 'a bin_tree -> int
val height : 'a bin_tree -> int
val pre_order : 'a bin_tree -> 'a list
val post_order : 'a bin_tree -> 'a list
val in_order : 'a bin_tree -> 'a list
val leaves : 'a bin_tree -> 'a list
val mirror : 'a bin_tree -> 'a bin_tree
val tree_map : ('a -> 'b) -> 'a bin_tree -> 'b bin_tree

