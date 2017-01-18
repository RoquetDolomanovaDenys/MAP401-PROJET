with ada.long_float_text_io, ada.text_io;
use ada.long_float_text_io, ada.text_io; 
with ada.numerics.generic_elementary_functions; 

package body geometrie2d_paq is

	package fct_reel is new ada.numerics.generic_elementary_functions(Reel);
	use Fct_Reel;

	function to_vect(a,b : point) return vecteur is
		w:vecteur;
	begin
		w.x := b.x - a.x;
		w.y := b.y - a.y;
		return w; 
	end to_vect; 
 
	function init_vect(x,y : Reel) return vecteur is 
		w:vecteur;
	begin 
		w.x := x;
		w.y := y;
		return w; 
	end init_vect; 

	function init_point(x,y : Reel) return point is
		a : point;
	begin
		a.x := x;
		a.y := y;
		return a;
	end init_point;

	function "+"(u,v : vecteur) return vecteur is 
		w: vecteur;
	begin 

		w.x := u.x + v.x; 
		w.y := u.y + v.y;
		return w; 
	end "+"; 

	function "-"(u,v : vecteur) return vecteur is 
		w : vecteur; 
	begin 
		w.x := u.x - v.x;
		w.y := u.y - v.y;
		return w;
	end "-"; 

	function "*"(u,v : vecteur) return Reel is 
	begin 
		return ((u.x)*(v.x) + (u.y)*(v.y));
	end "*"; 

	function "*"(u: vecteur; l: Reel) return vecteur is 
		w:vecteur;
	begin 
		w.x:= (u.x)*l;
		w.y := (u.y)*l;
		return w; 
	end "*"; 

	function "="(u,v: vecteur) return boolean is
	begin 	
		return (u.x=v.x and u.y=v.y);
	end "="; 

	function norme(u : vecteur) return Reel is 
	begin 
		return sqrt((u.x)**2 + (u.y)**2); 
	end norme; 

	function distance(a,b : point) return Reel is
	begin 
		return sqrt( (a.x - b.x)**2 + (a.y - b.y)**2); 
	end distance;

	procedure put(u : vecteur) is
	begin
		put("("&long_float'Image(u.x)&","&long_float'Image(u.y)&")");
	end put;

	procedure put_line(u:vecteur) is
	begin
		  put("("&long_float'Image(u.x)&","&long_float'Image(u.y)&")");
	          new_line;
	end put_line; 
end geometrie2d_paq ; 
