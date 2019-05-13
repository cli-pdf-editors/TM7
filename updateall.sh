#!/bin/bash
#
# updateall.sh - script to edit all data strings in editps.sh
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
get_target() {
  target=$(grep -n "$1" "$fn")
  lineno=$(echo "$target" |cut -d':' -f1)
  prompt=$(echo "$target" |cut -d' ' -f2)
  prompt=$(echo "$prompt" |tr "_" " ")
  datalno=$(expr "$lineno" + 1)
  dataline=$(sed -n "$datalno"p "$fn" |cut -d "(" -f2 | cut -d ")" -f1)
} # get_target()
fn=editps.sh
for i in \#office.tgt \#surname.tgt \#firstname.tgt
do
  get_target "$i"
#  echo target is: "$target"
#  echo lineno is: "$lineno"
#  echo prompt is: "$prompt"
#  echo datalno is: "$datalno"
#  echo dataline is: "$dataline"
  prompt="$prompt"" "
  read -e -p "$prompt" -i "$dataline" textin
  echo textin is: "$textin"
  if [[ "$textin" != "$dataline" ]];
  then
    # Will update the edit script only when the user has made a change.
    sed -i "$datalno s!$dataline!$textin!" "$fn"
  fi
  echo -------------------
done

# Handle the salutation (Mr Mrs Miss).
# Three things to do.
# 1. We don't know what editps.sh will cross out, so make it do all.
# 2. Get user input named what to take the cross (X) off.
# 3. If user input is legal, replace applicable X with ' ', or if it
#    is crap, remove the X off all 3 items.
# no conditional update, just do this.
get_target "mr.tgt"
sed -i "$datalno s!( )!(X)!" "$fn"
get_target "mrs.tgt"
sed -i "$datalno s!( )!(X)!" "$fn"
get_target "miss.tgt"
sed -i "$datalno s!( )!(X)!" "$fn"
# Now get user input.
prompt=Salutation" "
dataline="Mr Mrs Miss"
read -e -p "$prompt" -i "$dataline" textin
echo textin is: "$textin"
if [[ "$textin" == "Mr" ]]; then
  get_target "mr.tgt"
  textin=' '  # want a space to replace the X over 'Mr'
  sed -i "$datalno s!$dataline!$textin!" "$fn"
elif [[ "$textin" == "Mrs" ]]; then
  get_target "mrs.tgt"
  textin=' '  # want a space to replace the X over 'Mrs'
  sed -i "$datalno s!$dataline!$textin!" "$fn"
elif [[ "$textin" == "Miss" ]]; then
  get_target "miss.tgt"
  textin=' '  # want a space to replace the X over 'Miss'
  sed -i "$datalno s!$dataline!$textin!" "$fn"
else  # crap has been entered, so remove any/all X that exist.
  get_target "mr.tgt"
  textin=' '  # replace X with ' '
  sed -i "$datalno s!$dataline!$textin!" "$fn"
  get_target "mrs.tgt"
  textin=' '  # replace X with ' '
  sed -i "$datalno s!$dataline!$textin!" "$fn"
  get_target "miss.tgt"
  textin=' '  # replace X with ' '
  sed -i "$datalno s!$dataline!$textin!" "$fn"
fi
for i in \
\#middlename.tgt \#age.tgt \#birthdayDay.tgt \#birthmonthname.tgt \
\#birthyear.tgt \#whereborn.tgt \#nationality.tgt \#passportNumber.tgt \
\#ppIssueDate.tgt \#ppIssueMonth.tgt \#ppIssueYear.tgt \
\#ppIssueCountryCode.tgt \#ppExpiresDayNo.tgt \#ppExpiresMonName.tgt \
\#ppExpiresYearNo.tgt \#visatype.tgt \#extendDays.tgt \
\#extensionReason.tgt \#apdateDay.tgt \#apdateMonth.tgt \
\#apdateYear.tgt \#arrByType.tgt \#arrFrom.tgt \#arrPort.tgt \
\#arrDateDayNo.tgt \#arrDateMonName.tgt \#arrDateYearNo.tgt \
\#tm6Number.tgt \#fullName.tgt \#addNo.tgt \#addStreet.tgt \
\#addTambol.tgt \#addAmphoe.tgt \#addChangwat.tgt \#phone.tgt \
\#email.tgt
do
  get_target "$i"
#  echo target is: "$target"
#  echo lineno is: "$lineno"
#  echo prompt is: "$prompt"
#  echo datalno is: "$datalno"
#  echo dataline is: "$dataline"
  prompt="$prompt"" "
  read -e -p "$prompt" -i "$dataline" textin
  echo textin is: "$textin"
  if [[ "$textin" != "$dataline" ]];
  then
    # Will update the edit script only when the user has made a change.
    sed -i "$datalno s!$dataline!$textin!" "$fn"
  fi
  echo -------------------
done
