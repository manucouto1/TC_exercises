
val is_single : 'a St_tree.st_tree -> bool
val left : 'a St_tree.st_tree -> 'a St_tree.st_tree
val right : 'a St_tree.st_tree -> 'a St_tree.st_tree
val size : 'a St_tree.st_tree -> int
val height : 'a St_tree.st_tree -> int
val pre_order : 'a St_tree.st_tree -> 'a list
val post_order : 'a St_tree.st_tree -> 'a list
val in_order : 'a St_tree.st_tree -> 'a list
val leaves : 'a St_tree.st_tree -> 'a list
val mirror : 'a St_tree.st_tree -> 'a St_tree.st_tree
val tree_map : ('a -> 'b) -> 'a St_tree.st_tree -> 'b St_tree.st_tree

