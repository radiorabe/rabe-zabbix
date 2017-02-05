all: */Makefile
	make -C $(dir $<)

clean: */Makefile
	make -C $(dir $<) clean
