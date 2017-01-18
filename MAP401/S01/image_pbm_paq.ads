-- manipulation d'image noir & blanc

with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;


package image_pbm_paq is

	-- le type pixel
	type pixel is new integer range 0..1;
	for pixel'size use 8; -- chaque pixel stocké sur 8 bits = 1 octet

	-- le type image
	type image is private;
	
	-- declaration d'exceptions 
	ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE,
	OUVERTURE_FICHIER_IMAGE_IMPOSSIBLE : exception;
	
	-- creation d'une image de dimensions LxH
	-- la function lève l'exception ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE
	-- si l'image n'a pas pue etre créée
	function creer_image(L,H : positive) return image;
	
	-- placer le pixel p en position (x,y) dans l'image M
	-- ne fait rien si (x,y) est hors bornes de l'image
	procedure set_pixel(M : in out image; x,y : in natural; p : in pixel);
	
	-- recupere le pixel p en position (x,y) dans l'image M
	-- renvoie 0 si (x,y) est hors bornes de l'image
	function get_pixel(M : in image; x,y : in natural) return pixel;
	
	-- lecture d'une image PBM ASCII
	-- la fonction lève différentes exceptions en cas de problème
	function lire_image(nom_f : in string) return image;
	
	-- ecrire l'image à l'ecran : dimensions, valeurs du tableau de pixels
	procedure put(M : image);

    -- supprimer l'image M créée précédemment par creer_image
    procedure supprimer_image(M : in out image);

private
	-- le type tableau de pixels
	type Tableau_Pixels is array(positive range<>, positive range<>) of pixel;
	type Tableau_Pixels_ptr is access Tableau_Pixels;
	
	-- le type image
	type image is record
		L,H : positive; -- largeur et hauteur
		pixels : Tableau_Pixels_ptr;
	end record;
	
end image_pbm_paq;
