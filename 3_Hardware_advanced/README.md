# Code coverage and hardware architectures

The software environment used for this tutorial is ModelSim with the VHDL hardware description language. The aim of this tutorial is to analyze the interest and power of code coverage tools.

**Reminder**: code coverage = non-static analysis (stimuli mandatory)

## Step 1:

In this first step, you'll get to grips with the ModelSim tool. To do this, you'll reuse the files developed for your PGDC module.

- Create a modelsim project.
- Add the VHDL files to the project.
- Compile the files you've just added. 
- Then run the simulation of your module.

**Note**: If you've lost the magic command lines since last year, you'll find them below.

```
export LM_LICENSE_FILE=1700@johnny
export LD_LIBRARY_PATH=/opt/mentor/modelsim_se/10.3d/optlib
alias modelsim='/opt/mentor/modelsim_se/10.3d/modeltech/linux_x86_64/vsim -gui'
```

As you might have guessed, your module that worked with ISim also provided correct results with ModelSim. The point of the exercise lies elsewhere ;-)

- Now compile the VHDL files in coverage mode (code instrumentation) using the following command:

```
vcom -coverAll PGDC.vhd tb_PGDC.vhd
```

**Note**: you can activate the coverage mode by right-clicking on the files in the ModelSim interface and selecting the appropriate checkboxes in the proprieties tab.

- Load and run the simulation using the following commands:

```
vsim -coverage bench_compteur
run -all
```

- Analyze the code coverage information provided in the ModelSim interface.

Different types of code coverage are possible with ModelSim:

- The tool directly informs the source code of the number of executions of each instruction (place the mouse over the instruction).

- The "missed coverage" window provides specific information on structures (statements, branches, etc.) that have not been executed. (click on the line displayed in missed coverage for details on the non-execution of the structure in question).

- The "instance coverage" window shows the different coverage rates.

- You can also view details of signal toggles (toggle coverage). To do this, open an objects window (view>objects), then check (tools>toggle coverage>add>signals in design). Please note that this must be done before compiling and running the simulation.

## Step 2

Let's stop playing with pedagogical examples... During your semesters at school you've developed a lot of VHDL! Now it's time to analyze the quality of your test procedures.

- Take one or two projects you've developed and apply an analysis to your test procedures.

- Try to maximize the coverage rate of the testbench you wrote before taking this course.

## Step 3

We have just studied the application of code coverage analysis to projects described in VHDL. However, code coverage tools are also used in the software world.

- Try to apply these tools to the **C** code developed in the first session. To do this, refer to the following tutorials: [[1]](https://en.wikipedia.org/wiki/Gcov), [[2]](https://www.tutorialspoint.com/unix_commands/gcov.htm), [[3]](https://connect.ed-diamond.com/GNU-Linux-Magazine/GLMF-154/Tests-unitaires-avec-Check-Gcov-et-Lcov).

- Do the same for your **C/C++** codes developed earlier in your studies.
