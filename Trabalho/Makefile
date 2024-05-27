all:
	flex singedComp.l
	bison -d -Wcounterexamples singedComp.y
	gcc *.c -o singedComp