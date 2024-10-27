---
title: 'PMOD OLED Driver/Controller'
...

This demo is partially based on the Digilent reference design.
 

# About the OLED

The OLED display provides 128 columns and 32 rows of black/white display pixels. 
The display itself is governed by a control chip located on the PMOD circuit 
board. The control chip responds to commands sent via a **4-wire SPI** interface.
Since the control chip is designed to support a large variety of displays and 
applications, the commands and options are somewhat complicated. This OLED driver
module is intended to simplify using the OLED in digital design projects.

## Driver Functions

For basic project use, the driver supports three functions:

* Bitmap display (activated by the `showbmp` input signal) -- a user-drawn bitmap can be pre-loaded into a RAM and 
  uploaded to the OLED. There are four bitmap memories (these can easily be 
  increased to provide more user bitmaps). The user needs to specify which of the four bitmaps to display
  using the two-bit `bmp` input.
* Character display (activated by the `showchar` input signal) -- a single character is printed on the display as
  an 8x8 glyph positioned in a 16x4 text grid. The user needs to specify a `char_row` between 0 and 3, a `char_col`
  between 0 and 15, and a `charval` between 33 and 126 (see the ASCII character table for appropriate codes).
  Usually a quoted character in source code ("A") is correctly translated to the ASCII value (65). Only capital 
  letters are supported.
* Clear display (activated by the `clear` input signal) -- clears the display.

The three commands are accessed using their corresponding input signals. Only one signal can be 
used at a time, and should only be initiated when `ready` is high. Each signal should obey the 
same handshake sequence, like this:

```
ready && !showchar --> ready && showchar --> !ready && showchar --> !ready && !showchar
```

## OLED Demo Design

A demonstration design is provided showing how the OLED driver can be compiled within your project.
The OLED files are provided in an `ip/` subdirectory. The `oled_demo` uses the switches to provide
`bmp`, `char_row`, `char_col` and `charval` inputs:

```
Switches 15 down to 0:

sw15 sw14 sw13 sw12 sw11 sw10 sw9  sw8  sw7  sw6  sw5  sw4  sw3  sw2  sw1  sw0
---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
bmp1 bmp0 col3 col2 col1 col0 row1 row0 val7 val6 val5 val4 val3 val2 val1 val0
````

The buttons are mapped as follows:

* `btnU` = `showchar`
* `btnL` = `showbmp`
* `btnR` = `clear`
* `btnC` = `rst`

`LED0` shows the `ready` output.


# Driver Design Internals

## 4-Wire SPI Interface

The controller chip responds to **four** SPI signals:

* Chip Select (CS), active low.
* Serial Data Out (SDO).
* Serial Clock (SCLK).
* Data/Command (DC), '0' for command, '1' for data.

When the DC signal is '1', the controller chip transfers data directly 
from SDO into its internal display RAM. When the DC signal is '0', 
the chip transfers SDO data into its command register(s) and then 
carries out the indicated command. Normally the chip's RAM contents are
displayed on the OLED.

## Additional Output Signals

The OLED module expects some additional signals:

* VDD (active low): controls the power supply for the module and chip.
* VBAT (active low): controls a boosted voltage supply for the OLED screen.
* RES (active low): logic reset signal for the controller chip.

These signals need to be connected through the top module of your project, 
but their behavior is fully controlled by this driver module.


# Design Overview

The OLED commands can be spread over multiple bytes. Sometimes these bytes
can include parameters or optional values. For example, there is a two-byte
"contrast" command where the first byte is the command code `8'h81` and the 
second byte indicates the desired contrast level, anything between `8'h00`
and `8'hFF`. 

In order to manage all the different commands and parameters, the OLED driver
contains a **Command Interpreter** module that acts like a simple microprocessor.

![Schematic of OLED driver system.](figures/driver_architecture.svg)

## Programming the Driver

The OLED driver can be programmed by placing instructions in the `pram` 
memory. Addresses 0 through 28 are reserved for the powerup initialization
sequence. You can add additional programs at higher addresses. For example, 
the code below will display data from "Bitmap A":

```Verilog
      // load bitmap A
      ld_data_a_ptr=8'd33;      
      pram[33] = DISP_HORIZ_MODE;      
      pram[34] = SETCOLADR;
      pram[35] = SETPAGEADR;
      pram[36] = LD_DATA_A;      
      pram[37] = NULL_CMD;
```

A couple of important items:

* A **pointer register** named `ld_data_a_ptr` is used to keep track of the start 
  address for this program.
* Commands at 33,34, and 35 are used to re-initialization the PMOD's ram address pointer.
* The program is terminated by a `NULL_CMD` (code 00).

