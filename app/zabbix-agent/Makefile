APP_NAME=$(shell basename $(CURDIR))
SELINUX_MODULE=rabe$(subst -,,${APP_NAME})

selinux/${SELINUX_MODULE}.pp: selinux/${SELINUX_MODULE}.te
	make -C selinux NAME=${SELINUX_MODULE} -f /usr/share/selinux/devel/Makefile

clean:
	rm -rf selinux/*.pp selinux/tmp/
