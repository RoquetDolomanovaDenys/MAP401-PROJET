with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;
with image_pbm_paq;
use image_pbm_paq;

procedure test_image_pbm is

	I : image;
begin

	I := lire_image("caractere2-ligne.pbm");
	put(I);
	set_pixel(I, 1,7, 1);
	set_pixel(I, 2,7, 1);
	set_pixel(I, 34,7, 0);
	set_pixel(I, 3,7, 0);
	set_pixel(I, 4,7, 1);
	set_pixel(I, 5,7, 1);
	set_pixel(I, 6,7, 1);
	set_pixel(I, 7,7, 1);
	put_line("Image modifie:");
	put(I);
	supprimer_image(I);

end test_image_pbm;
