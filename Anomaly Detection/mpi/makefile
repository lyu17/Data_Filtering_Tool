CC=mpicc
CFLAGS=-c -Wall
LDFLAGS=
SOURCES=detect.c grouping.c collect.c kpca.c ams.c vote.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=detect

all: $(SOURCES) $(EXECUTABLE)
        
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $(OBJECTS)

$(OBJECTS): $(SOURCES)
	$(CC) $(CFLAGS) $^

clean:
	rm -rf *o detect