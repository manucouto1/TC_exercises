open St_tree;;

let is_single ab = 
    try (function _ -> false) (branches ab)
    with No_branches -> true;;

let left ab = let (i,_) = branches ab in i;;

let right ab = let (_,j) = branches ab in j;;

let rec size ab = match (is_single ab) with
        | true -> 1
        | false -> 1 + size (left ab) + size (right ab);;

let rec height ab = match (is_single ab) with
        | true -> 1
        | false -> 1 + Pervasives.max (height (left ab)) (height (right ab));;

let rec pre_order ab = match (is_single ab) with
        | true -> root ab::[]
        | false -> (root ab)::(pre_order (left ab))@(pre_order(right ab));;

let post_order ab =
    let result = pre_order ab in List.rev result;;

let rec in_order ab = match (is_single ab) with
        | true -> root ab::[]
        | false -> (in_order (left ab))@((root ab)::[])@(in_order (right ab));;

let rec leaves ab = match (is_single ab) with 
        | true -> []
        | false -> let (a,b) = branches ab in [(root a);(root b)];;

let rec mirror ab = match (is_single ab) with
        | true -> ab
        | false -> let (a,b) = branches ab 
        in comp (root ab) ((mirror b), (mirror a));;

let rec tree_map f ab = match (is_single ab) with
        | true -> single(f(root ab))
        | false -> let (x, y) = branches ab in comp (f(root ab))(tree_map f x, tree_map f y);;
