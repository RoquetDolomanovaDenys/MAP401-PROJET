#############################################################################
# Fichier Makefile - MAP244 - 2015-2016
#############################################################################
# utilisation des variables internes $< $@ $*
# $@ : correspond au nom de la cible
# $< : correspond au nom de la premiere dependance
# $* : correspond au nom du fichier sans extension 
#       (dans les regles generiques uniquement)
#############################################################################
# information sur la regle executee avec la commande @echo
# (une commande commancant par @ n'est pas affichee a l'ecran)
#############################################################################


#############################################################################
# definition des variables locales
#############################################################################

# chemin d'acces aux librairies (interfaces)
INCDIR = .

# chemin d'acces aux librairies (binaires)
LIBDIR = .

# options pour l'édition des liens
GNATLDOPTS = -L$(LIBDIR)

# options pour la recherche des fichiers .ali et .ads
INCLUDEOPTS = -I$(INCDIR)

# options de compilation
COMPILOPTS = -g $(INCLUDEOPTS)

# liste des executables
EXECUTABLES = test_image_pbm test_geometrie2d


#############################################################################
# definition des regles
#############################################################################

########################################################
# la règle par défaut
all : $(CIBLE)

########################################################
# regle generique : 
#  remplace les regles de compilation separee de la forme
#	module.ali : module.adb module.ads
#		gnat compile $(COMPILOPTS) module.adb
%.ali : %.adb %.ads
	@echo ""
	@echo "---------------------------------------------"
	@echo "Compilation du paquetage "$*
	@echo "---------------------------------------------"
	gnat compile $(COMPILOPTS) $<

########################################################
# regles explicites de compilation separee de modules
# n'ayant pas de fichier .ads ET/OU dependant d'autres paquetages
test_image_pbm.ali : test_image_pbm.adb image_pbm_paq.ali 
	@echo ""
	@echo "---------------------------------------------"
	@echo "Compilation de la procedure test_image_pbm_paq"
	@echo "---------------------------------------------"
	gnat compile $(COMPILOPTS) $<

test_geometrie2d.ali : test_geometrie2d.adb geometrie2d_paq.ali 
	@echo ""
	@echo "---------------------------------------------"
	@echo "Compilation de la procedure test_geometrie2d"
	@echo "---------------------------------------------"
	gnat compile $(COMPILOPTS) $<

########################################################
# regles explicites de creation des executables
test_image_pbm : test_image_pbm.ali 
	@echo ""
	@echo "---------------------------------------------"
	@echo "Creation de l'executable "$@
	@echo "---------------------------------------------"
	gnat bind -x $(COMPILOPTS) $<
	gnat link $< $(GNATLDOPTS) -o $@

test_geometrie2d : test_geometrie2d.ali 
	@echo ""
	@echo "---------------------------------------------"
	@echo "Creation de l'executable "$@
	@echo "---------------------------------------------"
	gnat bind -x $(COMPILOPTS) $<
	gnat link $< $(GNATLDOPTS) -o $@

# règle pour la (re)construction de tous les exécutables
all_exec : $(EXECUTABLES)

# regle pour "nettoyer" le répertoire
clean:
	rm -fR $(EXECUTABLES) *.o *.ali b~*
