# TM7
Application to Extend Stay - Thai Immigration
Use the provided scripts to fill in the PDF form with your particulars.

### Files used
+ TM7.pdf - the blank form, 2 pages long.
+ *editps.sh* - shell script to apply the users data to the pdf.
+ *updateall.sh* - shell script to personalise the information applied by *editps.sh*.

### Files created
+ __tm7front.pdf__ - the front page of the pdf filled in.
+ __tm7back.pdf__ - back page filled in.
+ __tm7filled.pdf__ - the filled in completed pdf. This ability to assemble the back and front pages is inhibited presently. The line at 284 in *editps.sh* _# pdftk tm7front.pdf tm7back.pdf cat output tm7filled.pdf_ needs to have the comment character __#__ removed for this to happen.
