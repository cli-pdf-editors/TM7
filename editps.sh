#!/bin/bash
#
# editps.sh - script to edit a postscript file.
#
# Copyright 2019 Robert L (Bob) Parker rlp1938@gmail.com
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.# See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.
#

# use pdftk to split my original pdf into 2 files.
pdftk tm7.pdf cat 1 output tm7front.pdf
pdftk tm7.pdf cat 2 output tm7back.pdf
# I will not join up the edited results because I want to print
# double sided in a printer that has no support for that.

# process front page.
pdftops tm7front.pdf tm7front.ps
# set up a font that may do the job
sed -i 's/showpage/\/Times-Roman findfont\nshowpage/' tm7front.ps
# Scale the font
sed -i 's/showpage/12 scalefont\nsetfont\nshowpage/' tm7front.ps
# Write the invariant and rarely changed data.
# TM office location
sed -i 's/showpage/newpath\n425 705 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(Chiang Mai) show\nshowpage/' tm7front.ps
# Name of Applicant
sed -i 's/showpage/newpath\n252 574 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(Parker) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n415 574 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(Robert) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n145 553 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(   X    X) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n110 539 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(Leonard) show\nshowpage/' tm7front.ps
# Age, date of birth.
sed -i 's/showpage/newpath\n290 539 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(80) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n372 539 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(22) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n438 539 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(November) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n520 539 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(1938) show\nshowpage/' tm7front.ps
# Place of birth and Nationality.
sed -i 's/showpage/newpath\n122 504 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(Ivanhoe) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n440 504 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(Australian) show\nshowpage/' tm7front.ps
# Passport particulars.
sed -i 's/showpage/newpath\n300 470 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(PA3967317) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n490 470 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(11) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n110 436 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(April) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n210 436 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(2016) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n290 436 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(AUS) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n490 436 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(11) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n110 402 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(April) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n210 402 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(2021) show\nshowpage/' tm7front.ps
# Extension applied for.
sed -i 's/showpage/newpath\n440 247 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(30) show\nshowpage/' tm7front.ps
sed -i 's/showpage/newpath\n90 195 moveto\nshowpage/' tm7front.ps
sed -i 's/showpage/(To spend more time with friends here.) show\nshowpage/' tm7front.ps


ps2pdf tm7front.ps tm7front.pdf
