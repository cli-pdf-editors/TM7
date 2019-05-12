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
# Going to split the ps file in 2 at location of "showpage"
lines=$(wc -l tm7front.ps)
lines=$(echo "$lines" | cut -d' ' -f1)
split=$(grep -n showpage tm7front.ps)
split=$(echo "$split" | cut -d':' -f1)
let split-=1  # want "showpage" in the bottom chunk.
lower=$(expr $lines - $split)
echo lines "$lines"
echo split "$split"
echo lower "$lower"
head -"$split" tm7front.ps > top
tail -"$lower" tm7front.ps > btm
# sanity check, do the 2 chunks of file make the original file?
#cat btm >> top
#md5sum top tm7front.ps
#yes, all is well.

# Build up the postscript statements in a file called mid
if [[ -f mid ]];then rm mid; fi
touch mid
# set up a font that may do the job
echo /Times-Roman findfont >> mid
# Scale the font
echo 12 scalefont >> mid
echo setfont >> mid

# Under here there will be comments of the form #name.tgt word1_word2...
# these comments are designed to act as targets for other scripts to
# update this script.

# Write the invariant and rarely changed data.
# TM office location
echo newpath >> mid
echo 425 705 moveto >> mid
#office.tgt Immigration_office_name
echo '(Chiang Mai)' show >> mid
# Name of Applicant
echo newpath >> mid
echo 252 574 moveto >> mid
#surname.tgt Surname
echo '(Surname)' show >> mid
echo newpath >> mid
echo 415 573 moveto >> mid
#firstname.tgt Firstname
echo '(Firstname)' show >> mid
#salutation.tgt Mr Mrs Miss
echo newpath >> mid
echo 139 553 moveto >> mid # Mr
echo '(X)' show >> mid
echo newpath >> mid
echo 156 554 moveto >> mid # Mrs
echo '(X)' show >> mid
echo newpath >> mid
echo 175 554 moveto >> mid # Mr
echo '(X)' show >> mid




echo newpath >> mid
echo 110 539 moveto >> mid
#middlename.tgt Middle_name
echo '(Middlename)' show >> mid
# Age, date of birth.
echo newpath >> mid
echo 290 539 moveto >> mid
#age.tgt Present_age
echo '(99)' show >> mid
echo newpath >> mid
echo 372 539 moveto >> mid
#birthdayDay.tgt Day_in_month_when_born
echo '(01)' show >> mid
echo newpath >> mid
echo 438 539 moveto >> mid
#birthmonthname.tgt Name_of_Month_when_born
echo '(January)' show >> mid
echo newpath >> mid
echo 520 539 moveto >> mid
#birthyear.tgt Year_when_born
echo '(1970)' show >> mid
# Place of birth and Nationality.
echo newpath >> mid
echo 122 504 moveto >> mid
#whereborn.tgt Where_born_as_shown_in_passport
echo '(Birthplace)' show >> mid
echo newpath >> mid
echo 440 504 moveto >> mid
#nationality.tgt Nationality_per_passport
echo '(Esperantish)' show >> mid
# Passport particulars.
echo newpath >> mid
echo 300 470 moveto >> mid
#passportNumber.tgt Passport_Number
echo '(ZZ9876543)' show >> mid
echo newpath >> mid
echo 490 470 moveto >> mid
#ppIssueDate.tgt Passport_Issued_Day_No
echo '(31)' show >> mid
echo newpath >> mid
echo 110 436 moveto >> mid
#ppIssueMonth.tgt Passport_Issued_Month_Name
echo '(December)' show >> mid
echo newpath >> mid
echo 210 436 moveto >> mid
#ppIssueYear.tgt Passport_Issued_Year_Number
echo '(2010)' show >> mid
echo newpath >> mid
echo 290 436 moveto >> mid
#ppIssueCountryCode.tgt Passport_Issuing_Country_Code
echo '(AAA)' show >> mid
echo newpath >> mid
echo 490 436 moveto >> mid
#ppExpiresDayNo.tgt Passport_Expires_Day_No
echo '(31)' show >> mid
echo newpath >> mid
echo 110 402 moveto >> mid
#ppExpiresMonName.tgt Passport_Expires_Month_Name
echo '(December)' show >> mid
echo newpath >> mid
echo 210 402 moveto >> mid
#ppExpiresYearNo.tgt Passport_Expires_Year_Number
echo '(2020)' show >> mid
echo newpath >> mid
echo 310 402 moveto >> mid
#visatype.tgt Type_of_Visa
echo '(Tourist)' show >> mid
# Extension applied for.
echo newpath >> mid
echo 440 247 moveto >> mid
#extendDays.tgt Days_of_Extension_requested
echo '(30)' show >> mid
echo newpath >> mid
echo 90 195 moveto >> mid
#extensionReason.tgt Reason_requesting_extension
echo '(To spend more time with friends here.)' show >> mid
# placeholders for data that varies every application.
# Application date.
echo newpath >> mid
echo 335 659 moveto >> mid
#apdateDay.tgt Date_of_Application_Day_No
echo '(31)' show >> mid
echo newpath >> mid
echo 400 659 moveto >> mid
#apdateMonth.tgt Date_of_Application_Month_Name
echo '(December)' show >> mid
echo newpath >> mid
echo 500 659 moveto >> mid
#apdateYear.tgt Date_of_Application_Year_Number
echo '(2019)' show >> mid
# Arrival data.
echo newpath >> mid
echo 170 367 moveto >> mid
#arrByType.tgt Arrived_by_type_of_transportation
echo '(Walked Bus Air Train)' show >> mid
echo newpath >> mid
echo 330 367 moveto >> mid
#arrFrom.tgt Traveled_from
echo '(Tachiliek Kuala Lumpur Melbourne)' show >> mid
echo newpath >> mid
echo 130 333 moveto >> mid
#arrPort.tgt Port_of_Arrival
echo '(Mae Sai Chiang Mai Bangkok)' show >> mid
echo newpath >> mid
echo 333 333 moveto >> mid
#arrDateDayNo.tgt Arrival_Date_Day_No
echo '(31)' show >> mid
echo newpath >> mid
echo 400 333 moveto >> mid
#arrDateMonName.tgt Arrival_Date_Month_Name
echo '(January)' show >> mid
echo newpath >> mid
echo 510 333 moveto >> mid
#arrDateYearNo.tgt Arrival_Date_Year_Number
echo '(2019)' show >> mid
# TM6 number.
echo newpath >> mid
echo 270 300 moveto >> mid
#tm6Number.tgt TM6_Number
echo '(tm6number)' show >> mid
# Assemble postscript file
cat mid >> top
cat btm >> top
mv top tm7front.ps
ps2pdf tm7front.ps tm7front.pdf

