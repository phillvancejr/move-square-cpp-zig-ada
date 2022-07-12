default: all

flags=-I/usr/local/include
libs=-L/usr/local/lib -lminifb -framework Cocoa -framework IOKit -framework Metal -framework MetalKit

all: ada rest

select:
	sudo xcode-select -s /Library/Developer/CommandLineTools

reset:
	sudo xcode-select -r

_rest: zig cc
rest: select _rest reset_select

ada_libs= $(foreach lib, $(libs), -largs $(lib))
ada: ada_square.adb
	gnatmake -f -D temp -Iminifb_ada ada_square $(ada_libs)

zig: zig_square.zig
	zig build-exe -femit-bin=zig_square $(flags) $(libs) -OReleaseSmall zig_square.zig

cc: cc_square.cc
	clang++ -std=c++20 $(flags) $(libs) -o cc_square -O3 cc_square.cc
zcc: cc_square.cc
	zig c++ -std=c++20 $(flags) $(libs) -o cc_zig_square -O3 cc_square.cc
