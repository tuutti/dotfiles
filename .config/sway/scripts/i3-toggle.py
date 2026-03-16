#!/usr/bin/python

import i3
from sys import exit
import argparse
import sys
from common.i3common import *

# Requirements: https://github.com/ziberna/i3-py

if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('-first')
  parser.add_argument('-second')

  args = parser.parse_args()

  if not args.first or not args.second:
    exit('Workspace 1 and workspace 2 are required (-first and -second)')

  workspace = get_current_workspace()
  
  if workspace['name'] == args.first:
    i3.workspace(args.second)
  else:
    i3.workspace(args.first)


