main : main.o hello.o
	g++-11 -o main main.o hello.o

main.o : main.cpp gcm.cache/smd.hello.gcm
	g++-11 -fPIC -fmodules-ts -x c++ -o main.o -c main.cpp

hello.o: hello.cpp
	g++-11 -fPIC -fmodules-ts -x c++ -o hello.o -c hello.cpp

gcm.cache/smd.hello.gcm:  hello.o
	@test -f $@ || rm -f hello.o
	@test -f $@ || $(MAKE) hello.o

clean:
	rm hello.o main.o gcm.cache/smd.hello.gcm

clean-gcm:
	rm gcm.cache/smd.hello.gcm

test:
	./main
