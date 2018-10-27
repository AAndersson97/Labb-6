all: lib electrotest

CC = gcc

LIB = ./lib/

INSTDIR = /usr/lib/Uppgift6/

lib: libcomponent.so libpower.so libresistance.so
	mkdir $(LIB)

electrotest: lib electrotest.o libcomponent.so libpower.so libresistance.so
	mv libcomponent.so $(LIB); \
	mv libpower.so $(LIB); \
	mv libresistance.so $(LIB);\
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
	rm electrotest;\
	rm libresistance.o libpower.o libcomponent.o;\
	rm -R $(LIB)

install:
	sudo mkdir $(INSTDIR); \
	sudo cp electrotest $(INSTDIR); \
	sudo cp -R $(LIB) $(INSTDIR); \
	sudo $(CC) -o electrotest electrotest.o $(INSTDIR)$(LIB)libcomponent.so $(INSTDIR)$(LIB)libpower.so $(INSTDIR)$(LIB)libresistance.so

uninstall:
	sudo rm -R $(INSTDIR)
