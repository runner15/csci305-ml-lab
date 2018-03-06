(***************************************************************
*
* CSCI 305 - ML Programming Lab
*
* Zachariah Fahsi
* zachariah.fahsi@student.montana.edu
*
***************************************************************)

(* Define your data type and functions here *)
fun f [] = [] (* a *)
   | f (x::xs) = (x + 1) :: (f xs); (* b *)

f [3, 1, 4, 1, 5, 9]; 

datatype 'element set = Empty | Set of 'element * 'element set;

fun isMember e set : bool =
	case set of 
		Set(a,b) =>
			if e=a then true
			else isMember e b |
		Empty => false;

fun delete(x,[]) = []
    | delete(x,y::l) = if x=y then delete(x,l) else y::delete(x,l);
fun duplication [] = []
    | duplication (x::l) = x::duplication(delete(x,l)); 

fun list2Set [] = Empty
	| list2Set (x::xs) = 
		let
			val s = list2Set(xs);
		in
			if isMember x s then list2Set(duplication(x::xs))
			else Set(x,s)
		end;

(* Simple function to stringify the contents of a Set of characters *)
fun stringifyCharSet Empty = ""
  | stringifyCharSet (Set(y, ys)) = Char.toString(y) ^ " " ^ stringifyCharSet(ys);

(* Simple function to stringify the contents of a Set of ints *)
fun stringifyIntSet Empty = ""
  | stringifyIntSet (Set(w, ws)) = Int.toString(w) ^ " " ^ stringifyIntSet(ws);

(* Simple function to stringify the contents of a Set of strings *)
fun stringifyStringSet Empty = ""
  | stringifyStringSet (Set(z, zs)) = z ^ " " ^ stringifyStringSet(zs);

(* Simple function that prints a set of integers *)
fun print_int x = print ("{ " ^ stringifyIntSet(x) ^ "}\n");

(* Simple function that prints a set of strings *)
fun print_str x = print ("{ " ^ stringifyStringSet(x) ^ "}\n");

(* Simple function that prints a set of characters *)
fun print_chr x = print ("{ " ^ stringifyCharSet(x) ^ "}\n");

list2Set [1, 3, 2];
list2Set [#"a", #"b", #"c"];
list2Set [];
list2Set [6, 2, 2];
list2Set ["x", "y", "z", "x"];

(* Question 1 *)
f [3, 1, 4, 1, 5, 9];

(* Question 5 *)
val quest5 = isMember "one" (list2Set ["1", "2", "3", "4"]);
print ("\nQuestion 5: " ^ Bool.toString(quest5) ^ "\n");

(* Question 7 *)
val quest7 = list2Set ["it", "was", "the", "best", "of", "times,", "it", "was", "the", "worst", "of", "times"];
print "\nQuestion 7: ";
print_str quest7;
print "\n";

(* Question 9 *)
print "\nQuestion 9: ";
print_str (union (list2Set ["green", "eggs", "and"]) (list2Set ["ham"]));

(* Question 10 *)
print "\nQuestion 10: ";
print_str (intersect (list2Set ["stewed", "tomatoes", "and", "macaroni"]) (list2Set ["macaroni", "and", "cheese"]));
