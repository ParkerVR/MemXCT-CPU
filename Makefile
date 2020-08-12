# ----- Make Macros -----

CXX = mpicxx
CXXFLAGS = -std=c++11 -qopenmp
OPTFLAGS = -O3 #-xmic-avx512 -qopt-prefetch=0 -qopt-report=5 -qopt-report-file=$@.optrpt

LD_FLAGS = -qopenmp

TARGETS = memxct
OBJECTS = main.o vars.h raytrace.o kernels.o

# ----- Make Rules -----

all:	$(TARGETS)

%.o: %.cpp
	${CXX} ${CXXFLAGS} ${OPTFLAGS} $^ -c -o $@

memxct: $(OBJECTS)
	$(CXX) -o $@ $(OBJECTS) $(LD_FLAGS)

clean:
	rm -f $(TARGETS) *.o *.o.* *.txt *.bin core
