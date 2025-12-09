FILE = main
ASSEMBLE = -mno-red-zone -fno-asynchronous-unwind-tables -S -O0

all: assemble

assemble: ${FILE}.c
	gcc ${ASSEMBLE} ${FILE}.c

clean:
	rm *.s

# Usage: make FILE=file
# where file is the name of the C file without extension (.c)