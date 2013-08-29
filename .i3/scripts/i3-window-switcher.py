#!/usr/bin/python
import i3
import argparse
from pprint import pprint
from sys import exit

# Requirements: https://github.com/ziberna/i3-py

def get_current_workspace():
  current = [ws for ws in i3.get_workspaces() if ws['focused']][0]
  return current

def valid_window(node):
  if node['id']:
    if node['window'] == None:
      return False
  return True

# Recursively get all window ids
def get_window_ids(nodes, window_ids = []):

  for node in nodes:
    if node['nodes']:
      get_window_ids(node['nodes'], window_ids)

    if valid_window(node):
      window_ids.append(node['id'])
      
  return window_ids

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

  windows    = i3.filter(num=current['num'])[0]
  window_ids = get_window_ids(windows['nodes'])

  if selected > len(window_ids):
    exit('Index out of range')
  
  if window_ids[selected]:
    i3.focus(con_id=window_ids[selected])
