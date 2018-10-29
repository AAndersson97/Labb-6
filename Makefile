all: lib electrotest

CC = gcc
LIB = ./lib/
CFLAGS = -fPIC -c
LIBFLAGS = -shared -o
INSTDIR = /usr/bin/Uppgift6/

lib: clean libcomponent.so libpower.so libresistance.so
	mkdir $(LIB) 2> /dev/null; \
	mv *.so $(LIB);

electrotest: lib electrotest.o libcomponent.so libpower.so libresistance.so
	$(CC) -o electrotest electrotest.o $(LIB)libcomponent.so $(LIB)libpower.so $(LIB)libresistance.so


libcomponent.o: libcomponent.h libcomponent.c
	$(CC) $(CFLAGS) libcomponent.c

libpower.o: libpower.h libpower.c
	$(CC) $(CFLAGS) libpower.c

libresistance.o: libresistance.h libresistance.c
	$(CC) $(CFLAGS) libresistance.c

libcomponent.so: libcomponent.o libcomponent.h
	$(CC) $(LIBFLAGS) libcomponent.so libcomponent.o

libpower.so: libpower.o libpower.h
	$(CC) $(LIBFLAGS) libpower.so libpower.o

libresistance.so: libresistance.o libresistance.h
	$(CC) $(LIBFLAGS) libresistance.so libresistance.o


clean:
	rm electrotest 2> /dev/null; \
	rm libresistance.o libpower.o libcomponent.o 2> /dev/null; \
	rm -R $(LIB) 2> /dev/null; \
	return 0; 

install: electrotest
	if ! [ -d $(INSTDIR) ]; \
	then \
		sudo mkdir $(INSTDIR); \
		sudo cp electrotest $(INSTDIR); \
		sudo cp -R $(LIB) $(INSTDIR); \
		sudo chown $(USER) $(INSTDIR); \
		sudo chown $(USER) $(INSTDIR)/lib; \
	fi

uninstall:
	if [ -d $(INSTDIR) ]; \
	then \
		sudo rm -R $(INSTDIR); \
	fi 
