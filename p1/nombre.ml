
(*(type alumno = Nombre of string | Email of string | Create of alumno * alumno;;)
let manu = Create(Nombre("manuel"), Email("manuel.couto1@udc.es"));;*)

type alumno = { 
	nombre: string; 
	email : string;
};;

let manu = { nombre = "manuel couto pintos\n"; email = "manuel.couto1@udc.es\n" };;

print_string "\n";

print_string manu.nombre; print_string manu.email;;

print_string "\n";
