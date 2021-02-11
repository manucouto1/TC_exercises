let rec lprod l1 l2 = 
	let rec aux s x y =
		match (x,y) with
			| ([],[]) -> List.rev s
			| ([],hh::tt) -> List.rev s
			| (h::t,hh::tt) -> aux ((h,hh)::s) x tt
			| (h::t,[]) -> aux s t l2
	in aux [] (l1) (l2);;
