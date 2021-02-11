
val rlist_t : int -> int -> int list

val insert_t : 'a -> 'a list -> 'a list
val isort_t : 'a list -> 'a list

val divide_t : 'a list -> 'a list * 'a list
val merge_t : 'a list -> 'a list -> 'a list
val msort_qt : 'a list -> 'a list

val qsort_qt : 'a list -> 'a list

val isort_gen : ('a -> 'a -> bool) -> 'a list -> 'a list
val isort_t_gen : ('a -> 'a -> bool) -> 'a list -> 'a list

val msort_gen : ('a -> 'a -> bool) -> 'a list -> 'a list
val msort_qt_gen : ('a -> 'a -> bool) -> 'a list -> 'a list

val qsort_gen : ('a -> 'a -> bool) -> 'a list -> 'a list
val qsort_qt_gen : ('a -> 'a -> bool) -> 'a list -> 'a list

