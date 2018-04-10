TIME=500ns
GHDL = "/Users/yehowshuaimmanuel/sources/GHDL/bin/ghdl"
GHDL_SIM_OPT = --stop-time=$(TIME)
GHDL_FLAGS = --ieee=synopsys -fexplicit
WORKDIR = Simulate
TOP_ENTITY = spim_pipe
echoPath = .bash_profile

.PHONY : all compile simulate
all : compile simulate

compile :
	mkdir -p $(WORKDIR)
	$(GHDL) -i --workdir=$(WORKDIR) *.vhd
	$(GHDL) -m $(GHDL_FLAGS) --workdir=$(WORKDIR)/ $(TOP_ENTITY)

simulate :
	$(GHDL) -r --workdir=$(WORKDIR) $(TOP_ENTITY) --stop-time=$(TIME) --wave=$(TOP_ENTITY).ghw --vcd=$(TOP_ENTITY).vcd

clean :
	rm -rf Simulate
	rm -f $(TOP_ENTITY).ghw
	rm -f $(TOP_ENTITY).vcd
	rm -f e~$(TOP_ENTITY).o

install-OSX :
	tar -xzvf ./gtkwave.app.tar
	sudo cp -rf ./gtkwave.app /Applications/
	mkdir -p ~/sources
	tar -xzvf ./GHDL.tar
	cp -rf ./GHDL ~/sources
	printf "export PATH=\"~/sources/GHDL/bin/:\$${PATH}\"\n" >> ~/$(echoPath)
	source ~/.bash_profile

test :
	printf "export PATH=\"~/sources/GHDL/bin/:\$${PATH}\"\n" >> ~/$(echoPath)
