
# main:
# 	c++ --std=c++11 hellomongo.cpp -o hellomongo -I/usr/local/include/mongocxx/v0.0 -I/usr/local/include/libmongoc-1.0 -I/usr/local/include/bsoncxx/v0.0 -I/usr/local/include/libbson-1.0  -L/usr/local/lib -lmongocxx -lbsoncxx

main:
	scons hellomongo
	./hellomongo

clean:
	rm -f hellomongo

.PHONY: main
