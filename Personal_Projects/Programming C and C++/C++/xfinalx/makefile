LogTable.exe : main.o tree.o
	g++ -o LogTable.exe main.o tree.o

main.o : main.cpp
	g++ -c main.cpp

tree.o : tree.cpp tree.h node.h
	g++ -c tree.cpp