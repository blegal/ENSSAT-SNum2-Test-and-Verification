# Back to VHDL design :-)

Now that you've become experts at verifying software components, let's take a look at applying the same methods to hardware.

## Step 1

Write a VHDL module to iteratively implement the GCD calculation. To standardize the development of your VHDL modules, you will use the following prototype:

```
ENTITY PGCD IS
PORT ( 
	CLK      : in  STD_LOGIC;
	RESET    : in  STD_LOGIC;

	idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
	idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
	idata_en : in  STD_LOGIC;

	odata    : out STD_LOGIC_VECTOR (31 downto 0);
	odata_en : out STD_LOGIC
);
END PGCD;
```

The **idata_en** signal tells your VHDL module that the **idata_a** and **idata_b** inputs are valid and that you should start a calculation. In theory, the **idata_en** signal remains high for only one clock cycle.

The **odata_en** signal is the counterpart of the **idata_en** signal. It tells the rest of your system that your module has just completed its calculation and that the **odata** output is valid. It's up to you to keep this signal as high as a single clock edge.

Now you know which architecture you need to develop:

- [X] Launch the Vivado tool and create a project targeting the FPGA available on the Nexys-4 board.

- [X] **Draw** the state machine that will enable you to compute the GCD of 2 numbers.

- [X] Describe your PGDC module in VHDL language.

- [X] Write a testbench to verify its correct operation. Initially, you will limit this approach to 3 or 4 pairs of values, which you will hard-code into the testbench.

:bulb: To generate the skeleton of your testbench in vhdl, you can use an online generator:

- [X] https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl
- [X] https://vhdl.lapinoo.net/testbench/

:page_with_curl: In your report, you'll provide an easy-to-understand graphical representation of your state machine. You should also indicate the values you have used to validate its correct operation.


## Step 2

Now that you have a working version of the PGDC computation module, you can start instrumenting your source code with assertions.

- [X] Insert in your module the same assertions you used in your **C/C++** code.

- [X] Verify the correct operation of the instrumented module using a simulation.

:bulb: You can find information on using assertions in VHDL here:

```
https://insights.sigasi.com/tech/vhdl-assert-and-report
```

:page_with_curl: In your report, you'll indicate the assertions you've introduced. In addition, you should indicate the possible uses of VHDL in C/C++.

## Step 3

Handwriting test values in VHDL and validating them by eye is not a viable long-term approach. It's time-consuming and plantogenic. So now we're going to automate your component test procedure. To do this, we're going to reuse the **C** code you wrote in phase 1.

To be able to test your VHDL module, you may have written lines similar to those shown below:

```
idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 10, 32) );
idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 80, 32) );
idata_en <= '1';
wait for 10 ns;
idata_en <= '0';
wait for 1000 ns;
```

The approach is interesting BUT you are obliged to look at the signals at each simulation to determine whether the behavior of your module is correct or not. Moreover, you're extending the simulation time because you don't have full control over the component's execution time.

To overcome these limitations, you can use the following testing approach:

```
idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 10, 32) );
idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 80, 32) );
idata_en <= '1';
wait for 10 ns;
while odata_en = '0' loop
    idata_en <= '0';
    wait for 10 ns;
end loop;

idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 18, 32) );
idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 12, 32) );
idata_en <= '1';
wait for 10 ns;
while odata_en = '0' loop
    idata_en <= '0';
    wait for 10 ns;
end loop;
```

In this way, tests are automatically run one after the other as soon as your VHDL module has returned a value. This avoids timing errors when injecting test data.

- [X] Modify your testbench to test and validate this approach.

The situation is better than before, but the designer still has a role to play in the test procedure. In fact, results are still verified visually. Using assertion mechanisms, we're going to correct this.

```
idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 10, 32) );
idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 80, 32) );
idata_en <= '1';
wait for 10 ns;
while odata_en = '0' loop
    idata_en <= '0';
    wait for 10 ns;
end loop;
ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY ERROR;

idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 18, 32) );
idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 12, 32) );
idata_en <= '1';
wait for 10 ns;
while odata_en = '0' loop
    idata_en <= '0';
    wait for 10 ns;
end loop;
ASSERT UNSIGNED(odata) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
```

- [X] Modify your testbench to test and validate this approach.

