#!/usr/bin/python
import i3
import argparse
from pprint import pprint
from sys import exit

# Requirements: https://github.com/ziberna/i3-py

def get_current_workspace():
  current = [ws for ws in i3.get_workspaces() if ws['focused']][0]

  if not current:
    return None
  return current

if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('-n')

  args = parser.parse_args()

  if not args.n:
    exit('No window number given')

  selected = int(args.n)
  current = get_current_workspace()

  if not current:
    exit('Failed to get current workspace')

  windows = i3.filter(num=current['num'])[0]

  if selected > len(windows['nodes']):
    exit('Index out of range')
  
  if windows['nodes'][selected]:
    i3.focus(con_id=windows['nodes'][selected]['id'])
