#OBJ_DIR = ./
SOURCES = Variant.cpp \
		  Split.cpp

OBJECTS= $(SOURCES:.cpp=.o)
#BUILT_OBJECTS= $(patsubst %,$(OBJ_DIR)/%,$(OBJECTS))

BINS = vcfecho vcfaltcount vcfhetcount
BIN_SOURCES = vcfecho.cpp vcfaltcount.cpp vcfhetcount.cpp

all: $(OBJECTS) $(BINS)

CXX = g++
CXXFLAGS = -O3

$(OBJECTS): $(SOURCES)
	$(CXX) -c -o $@ $(*F).cpp $(LDFLAGS) $(CXXFLAGS) $(INCLUDES)

$(BINS): $(BIN_SOURCES) $(OBJECTS)
	$(CXX) $(OBJECTS) $@.cpp -o $@ $(LDFLAGS) $(CXXFLAGS) $(INCLUDES)

.PHONY: all

clean:
	rm -f $(BINS) $(OBJECTS)

.PHONY: clean all