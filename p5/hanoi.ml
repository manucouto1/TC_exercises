let hanoi (a,b,c) n =
	let rec aux alt org inter dest = 
		match alt with
        | 0 -> []
		| _ -> (aux (alt - 1) org dest inter)
                @(org,dest)::aux (alt - 1) inter org dest 
    in aux n a b c;;
