all: lib electrotest

CC = gcc

LIB = ./lib/

INSTDIR = /usr/lib/Uppgift6/

lib: libcomponent.so libpower.so libresistance.so
	mkdir $(LIB) 2> /dev/null; \
	mv *.so $(LIB);

electrotest: lib electrotest.o libcomponent.so libpower.so libresistance.so
	$(CC) -o electrotest electrotest.o $(LIB)libcomponent.so $(LIB)libpower.so $(LIB)libresistance.so


libcomponent.o: libcomponent.h libcomponent.c
	$(CC) -fPIC -c libcomponent.c

libpower.o: libpower.h libpower.c
	$(CC) -fPIC -c libpower.c

libresistance.o: libresistance.h libresistance.c
	$(CC) -fPIC -c libresistance.c

libcomponent.so: libcomponent.o libcomponent.h
	$(CC) -shared -o libcomponent.so libcomponent.o

libpower.so: libpower.o libpower.h
	$(CC) -shared -o libpower.so libpower.o

libresistance.so: libresistance.o libresistance.h
	$(CC) -shared -o libresistance.so libresistance.o


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
