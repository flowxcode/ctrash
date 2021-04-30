CC= gcc
CFLAGS= -std=gnu11 -Os -Werror 

# install llvm-symbolizer before using address sanitizer
ifeq ($(asan), 1)
	CFLAGS= -g -fsanitize=address -O0
	PREEXEC=export ASAN_SYMBOLIZER_PATH=$(which llvm-symbolizer);
else
	CFLAGS= -std=gnu11 -Os -Werror
endif

SOURCE=main #receiver
#ADD_SOURCE=main tests

twoBins: clean $(SOURCE)
all: clean $(SOURCE) #$(ADD_SOURCE)

%: %.c
	$(CC) $(CFLAGS) -o $@ $< -lrt

runReceiver: receiver.c
	$(PREEXEC) ./receiver

runSender: sender.c
	$(PREEXEC) ./sender

run: main.c
	$(PREEXEC) ./main

runTest: buildTest
	$(PREEXEC) ./tests

clean:
	rm -f $(SOURCE) #$(ADD_SOURCE)
