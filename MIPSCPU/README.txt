Apologies for the delay, but I basically started completely over and implemented a more modular design(added more complete executue stage wrapper).  I got in trouble with setting my synchronous statements, and didn't know what or where each variable.  Plus now my code is much cleaner although uncommented as I was piecing together code from a little bit of everywhere.

testbench_EX verifies design in modelsim. Reg30out will be value sent to hexs before decoding.

de2wrapper should be set as top level design in quartus to run on the board.