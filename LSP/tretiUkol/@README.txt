*********************************
The project contains 2 solutions.
--------------------------------------
For VGA output, set DemoMux.bdf as Top-level entity.
For LCD output available only on DE2-115 board, set DemoMux_LCD.bdf as Top-level entity.
------------------------------------------------------------------------------------
In the both case, your main task consists of editing:
 
1/ DisplayLogic2.vhd - the flag/label adjusted to 640x480 px size
2/ VideoMuxCalculate.vhd - the calculation of switching between 1st and 2nd image
3/ Alternatively, you can also extend VideoMuxSwitch.vhd operations

You can take other files in the project as library functions. 
In language C, you do not also write everything, but you call many predefined 
utilities from standard libraries, e.g. printf(), getc(), and so on.
In circuit designs, we have also employ predefined blocks.

************************************************************************************
List of files:

* @README.txt - this file
* DemoMux.bdf - Top-level entity for VGA output 
* DisplayLogic2Mux.vhd - the pipeline calculation for VGA inside DemoMux.bdf
* DemoMux_OverviewInBDF.bdf 
  - the tutorial explanation of DemoMux.bdf and DisplayLogic2Mux.vhd structures

* DemoMux_LCD.bdf - Top-level entity for LCD output on DE2-115 board 
* DisplayLogic2Mux_LCD.vhd - the pipeline calculation for LCD inside DemoMux.bdf
* DemoMux_LCD_OverviewInBDF.bdf 
- the tutorial explanation of DemoMux_LCD.bdf and DisplayLogic2Mux_LCD.vhd structures

* VideoMuxCalculate.vhd - the calculation of switching between 1st and 2nd image
   performed in the first step of pipeline.
* DisplayLogic2.vhd - the flag/label calculated in 1st step of the pipeline. 
   It must be adjusted for 640x480 px.	
	If you create LCD, you can adjust its size to 800x600 px, the full LCD.
	Add to it possibility of horizontal flip. All flags were designed by the ways that are not symetrical.
   The recommended adjustement is also changing colors for the flipped flag. 
	
* romPicture2.qip - memory of LSP flag, you must replace it by your own memory for picture in your flag.
	
* VideoMuxSwitch.vhd - the switching performed in 2nd step of the pipeline.
   The switch can be extended, if you need more complex operation, e.g., fading pictures.

* VGARegPipeline.vhd - register between 1st and 2n step of the pipeline for VGA output
* LCDRegPipeline.vhd - register between 1st and 2n step of the pipeline for LCD output

* VGARegDE2.vhd - terminal register for VGA driver on DE2 board
* VGARegDE2_115.vhd - terminal register for VGA driver on DE2_115 board
* LCDRegDE2_115.vhd - terminal register for LCD driver on DE2_115 board

* VGAgenerator.vhd - the generator of VGA synchronization
* LCDgenerator.vhd - the generator of LCD synchronization
* LCD_altpll.qip - Phase Locked-Loop generating 39.795918 MHz LCD_CLK from CLOCK_50

* VGApackage.vhd is utilized in the both LCD and VGA solutions.
       It introduced constants, types, and useful functions.
		 
* LCDpackage.vhd -- it contains information only about screen sizes.
		 
* MUXpackage.vhd - it contains the definition of type muxaddress_t and its values.
                   You can extend MuxAddress bit width here.
						 
==== Definitions for TimeQuest Timing Analyzer ===========================
* VGAtiming.sdc - the file is required for LCD and VGA. 
* lcd_display.sdc - description of phase locked-loop timing in LCDgenerator.vhd. 
                  The file is required for LCD solution only. 
						 
 