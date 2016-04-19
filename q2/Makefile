all:
	yacc -d calc.y
	flex calc.l
	cc lex.yy.c y.tab.c
