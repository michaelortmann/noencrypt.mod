# Makefile for src/mod/noencrypt.mod/
# $Id: Makefile,v 1.10 1999/12/15 02:32:58 guppy Exp $

doofus:
	@echo ""
	@echo "Let's try this from the right directory..."
	@echo ""
	@cd ../../../; make

static: ../noencrypt.o

modules: ../../../noencrypt.so

../noencrypt.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -DMAKING_MODS -c noencrypt.c
	rm -f ../noencrypt.o
	mv noencrypt.o ../

../../../noencrypt.so: ../noencrypt.o
	$(LD) -o ../../../noencrypt.so ../noencrypt.o
	$(STRIP) ../../../noencrypt.so

depend:
	$(CC) $(CFLAGS) $(CPPFLAGS) -MM *.c > .depend

clean:
	@rm -f .depend *.o *.so *~

#safety hash
../noencrypt.o: noencrypt.c ../module.h ../../../config.h ../../main.h \
 ../../lang.h ../../eggdrop.h ../../flags.h ../../proto.h \
 ../../../lush.h ../../cmdt.h ../../tclegg.h ../../tclhash.h \
 ../../chan.h ../../users.h ../modvals.h ../../tandem.h
