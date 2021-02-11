
let my_lowercase n = if(Char.code n >= 65 && Char.code n <= 90)
		 			 then (char_of_int(Char.code n + 32)) 
		 			 else n;;

	
let my_uppercase n = if(Char.code n >= 97 && Char.code n <= 122)
		 			 then (char_of_int(Char.code n + 32)) 
					 else n;;

