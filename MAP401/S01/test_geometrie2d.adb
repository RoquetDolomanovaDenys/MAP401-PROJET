with geometrie2d_paq, ada.long_float_text_io, ada.text_io;
use geometrie2d_paq, ada.long_float_text_io,ada.text_io;


procedure test_geometrie2d is


x : Reel;
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
	put_line(a);
	put_line(b);

	u := init_vect(x,y);
	put_line(u);
	
	v := to_vect(a,b);
	put_line(v);

	u := u*2.0;
	put_line(u);

	w := u+v;
	put_line(w);

	u := w-u;
	put_line(u);

	z := u*w;
	put(z);new_line;

	u := init_vect(-4.0, 3.0);
	u := v;
	if u = v then put("vrai"); else put("faux");
	end if;
	new_line;

	z := norme(u);
	put(z);new_line;
	
	z:= distance(a,b);
	put(z);new_line;

	

end test_geometrie2d;
