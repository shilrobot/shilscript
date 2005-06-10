# Makefile for shilscript
# Generated by makemake

CC = g++ -Wall -ansi
	
all: shilscript

Globals.o: Globals.cpp Globals.h
	@echo Compiling Globals.cpp...
	@$(CC) -c Globals.cpp -o Globals.o

Lexer.o: Lexer.cpp Globals.h State.h Value.h Opcodes.h Vector.h Tokens.h \
  Lexer.h Keywords.h Identifier.h Function.h Stack.h LLStack.h Parser.h
	@echo Compiling Lexer.cpp...
	@$(CC) -c Lexer.cpp -o Lexer.o

Main.o: Main.cpp SHilScript.h Globals.h State.h Value.h Opcodes.h \
  Vector.h Tokens.h Lexer.h Keywords.h Identifier.h Function.h Stack.h \
  LLStack.h
	@echo Compiling Main.cpp...
	@$(CC) -c Main.cpp -o Main.o

Parser.o: Parser.cpp Globals.h Parser.h Lexer.h Tokens.h Keywords.h \
  Vector.h Opcodes.h Value.h Identifier.h Stack.h State.h Function.h \
  LLStack.h Operators.h
	@echo Compiling Parser.cpp...
	@$(CC) -c Parser.cpp -o Parser.o

State.o: State.cpp Globals.h State.h Value.h Opcodes.h Vector.h Tokens.h \
  Lexer.h Keywords.h Identifier.h Function.h Stack.h LLStack.h Parser.h
	@echo Compiling State.cpp...
	@$(CC) -c State.cpp -o State.o

Tokens.o: Tokens.cpp Globals.h Tokens.h
	@echo Compiling Tokens.cpp...
	@$(CC) -c Tokens.cpp -o Tokens.o

Value.o: Value.cpp Globals.h Value.h
	@echo Compiling Value.cpp...
	@$(CC) -c Value.cpp -o Value.o

shilscript: Globals.o Lexer.o Main.o Parser.o State.o Tokens.o Value.o
	@echo Linking...
	@$(CC) -o shilscript Globals.o Lexer.o Main.o Parser.o State.o Tokens.o Value.o
	
remove-temp:
	@echo Removing .o files...
	@-rm -f *.o
	
clean: remove-temp
	@echo Removing output program files...
	@-rm -f shilscript
	@-rm -f shilscript.exe # cygwin
	
rebuild: clean all
	