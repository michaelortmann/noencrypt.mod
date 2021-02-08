# Makefile for src/mod/noencrypt.mod/

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
noencrypt.o: noencrypt.c ../module.h ../../../src/main.h \
 ../../../config.h ../../../eggint.h ../../../lush.h ../../../src/lang.h \
 ../../../src/eggdrop.h ../../../src/compat/in6.h ../../../src/flags.h \
 ../../../src/cmdt.h ../../../src/tclegg.h ../../../src/tclhash.h \
 ../../../src/chan.h ../../../src/users.h ../../../src/compat/compat.h \
 ../../../src/compat/snprintf.h ../../../src/compat/strlcpy.h \
 ../modvals.h ../../../src/tandem.h
