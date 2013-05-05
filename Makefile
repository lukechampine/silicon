# silicon - simple ncurses editor
# See LICENSE file for copyright and license details.

include config.mk

SRC = silicon.c
OBJ = ${SRC:.c=.o}

all: options silicon

options:
	@echo silicon build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

silicon: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ silicon.o ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f silicon ${OBJ} silicon-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p silicon-${VERSION}
	@cp -R LICENSE Makefile config.mk config.def.h \
		README TODO silicon.1 ${SRC} silicon-${VERSION}
	@tar -cf silicon-${VERSION}.tar silicon-${VERSION}
	@gzip silicon-${VERSION}.tar
	@rm -rf silicon-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f silicon ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/silicon
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < silicon.1 > ${DESTDIR}${MANPREFIX}/man1/silicon.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/silicon.1

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/silicon
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	rm -f ${DESTDIR}${MANPREFIX}/man1/silicon.1

.PHONY: all options clean dist install uninstall
