+================================================
+
+ Vectric machine output configuration file
+ for FabTotum 
+ Modified by Ohad Meyuhas (Original file https://gist.github.com/paulkaplan/8359802 by paulkaplan)
+================================================
+
+ History                                        
+                                                  
+ Who      When       What                         
+ ======== ========== ===========================
+ Paul K.  10/01/2013 Written                      
+ Ohad Meyuhas 05/06/2015 Modified for FabTotum Machine
+================================================


POST_NAME = "FabTotom (mm) (*.nc)"
 
FILE_EXTENSION = "nc"
 
UNITS = "MM"
 
+------------------------------------------------
+ Line terminating characters
+------------------------------------------------
 
LINE_ENDING = "[13][10]"
 
+------------------------------------------------
+ Block numbering
+------------------------------------------------
 
LINE_NUMBER_START = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999
 
+================================================
+
+ Formating for variables
+
+================================================
 
VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.4]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]
 
+================================================
+
+ Block definitions for toolpath output
+
+================================================
 
+---------------------------------------------------
+ Commands output at the start of the file
+---------------------------------------------------
 
begin HEADER

+ set starting speed
"M3 S10000" 
+ wait 3 seconds to worm the brushless motor.
"G4 S3" 
+ Set Units to MM
"G21"
+ Set Home
"G0 [ZH]"
"G0 [XH] [YH] [S] M3"
 
 
+---------------------------------------------------
+ Commands output for rapid moves
+---------------------------------------------------
 
begin RAPID_MOVE
 
"G0 [X] [Y] [Z]"
 
 
+---------------------------------------------------
+ Commands output for the first feed rate move
+---------------------------------------------------
 
begin FIRST_FEED_MOVE
 
"G1 [X] [Y] [Z] [F]"
 
 
+---------------------------------------------------
+ Commands output for feed rate moves
+---------------------------------------------------
 
begin FEED_MOVE
 
"G1 [X] [Y] [Z]"
 
 
+---------------------------------------------------
+ Commands output for the first clockwise arc move
+---------------------------------------------------
 
begin FIRST_CW_ARC_MOVE
 
"G2 [X] [Y] [I] [J] [F]"
 
 
+---------------------------------------------------
+ Commands output for clockwise arc move
+---------------------------------------------------
 
begin CW_ARC_MOVE
 
"G2 [X] [Y] [I] [J]"
 
 
+---------------------------------------------------
+ Commands output for the first counterclockwise arc move
+---------------------------------------------------
 
begin FIRST_CCW_ARC_MOVE
 
"G3 [X] [Y] [I] [J] [F]"
 
 
+---------------------------------------------------
+ Commands output for counterclockwise arc move
+---------------------------------------------------
 
begin CCW_ARC_MOVE
 
"G3 [X] [Y] [I] [J]"
 
 
+---------------------------------------------------
+ Commands output at the end of the file
+---------------------------------------------------
 
begin FOOTER

+ Rapid Position to Home
"G0 [ZH]"
"G0 [XH] [YH]"

+ Wait five seconds before stopping the mill
"G4 S5"

+ Stop spindel
"M5" 



+---------------------------------------------------
+ License and copy rights 
+---------------------------------------------------
+
+This is free and unencumbered software released into the public domain.
+
+Anyone is free to copy, modify, publish, use, compile, sell, or
+distribute this software, either in source code form or as a compiled
+binary, for any purpose, commercial or non-commercial, and by any
+means.
+
+In jurisdictions that recognize copyright laws, the author or authors
+of this software dedicate any and all copyright interest in the
+software to the public domain. We make this dedication for the benefit
+of the public at large and to the detriment of our heirs and
+successors. We intend this dedication to be an overt act of
+relinquishment in perpetuity of all present and future rights to this
+software under copyright law.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+For more information, please refer to <http://unlicense.org>