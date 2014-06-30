#variables, at the top of the file
# how quaint
CC=gcc
SOURCES=$(wildcard *.c)
ASSM=$(patsubst %c,%s,$(SOURCES))
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))
EXECUTABLE=level_1



# these are things you will call with make (e.g. `make objects`)
#
#  if no word specified, it will just do the first
# (in this case `make` does `make exec`)


# Targets -- if a target has a prereq
# make will do pause and treat prereq
# as it's new priority target
#
exec: $(EXECUTABLE)

assembly: $(ASSM)

objects: $(OBJECTS)

clean:
	rm -rf $(ASSM)
	rm -rf $(OBJECTS)
	rm -rf $(EXECUTABLE)


# Where the magic happens, mind the tab
$(EXECUTABLE): $(OBJECTS)
	$(CC) $< -o $@

$(OBJECTS): $(ASSM)
	$(CC) -c $< -o $@

#NOTE: the .c file will be automatically compiled into .s file
# of the same name
$(ASSM): $(SOURCES)
	$(CC) -S $<
