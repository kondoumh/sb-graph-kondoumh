COMMAND = sbgraph
PROJECT = kondoumh
VERSION = v0.7.0

define BUILD_GRAPH
	$(COMMAND) init
	$(COMMAND) project -p $(PROJECT)
	$(COMMAND) fetch
	$(COMMAND) graph -i=true -a=true -j=true
	ls -l _work/$(PROJECT) | wc -l
	mv _work/$(PROJECT)_graph.json public
endef

define INSTALL_SBGRAPH
	curl -LO https://github.com/mamezou-tech/sbgraph/releases/download/$(VERSION)/sbgraph-linux-amd64.tar.gz
	tar xvf sbgraph-linux-amd64.tar.gz
	mkdir -p ~/bin
	export PATH=$PATH:~/bin
	mv sbgraph ~/bin
endef

.PHONY: install
install:
	$(call INSTALL_SBGRAPH) $(VERSION)

.PHONY: build
build:
	$(call BUILD_GRAPH) $(PROJECT)