As a result, the designer has much less work to do. All that's needed now is to check that the simulator hasn't crashed during simulation with an error message. 

However, it's possible to do even better:

- [X] Use one of your **C/C++** programs written in the first part and modify the **main** function to automatically generate the VHDL blocks used for testing (see below). A few printf commands should be enough...

```
idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 18, 32) );
idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 12, 32) );
idata_en <= '1';
wait 10 ns;
while odata_en = '0' loop
    idata_en <= '0';
    wait 10 ns;
end loop;
ASSERT UNSIGNED( odata ) = TO_UNSIGNED( 6, 32) SEVERITY ERROR;
```

- [x] Run your program and copy and paste the information displayed in your terminal directly into your testbench.

- [x] Run a simulation to check that it works and validate the benefits of this approach.

:page_with_curl: In your report, comment on the advantages of this approach and point out its major drawbacks.


## Step 4

Another approach that avoids having to modify your testbench file all the time is to pass data through text files. The VHDL language allows you to read and write to text files, but this is more complicated than in C...

For an example, click on the link below:

https://www.nandland.com/vhdl/examples/example-file-io.html

- [X] Modify your testbench to read data for your VHDL module and results from text files.

Before you can run the system simulation, you'll need to generate test files from the **C/C++** code provided in the **Step_4/test_generator** directory. This step is mandatory, as the VHDL file access API expects to find bit vectors.

- [X] Run a simulation to check that it works and validate the benefits of this approach.

:page_with_curl: In your report, compare this approach with the previous one.


## Step 5

To better understand how the module works in simulation and, above all, to estimate its performance, we need to know the number of clock cycles required for each PGDC calculation.

- [X] Add the necessary lines of code to your GCD module to implement this new functionality. 

- [X] At the end of each calculation, the terminal will display the time required to complete it. To do a **printf** in VHDL, you can use the following code:

```
REPORT "mon_unsigned : " & integer'image(to_integer( mon_unsigned ));
```

**Note:** To avoid degrading the performance of the post-synthesis module, please insert the following annotations in the relevant places.

```
-- pragma translate_on
-- pragma translate_off
```


## Step 6

The results provided by the monitor you've just inserted in your module show that it may be necessary to wait up to 65535 clock cycles before any data is calculated... This is far too long :-(

- [X] Suggest a solution that would (easily) reduce this time by at least a factor of 16.

- [X] Using the test benches developed earlier, validate the new implementation of your module.

:page_with_curl: In your report, you will indicate the method you used to achieve your objective. You will also analyze the impact of your VHDL code modifications on the testbench structure.


## Step 7

All the verification steps we have deployed so far have enabled you to validate your component in simulation. However, some faults may not appear in simulation. To make sure your circuit is working properly, we're going to check it on an FPGA board.

To make your life easier, your teacher will provide you with the tools you need to communicate with the Nexys-4 board.

- [X] Add the VHDL files in the Etape_6 directory to your Vivado project.
- [X] Add the constraints file dedicated to the Nexys-4 board.
- [X] Start bitstream generation.
- [X] Once all these steps have been completed, configure the FPGA using the bitstream.

To transmit data to the board, you'll need to compile and run the **C/C++** program in the **c_codes** directory.

- [X] Set up the operation and check that the system is working correctly.

:page_with_curl: Identify the advantages and disadvantages of the approach used to validate the behavior of your module on an FPGA board.


## Step 8

The approach used here to validate the board-based system is, as you might expect, inadequate...

- [X] Suggest an **original** and **personal** approach to solving this problem.

## Step 9

In order to develop a digital system on a board, it is sometimes necessary to analyze what's going on there in **real time**. Up to now, this has been done by plotting the value of internal signals on LEDs, etc. But these approaches are time-consuming and limited!  However, these approaches are time-consuming and limited!

In this final section, we'll look at the real-time analysis of data processed by our PGDC module.

Please refer to the reference document produced by Xilinx ([ug936](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2019_1/ug936-vivado-tutorial-programming-debugging.pdf)). Essential information can be found starting on page 16.

- [X] Use this technique to observe in real time the processing of your data in the PGDC module.

- [X] Conclude on the advantages and disadvantages of this approach.

:page_with_curl: Identify the advantages and disadvantages of this approach.
