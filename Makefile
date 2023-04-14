all: main.l main.y 
	bison -d main.y
	flex main.l
	gcc -o bitwise main.tab.c lex.yy.c mystack.c -lfl -lm 
	./bitwise < test

clean: 
	rm main.tab.cc main.tab.hh || true
	rm main.tab.c main.tab.h || true
	rm lex.yy.cc lex.yy.c bitwise

