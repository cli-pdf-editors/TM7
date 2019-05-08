#!/bin/bash
#
# test.sh - script to test the use of sed
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
fn=test.txt
for i in \#surname.tgt \#from.tgt
do
  get_target "$i"
  echo target is: "$target"
  echo lineno is: "$lineno"
  echo prompt is: "$prompt"
  echo datalno is: "$datalno"
  echo dataline is: "$dataline"
  echo -------------------
done
