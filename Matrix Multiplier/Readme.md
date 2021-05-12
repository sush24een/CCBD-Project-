# PES CCBD Project: 4x4 Matrix Multiplier

Software Installation steps:

<ul>
	* sudo apt-get update 

	* sudo apt-get install iverilog 

	* sudo apt-get install gtkwave 
</ul>

## Execution steps:
<b>execute the files main.v and testbench.v as mentioned below</b>
 
    Step1) iverilog -o aout main.v testbench.v 

   <i>If the compilation went OK, you won't see any output. <br />
	What this does is create a file called  aout that we can feed to the simulator.</i>

    Step2) vvp aout 

	<i>You can observe output on the console</i>

    Step3) gtkwave dump.vcd 

	<i>Output waveform will be observed.</i>

