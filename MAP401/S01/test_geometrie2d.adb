with geometrie2d_paq, ada.long_float_text_io, ada.text_io;
use geometrie2d_paq, ada.long_float_text_io,ada.text_io;


procedure test_geometrie2d is


x :Reel;
y: Reel;
z: Reel;

u : vecteur;
v : vecteur;
w : vecteur;

a : point;
b : point;

begin
	x:= 5.0;
	y:=5.0;
	
	a := init_point(2.0, 4.0);
	b := init_point(7.0, 6.0);
	put_line("Point a :");
	put_line(a);
	put_line("Point b :");
	put_line(b);

	u := init_vect(x,y);
	put_line("Vecteur u :");
	put_line(u);
	
	v := to_vect(a,b);
	put_line("Vecteur v :");
	put_line(v);
	
	put_line("u = u*2 : ");
	u := u*2.0;
	put_line(u);

	put_line("w = u+v");
	w := u+v;
	put_line(w);

	put_line("u = w+u");
	u := w-u;
	put_line(u);

	put_line("produit scalire de u et w :");
	z := u*w;
	put(z);new_line;

	put_line("Nouveau vecteur u : ");
	u := init_vect(-4.0, 3.0);
	put_line(u);
	put_line("u = v : ");
	u := v;
	put_precise(u, 2, 0); new_line;
	put_line("u = v ?");
	if u = v then put("vrai"); else put("faux");
	end if;
	new_line;

	put_line("norme de u");
	z := norme(u);
	put(z);new_line;
	
	put_line("distance entre a et b :");
	z:= distance(a,b);
	put(z);new_line;

	

end test_geometrie2d;
