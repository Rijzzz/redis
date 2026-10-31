CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2 -pthread
SRCDIR = src
OBJDIR = obj

SERVER_SRCS = $(SRCDIR)/server.cpp \
              $(SRCDIR)/hashtable.cpp \
              $(SRCDIR)/avl.cpp \
              $(SRCDIR)/zset.cpp \
              $(SRCDIR)/heap.cpp \
              $(SRCDIR)/thread_pool.cpp

SERVER_OBJS = $(SERVER_SRCS:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
CLIENT_OBJ = $(OBJDIR)/client.o

all: server client

server: $(SERVER_OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

client: $(CLIENT_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(OBJDIR)
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

clean:
	rm -rf $(OBJDIR) server client *.exe

.PHONY: all clean
