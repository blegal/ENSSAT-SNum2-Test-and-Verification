# Digital test and verification practical work

## Introduction

The entire teaching sequence is described in the MarkDown files in directories 1, 2 and 3. The first directory describes a sequence dedicated to software code verification, while the others focus on hardware verification.

Enjoy your reading...


## Cloning the repository with a GUI

For those of you running Windows or MacOS, the easiest way to download files is to install the **GitHub Desktop** tool developed by **GitHub**.

```
https://desktop.github.com
```

Once the tool has been installed, launch it and choose **clone repository** and enter the following address:

```
https://github.com/blegal/ENSSAT-SNum2-Test-and-Verification
```

![alt text](./icons/warning.png) Avoid using accents and spaces in the path of the directory you're going to clone into. This will save you a lot of problems later on!


## Cloning the repository using CLI

Pour ceux qui sont sous Linux ou ceux qui adorent les terminaux, le plus simple est d'ouvrir un terminal. Une fois dans le repertoire ou vous souhaitez créer le projet, tapez la commande suivante:

```
git clone https://github.com/blegal/EN224-Test-et-verification.git
```

## VHDL editing and simulation under MacOS (Linux)

For those unlucky enough to buy a MAC when they need to write VHDL, there is a solution for analyzing and simulating VHDL code.

MacOS users will need brew (https://brew.sh). To install **ghdl**, use the following commands:

```
brew install ghdl
```

Under Linux, using the package manager will fulfill the same role:

```
sudo apt install ghdl gtkwave
```

To analyze VHDL code, use the **ghdl -a** command:

```
ghdl -a ./src/PGCD.vhd
ghdl -a ./src/PGCD_tb.vhd
```

To generate an executable file to simulate your modules & launch the testbench simulation, use **ghdl -r**:

```
ghdl -r PGCD_tb --vcd=signaux.vcd --stop-time=1000ns
```

In order to observe the signals stored in the **signals.vcd** file, you'll need to use an external tool. MAC owners will probably prefer ScanSion (http://www.logicpoet.com/scansion/), while Linux users will use gtkwave (http://gtkwave.sourceforge.net/).