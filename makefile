TIME=500ns
GHDL_SIM_OPT = --stop-time=$(TIME)
GHDL_FLAGS = --ieee=synopsys -fexplicit
WORKDIR = Simulate
TOP_ENTITY = spim_pipe

.PHONY : all compile simulate
all : compile simulate

compile :
	mkdir -p $(WORKDIR)
	ghdl -i --workdir=$(WORKDIR) *.vhd
	ghdl -m $(GHDL_FLAGS) --workdir=$(WORKDIR)/ $(TOP_ENTITY)

simulate :
	ghdl -r --workdir=$(WORKDIR) $(TOP_ENTITY) --stop-time=$(TIME) --wave=$(TOP_ENTITY).ghw --vcd=$(TOP_ENTITY).vcd

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
	cp -rf ./GHDL/ ~/sources
	echo PATH=~/sources/GHDL/bin/:$PATH >> ~/.bash_profile
	source ~/.bash_profile
