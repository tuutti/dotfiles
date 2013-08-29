#!/usr/bin/python

import i3

# Requirements: https://github.com/ziberna/i3-py

current = [ws for ws in i3.get_workspaces() if ws['focused']][0]

if current['num'] == 3:
  i3.workspace1()
else:
  i3.workspace3()
