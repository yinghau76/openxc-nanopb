ccflags-y := -std=gnu99 -Wno-declaration-after-statement -DPB_SYSTEM_HEADER=\"pb_system.h\"

obj-m += openxc.o
openxc-objs := main.o pb_encode.o pb_decode.o pb_common.o openxc.pb.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

watch:
	@while true; do \
	    echo \\n━━━━━━━━; \
	    make; \
	    inotifywait -qre close_write .; \
	done