## "Running" a Program

To execute a user program stored in the `pram` memory, use this procedure:

* Set `i_adr` to the start address of the program.
* Set the interrupt signal `intr` to 1 for one clock cycle, then back to 0.

For example, suppose we have a debounced button named `btnA`, and want to run 
the "Bitmap A" command when `btnA` is pressed. This is achieved by the example
lines shown below.

```Verilog
   if (btnA && !intr) begin
      i_adr <= ld_data_a_ptr;  // Get address from the pointer register
      intr  <= 1;
   end   
   else
      intr <= 0;
```

## Customizing the Bitmaps

Four example bitmap images are provided in the `bitmaps/` subdirectory.
You will see two different file types, `.txt` and `.mem`. The drawings
are the `.txt` files. The "canvas" for these drawings is a 128x32 grid
of blank spaces, overwritten with an asterisk `*` at each active pixel.
The provided examples are:

* `usu.txt`: USU with an illustration that suggests Old Main with mountains.
* `utah.txt`: A rendering of the new Utah state flag.
* `3700.txt`: ECE 3700 banner with a logic circuit drawing.
* `alphabet.txt`: A simple font made of 8x8 letters.

To convert the drawings to a proper memory pattern, a C program named 
`bitmap2mem.c` is provided. This program is compiled using the `make`
command, which expects the GNU `gcc` compiler (any other C compiler will probably 
work, but you'll need to edit the `Makefile` or compile your own way).

Usage example:

```
bitmap2mem 3700.txt > 3700.mem
```

After you generate the `mem` file, it can be loaded into one of the 
`interpreter` registers by editing these lines in `interpreter.sv`:

```Verilog
      $readmemb("bitmaps/usu.mem",data_a);
      $readmemb("bitmaps/3700.mem",data_b);
      $readmemb("bitmaps/utah.mem",data_c);
      $readmemb("bitmaps/alphabet.mem",data_d);      
```

Here we see that `usu.mem` is loaded as Bitmap A, `3700.mem` is loaded as Bitmap B, and so on. 
You can replace these files with your own.


## Command Tables

The OLED driver provides access to a subset of the chip's control commands.
They are listed in the table below. Each of these commands uses the same 
byte code as the PMOD's controller chip.

| `localparam` name | hex code | description |
| DISP_ALL_ON   | A5 | turn all pixels on |
| DISP_RAM      | A4 | display the RAM contents |
| DISP_ON       | AF | enable the display |
| DISP_OFF      | AE | disable the display |
| DISP_CONTRAST | 81 | set the contrast (i.e. brightness)   |

In addition to the controller chip commands, the interpreter 
recognizes some other useful commands designed for project 
applications. The byte codes for these commands do not 
correspond to any codes in the controller chip.

| `localparam` name | hex code | description |
| LD_DATA_A     | 36 | Copy data from bitmap A to OLED RAM | 
| LD_DATA_B     | 37 | Copy data from bitmap B to OLED RAM | 
| LD_DATA_C     | 38 | Copy data from bitmap C to OLED RAM | 
| LD_DATA_D     | 39 | Copy data from bitmap D to OLED RAM | 
| CLR_SCREEN    | 3A | Clear the OLED RAM (set all zero)   |
| FILL_SCREEN   | 3B | Fill the OLED RAM (set all one)     |
| DELAY_LONG    | 0F | Delay for 10us                      |
| DELAY_SHORT   | 0E | Delay for 4us                       |


Some additional controller commands are used during the 
powerup initialization sequence. These commands are not 
needed for application use, but are documented in the table
below.

| `localparam` name | hex code | description |
| DISP_HORIZ_MODE | 20 | set horizontal address mode |
| CHARGEPUMP_EN   | 8D | enable the screen's voltage converter |
| MUXRATIO        | A8 | set an internal multiplexer parameter |
| DISP_OFFSET     | D3 | 
| STARTLINE       | 40 |
| SEGMENT         | A0 |
| SCANDIR         | C0 |
| COMPINS         | DA |
| DISP_NORMAL     | A6 |
| SETOSC          | D5 |
| SETCOLADR       | 21 |
| SETPAGEADR      | 22 |
| VDD_ON  | 30 | Set the `vdd` signal HIGH  | 
| VDD_OFF | 31 | Set the `vdd` signal LOW   |
| VBAT_ON | 32 | Set the `vbat` signal HIGH |
| VBAT_OFF| 33 | Set the `vbat` signal LOW  |
| RES_ON  | 34 | Set the `res` signal HIGH  |
| RES_OFF | 35 | Set the `res` signal LOW   |