# Process the back page.
pdftops tm7back.pdf tm7back.ps
# Going to split the ps file in 2 at location of "showpage"
lines=$(wc -l tm7back.ps)
lines=$(echo "$lines" | cut -d' ' -f1)
split=$(grep -n showpage tm7back.ps)
split=$(echo "$split" | cut -d':' -f1)
let split-=1  # want "showpage" in the bottom chunk.
lower=$(expr $lines - $split)
echo lines "$lines"
echo split "$split"
echo lower "$lower"
head -"$split" tm7back.ps > top
tail -"$lower" tm7back.ps > btm
# Build up the postscript statements in a file called mid
if [[ -f mid ]];then rm mid; fi
touch mid
# set up a font that may do the job
echo /Times-Roman findfont >> mid
# Scale the font
echo 12 scalefont >> mid
echo setfont >> mid
# Write the invariant and rarely changed data.
# Full name declaration.
echo newpath >> mid
echo 225 716 moveto >> mid
#fullName.tgt Written_By_Full_Name
echo '(First Middle Surname)' show >> mid
# Address - Moo Baan
echo newpath >> mid
echo 130 678 moveto >> mid
#addNo.tgt Adress_Number_Moo_Baan
echo '(xx/yy Moo z)' show >> mid
# Road name, not applicable my address.
echo newpath >> mid
echo 250 678 moveto >> mid
#addStreet.tgt Road_Name
echo '(Road Name or -)' show >> mid
# Tambol
echo newpath >> mid
echo 400 678 moveto >> mid
#addTambol.tgt Tambol_or_Sub_district
echo '(Tambol)' show >> mid
# District
echo newpath >> mid
echo 130 640 moveto >> mid
#addAmphoe.tgt Amphoe_or_District
echo '(District)' show >> mid
# Province
echo newpath >> mid
echo 350 640 moveto >> mid
#addChangwat.tgt Changwat_or_Province
echo '(Province)' show >> mid
# Additional requirements (Chiang Mai only?)
# phone
echo newpath >> mid
echo 288 324 moveto >> mid
echo '(Telephone:)' show >> mid
echo newpath >> mid
echo 350 324 moveto >> mid
#phone.tgt Phone_Number
echo '(08 xxxx yyyy)' show >> mid
# email
echo newpath >> mid
echo 312 300 moveto >> mid
echo '(Email:)' show >> mid
echo newpath >> mid
echo 350 300 moveto >> mid
#email.tgt Email_Address
echo '(youremail@provider.com)' show >> mid
# There is no per application data for this page.
# Assemble postscript file
cat mid >> top
cat btm >> top
mv top tm7back.ps
ps2pdf tm7back.ps tm7back.pdf

# I don't have a 2 side printer capability so I fudge it by hand.
# If you have double sided printing ability uncomment the next line.
# pdftk tm7front.pdf tm7back.pdf cat output tm7filled.pdf

#rm *.ps
