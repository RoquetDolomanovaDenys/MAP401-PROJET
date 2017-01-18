with ada.text_io;
use ada.text_io;
with ada.integer_text_io;
use ada.integer_text_io;
with image_pbm_paq;
use image_pbm_paq;

procedure test_image_pbm is

	I : image;
begin

	I := lire_image("caractere2.pbm");
	put(I);
	supprimer_image(I);

end test_image_pbm;
