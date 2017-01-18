with ada.long_float_text_io;
use ada.long_float_text_io; 


package geometrie2d_paq is
	

	subtype Reel is long_float;
	type vecteur is record
		x,y : Reel;
	end record;
	subtype point is vecteur;
	
	function to_vect(a,b : point) return vecteur;
	function init_vect(x,y : Reel) return vecteur;
	function init_point(x,y : Reel) return point;
	function "+"(u,v : vecteur) return vecteur;
	function "-"(u,v : vecteur) return vecteur;
	function "*"(u,v : vecteur) return Reel;
	function "*"(u: vecteur; l: Reel) return vecteur;
	function "="(u,v: vecteur) return boolean;
	function norme(u : vecteur) return Reel;
	function distance(a,b : point) return Reel;
	procedure put(u : vecteur);
	procedure put_precise(u : vecteur; after, expo : natural);
	procedure put_line(u:vecteur);

	
	
end geometrie2d_paq;

