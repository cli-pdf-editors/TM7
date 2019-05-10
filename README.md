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
+ __tm7filled.pdf__ - the filled in completed pdf. This ability to assemble the back and front pages is inhibited presently. The line at 284 in *editps.sh* ```# pdftk tm7front.pdf tm7back.pdf cat output tm7filled.pdf``` needs to have the comment character __#__ removed for this to happen.

### Requirements
+ _pdftk_ - in my Ubuntu based system I installed it using _snap_.
+ _ps2pdf_ is part of _ghostscript_ which may exist by default.
+ _pdftops_ included with _poppler-utils_.

### Limitations
While _ghostscript_ has been able to UTF-8 languages for some time, the conversion from __postscript__ back to PDF can not. So, address data will need to be transliterated and entered as ASCII characters. Eg สันปูเลย will need to be entered as San Pu Loei.
