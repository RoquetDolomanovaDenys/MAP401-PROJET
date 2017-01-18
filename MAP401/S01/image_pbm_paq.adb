-- manipulation d'image noir & blanc
-- compilation du module
--   make image_pbm_paq.ali

with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;
with ada.unchecked_deallocation;

package body image_pbm_paq is

	-- creation d'une image de dimensions LxH
	-- la function lève l'exception ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE
	-- si l'image n'a pas pue etre créée
	function creer_image(L,H : positive) return image is
	
		I : image;
	
	begin
		I.L := L;
		I.H := H;
		begin
			I.pixels := new Tableau_Pixels(1..L,1..H);
		exception when others =>
			raise ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE;
		end;
		put_line("--");
		I.pixels.all := (others=>(others=>0));
		return I;
	end creer_image;
	
	-- placer le pixel p en position (x,y) dans l'image M
	-- ne fait rien si (x,y) est hors bornes de l'image
	procedure set_pixel(M : in out image; x,y : in natural; p : in pixel) is
	
	begin
		-- si (x,y) ne sont pas dans les bornes de l'image, ne rien faire
		if x<1 or x>M.L or y<1 or y>M.H then
			return;
		end if;
		M.pixels.all(x,y) := p;
	end set_pixel;
	
	-- recupere le pixel p en position (x,y) dans l'image M
	-- renvoie 0 si (x,y) est hors bornes de l'image
	function get_pixel(M : in image; x,y : in natural) return pixel is
	
	begin
		-- si (x,y) ne sont pas dans les bornes de l'image, renvoie la valeur 0
		if x<1 or x>M.L or y<1 or y>M.H then
			return 0;
		end if;
		return M.pixels.all(x,y);
	end get_pixel;
	
	-- lecture d'une image PBM ASCII
	-- la fonction lève différentes exceptions en cas de problème
	function lire_image(nom_f : in string) return image is
	
		f : file_type;
		c : character;
		H,L : positive;
		s : string(1..1000);
		ls : natural;
		M : image;
		
	begin
	
		-- ouverture du fichier
		begin
			open(f, in_file, nom_f);
		exception
			when others =>
				raise OUVERTURE_FICHIER_IMAGE_IMPOSSIBLE;
		end;
		
		get_line(f, s, ls);
		if ls = 0 or (s(1) /= 'P' and s(2) /= '1') then raise ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE;
		end if;
		
		get_line(f, s, ls);
		if ls = 0 or S(1) /= '#' then raise ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE; 
		end if;
		

		get(f,L);
		if L<=0 then raise ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE;
		end if; 
		get(f,H);
		if H<=0 then raise ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE;
		end if; 
		M := creer_image(L,H);
		if not end_of_line(f) then raise ALLOCATION_TABLEAU_PIXELS_IMPOSSIBLE;
		end if;		
		skip_line(f);

		for y in 1..H loop
			for x in 1..L loop
				get(f, c);
				while(c /= '0' and c /='1') loop
					get(f,c);
				end loop;
				if c = '1' then set_pixel(m,x,y,1); 
				end if;
			end loop;
		end loop;
			
		close(f);
		
		return M;
	end lire_image;
	
	
	-- ecrire l'image à l'ecran : dimensions, valeurs du tableau de pixels
	procedure put(M : image) is
	
	begin
		put_line("hauteur : "&Integer'Image(M.H)&" Largeur : "&Integer'Image(M.L));
		for y in 1..M.H loop 
			for x in 1..M.L loop 
				if M.pixels(x,y) = 1 then put(1, width =>0);
						     else put(0, width =>0);
				end if;
			end loop;
			new_line;
		end loop;
		

	end put;
	
	
    -- supprimer l'image M créée précédemment par creer_image
    procedure supprimer_image(M : in out image) is

		-- instancier la procédure générique ada.unchecked_deallocation
		-- afin de permettre la libération de la mémoire
		-- d'un objet de type Tableau_Pixels référencée par un pointeur
		-- de type Tableau_Pixels_Ptr
        procedure desallouer is
        new ada.unchecked_deallocation(Tableau_Pixels, Tableau_Pixels_Ptr);
    
    begin
        desallouer(M.pixels);
    end supprimer_image;

end image_pbm_paq;
