# Verification, assertions & unit tests

## Introduction

The aim of this first practical session is to illustrate the various techniques you have seen in the course and to get you thinking about verification issues during the design phase.

However, in this part of the course, you'll only be applying this knowledge and the associated principles to the field of software development. This tutorial focuses on the development and validation of an elementary algorithmic function. The use of this elementary function has both an advantage and a disadvantage:

- [X] **Advantage**: you'll soon realize that checking something simple isn't all that easy...

- [X] **Disadvantage**: some of the techniques you'll be using will seem complex to implement for such a trivial example. However, your experience should enable you to put this feeling into perspective in relation to the developments you carry out in your own company...

At the end of the practical session, you will be asked to submit a practical report (handwritten) to your supervisor, detailing the code written and the verification techniques used.Relevant comments on these techniques and their benefits will comment on each of the questions addressed. The various source codes developed should be sent by e-mail.

Algorithm for calculating the **greatest common divisor** (named **PGCD** in french) of 2 integers :

```
FONCTION PGCD( A, B )
  TANT QUE A /= B ALORS
    SI A > B ALORS
      A = A – B
    SINON
      B = B – A
    FIN ALORS
  FIN TANT QUE
  RENVOYER A
FIN FONCTION
```

In this pedagogical example, we'll assume that the data to be processed by your algorithm once it has been integrated into the system will initially be limited to the interval **[1, 65535]**. Indeed, for much larger input values, the number of iterations required to converge could be too high.


## Step 1

From the algorithm described above, write a **C/C++** function implementing the calculation of the **PGCD** of two integers. The prototype of the function you need to write is provided below:

```
int PGCD(const int A, const int B);
```

To help you, the **Step_1** directory contains the files required for this task.

- [X] Take the GCD algorithm and write the corresponding **C/C++** function in the **main.c** file.
- [X] Test and validate your code by writing a **main** that executes your function and displays the results in the terminal.
- [X] Execute your **main** program to test a data pair.
- [X] Now, choose about ten pairs of values to test your program.

:page_with_curl: Analyze your ability to write a functional program on the first try, even if the algorithm is trivial.

## Step 2

Now that you've tested your function manually, we'll use a semi-automated approach to extend the number of tests performed.

- [X] Write two functions (RandA and RandB) that randomly generate values for A and B between 0 and 65535.

- [X] Use these 2 functions to test your function with 20 different pairs of values.

- [X] Make sure that the results are correct.

- [X] What happens if you increase the number of values tested to 2000? If nothing strange happens, increase the number of tests to 200,000...

- [X] Correct this little program defect.

:bulb: If you have no idea why (and AFTER THINKING...), ask your teacher to help you...

:page_with_curl: Analyze your ability to write a functional program on the first try, even if the algorithm is trivial.


## Step 3

The number of possible input pairs for your function is equal to (65536 * 65536) = 4294836225. So far, you've only tested 20 values...


- [X] Propose a solution to extend the number of tests performed to 65536 values (i.e. 0.0015% of possible pairs) **without having to manually validate the results**.

- [X] Modify your **C/C++** code accordingly.

- [X] Validate that your implementation of the **GCD** algorithm works on all these random values.

:bulb: If you don't have any ideas about the approach to use, after a few minutes (of reflection), ask your teacher to help you...

:page_with_curl: Analyze the advantages and limitations of the approach used.

## Step 4

Implement the assertion mechanisms seen in the lesson (from page 130). To ensure that the input and output values of your **GCD** function are always consistent.

- [X] **Retake the code we wrote in step 2**.

- [X] Initially, insert only pre-conditions.

- [X] Check that the assertions perform the task assigned to them when your program is executed.

- [X] Next, check that when you compile the program in "final" mode, the assertions disappear.

:page_with_curl: What are the advantages and limitations of using preconditions in a function ?

## Step 5

Now that you've mastered how assertions work in a software program:

- [X] Integrate all possible pre-conditions and post-conditions into your function (without affecting the computational part).

- [X] What's the advantage of including post-conditions in your code?

- [X] What is the limit of post-conditions?

:page_with_curl: Give the advantages and limitations of using post-conditions.


## Step 6

Develop a **main** program to run unit tests on the **PGCD** function you have developed.

- [X] These unit tests will have to cover a set of tests whose number of data items and values is left to your discretion.

- [X] For the sake of clarity, in this question you're going to disconnect the PGDC function from your **main.c** file. Create a file **pgcd.h** and **pgcd.c**.

- [X] Develop this code, modify your **makefile** and validate that the system works correctly.

