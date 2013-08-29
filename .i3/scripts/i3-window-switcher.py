#!/usr/bin/python
import i3
import argparse
from pprint import pprint
from sys import exit
import os
import cPickle as pickle

# Requirements: https://github.com/ziberna/i3-py
def set_last_window(pickle_file, window):
  with open(pickle_file, 'w') as handle:
    pickle.dump(window, handle)

def get_last_window(pickle_file):
  if not os.path.exists(pickle_file):
    return None

  with open(pickle_file) as handle:
    result = int(pickle.load(handle))
  
  return result

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
  pickle_file = '/tmp/last_window.pickle'

  parser = argparse.ArgumentParser()
  parser.add_argument('-n')

  args = parser.parse_args()

  if not args.n:
    exit('No window number given')

  selected  = int(args.n)
  workspace = get_current_workspace()

  if not workspace:
    exit('Failed to get current workspace')

  windows    = i3.filter(num=workspace['num'])[0]
  window_ids = get_window_ids(windows['nodes'])
  # Currently focused window
  current    = i3.filter(nodes=[], focused=True)[0]['id']
  last       = get_last_window(pickle_file)

  if selected > len(window_ids):
    exit('Index out of range')
  
  if window_ids[selected]:
    if window_ids[selected] == current:
      i3.focus(con_id=last)
    else:
      i3.focus(con_id=window_ids[selected])

    set_last_window(pickle_file, current)
  
