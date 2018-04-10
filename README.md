# quick-ghdl-toolchain
## Status
The installer should now work. If you ran the installer before 2:10 April 10, delete the last line added to your ~/.bash_profile. Delete your quick-ghdl-toolchain directory and run $git clone https://github.com/BracketMaster/quick-ghdl-toolchain.git again.
## Overview
This is designed to help 3056 students quickly complete their vhdl simulation projects without wasting valueable tiem with the shortcoming and slowness of Modelsim. This toolchain is based off of GHDL and GTKWave - both venerable open source projects.
## Benefits
This toolchain takes a total of 1 or 2 seconds to re-compile VHDL code and re-display it - best of all, it preserves the layout of signal files accross sessions - so no need to re add signals upon every compile.
## Note
All commands with "$" for example $vim means type vim without the "$".
## Support
This toolchain currently only supports MacOS. Canonicals Ubuntu has adopted a very troubling repository policy making it difficult for me to make this toolchain easily accessible to users of debian-derived Linux distros.

In addition, the is no app-package for GHDL - while I could make one in theory - I am not up to speed on the new app-package format and I generally try to stay away from generating static compiles in linux as this can be very daunting - and the kernel changes from release to release - creating possible issues with the dynamic loader.
## Installation
Open up terminal and just follow these steps!
1. git clone https://github.com/BracketMaster/quick-ghdl-toolchain.git
2. cd quick-ghdl-toolchain
3. make install-OSX - it'll probably ask for your password when install gtk-wave - so pay close attention!
4. test that ghdl has been properly installed by typing $ghdl - it should respond  - ghdl:error: missing command, try ghdl --help
4. If it doesn't respond, type $source ~/.bash_profile and try again.
5. copy the makefile in the "quick-ghdl-toolchain" directory to wherever you vhdl file are
6. Once you are ready to simulate - make sure you are in the directory with the vhdl files and just type $make
7. Use GTKWave to view your waveform - it should be installed under applications on your Mac
## Using GTKWave
1. To view your Waveform in GTKWave - double click on the file that ends in .ghw in your project directory - for this project - it should be "spim_pipe.ghw"
2. You select the signal family from the left in the SST panel, then select the specific signal in "Signals" panel which is below the "SST" panel.
3. Drag the selected signal into the tall "Signals" pane to the right
4. Your signal should now show up on the graph
5. Use the zoom buttons +/- to zoom out from the default femto seconds to nanoseconds
6. To save your worksession so that you can return to view the selected signals, do, file -> write savefile -> save it somewhere. This new file should end in .gtkw. Double click the .gtkw file in finder and your session will be restored.
## Recompiling
1. make sure you are in the directory with the vhdl files and just type $make - then switch over to your open waveform in GTKWave and press command+shift+r - voila - your waveform is updated.
