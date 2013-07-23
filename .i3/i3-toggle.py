#!/usr/bin/python

import i3

"""
  Requirements: https://github.com/ziberna/i3-py
"""
workspaces = i3.get_workspaces()

for workspace in workspaces:
  if (workspace['focused'] == True):
    if (workspace['num'] == 3):
      i3.workspace1()
    else:
      i3.workspace3()
