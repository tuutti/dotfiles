#!/usr/bin/python

import sys
import getopt
import alsaaudio
import json
import argparse

def list_mixers(idx=0):
    print('Available mixer controls:')
    for m in alsaaudio.mixers(idx):
        print('%s' % m)
        
def set_mixer(data, args, idx=0):
    try:
        mixer = alsaaudio.Mixer(data['audio']['device'], cardindex=idx)
    except alsaaudio.ALSAAudioError:
        print('No such mixer')
        sys.exit(1)

    channel = alsaaudio.MIXER_CHANNEL_ALL

    if args.m:
      if args.m == 'mute':
        mixer.setmute(1, channel)
      else:
        mixer.setmute(0, channel)
    
    elif args.v:
      # Get current volume
      current_volume = mixer.getvolume()[0]

      if (args.v < 0):
        volume = current_volume - int(args.v) 
      else:
        volume = current_volume + int(args.v) 
     
    # Volume can't be over 100 or less than 0.
    if (volume >= 100 or volume <= 0):
      sys.exit(1)

    mixer.setvolume(volume, channel)

if __name__ == '__main__':


    cardindex = 0
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-v')
    parser.add_argument('-m')
    parser.add_argument('-f')

    if not parser.parse_args():
        list_mixers(cardindex)
    else:
      args = parser.parse_args()

      if not args.f:
        sys.exit(1)
      else:
        path = args.f

      with open(path) as data_file:    
        data = json.load(data_file)
    
      if not data['audio']['device']:
        print("Couldn't find device from config.json")
        sys.exit(1)
      
      set_mixer(data, args, cardindex)

    data_file.close()

