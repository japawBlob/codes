Content:

* DE115.sdc prototype with time specifications
* DE2_115_pin_assignments.csv - import from Quartus with menu by Assignments->Import Assignments

/basic - contains basic library files
/lcd - for LCD display - not required in the tasks this year, but it is suitable as an auxiliary debugging output
/sound - sound beepers - used in the first task

/Template 
    */template_basic.txt  - template for VHDL code
    */LSP - default project intended for copy, Project->Copy Project
    */LSP.zip - packed default project 

/Test_and_demo_projects_4_DE2 - demonstration of libraries created for DE2 board.
    You can use them also for DE2-115, but only after 
        a) changing device and b) adding DE115.sdc, and c) importing pin assignments

/Tools
   */Bitmap2Mif - conversion of bitmaps to memory initialization files
   */VGAtestbench - displaying the result of VGAtestbench
   
