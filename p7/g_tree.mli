open Bin_tree;;

type 'a g_tree = G of 'a * 'a g_tree list

val cod_as_bin: 'a g_tree -> 'a Bin_tree.bin_tree

val dec_from_bin: 'a Bin_tree.bin_tree -> 'a g_tree