Thanks to the step you've just completed, you'll be able to easily test your **PGCD** function each time you modify it. This **main** program, which checks that the execution results are still valid, ensures that your **PGCD** function does not regress. This is known as non-regression testing.

In an industrial context, we would add to the list of tests when we discover a bug. Problem values are added as tests (assert). Previously present values are used to check that correcting the bug has not "broken" anything.

:page_with_curl: Describe the advantages and limitations of using unit tests when developing a feature.

## Step 7

The design of test programs such as the one you wrote in step 6 is common in industrial-scale projects. However, frameworks exist to simplify the writing and analysis of results. Here, we're going to use the Catch2 framework (https://github.com/catchorg/Catch2).

With this framework, you don't need to write a main function:

- [X] to express test sequences,

- [X] classify your tests into categories (several application scenarios, etc.),

- [X] count the number of tests passed/failed at runtime,

- [X] etc.

In order to use this framework written in **C++**, we'll need to make a few changes to our project. In the step 7 directory, the **main.c** file must be renamed **main.cpp*. Also, in the **makefile**, the **gcc** invocation has been replaced by **g++**.

- [X] Add your **pgcd.h** and **pgcd.c** files to the **src** directory from step 7.

- [X] Rename the **pgcd.c** file to **pgcd.cpp**.

Now, in the **main.cpp** file, you will describe the test sequences. To do this, refer to the Catch2 framework documentation (https://github.com/catchorg/Catch2/blob/devel/docs/tutorial.md).

- [X] Create 2 *test-cases*:
  - The first *test-case* will test the normal operation of your **PGCD** function.
  - The second will deal with special cases (e.g. the zero value).


- [X] Each *test-case* will be broken down into 3 sections:
  - The first section will focus on use cases where (A > B),
  - The second section will focus on use cases or (A < B),
  - The last section will deal with use cases or (A = B).
  

Once the test sequences have been described:

- [X] Compile the software code using the makefile provided.
- [X] Execute the resulting program and observe the results.
- [X] Modify your tests so that errors appear during execution.

:page_with_curl: Conclude on the advantages and limitations of using a framework for executing unit tests.



## Step 8

So far, you've manually coded the test values after identifying a pair of values and calculating the expected result. This approach is efficient, but time-consuming if you want to test a large number of values.

To simplify the design of test procedures, we use values from reference models whenever possible, for example by using external files.

The values present in external files (reference data) are generally taken from another implementation of the algorithm (golden model). This reference implementation is generally a higher-level software code (Matlab, Python, etc.).

In this case, you will:

- [X] Use *Matlab*, *Excel*, *OpenOffice* or *LibreOffice* to generate 65536 triplets ([**A**], [**B**], [**result**]).

- [X] Store this data in 3 text files. These files will be named [**ref_A.txt**], [**ref_B.txt**] and [**ref_C.txt**].

Once these preparatory steps have been completed:

- [X] **Take over the C code you wrote in step 6**.

Then:

- [X] Write a program (*main*) to read the values of **A** and **B** from the files (**ref_A.txt** and **ref_B.txt**).

- [X] Write the results of the PGDC calculation to another text file (**resu_C.txt**).

- [X] Execute your program to generate your results file.

- [X] Use the **diff** command or the **meld** tool (or **winmerge** for Windows users) to compare the theoretical and practical results (**ref_C.txt** and **resu_C.txt**).

:page_with_curl: Once again, you'll come to a conclusion about the advantages and limitations of this approach...


# Annexes


## Specific cases...

Considering that every integer is a divisor of zero (because 0 × b = 0 whatever b is), for every non-zero integer b, PGCD(0, b) = PGCD(b, 0) = b.

The usual definition cannot be used to define PGCD(0, 0), since there is no greater divisor of 0. By convention, PGCD(0, 0) = 0.


## Another approach

Here's another approach to calculating the value of the **PGCD** between 2 numbers (*N1*, *N2*).

- X] Assign to *N1* the value of *N2* and to *N2* the value of the remainder of the division of *N1* by *N2*;

- X] Repeat until the remainder of the division is zero. 

- X] At this point, *N1* contains the **PGCD**.

**Example**: If *N1* is 14 and *N2* is 32, we successively obtain


| Iter. | N1  | N2            |
| ----- |:---:| -------------:|
|     1 |   14 | 32           |
|     2 |   32 | 14=14 mod 32 |
|     3 |    4 | 2=14 mod 4   |
|     4 |    2 | 2=4 mod 2    |
|     5 |    2 | 0=2 mod 2    |
