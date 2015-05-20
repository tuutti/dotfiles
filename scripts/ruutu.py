#!/usr/bin/python
import urllib.request
import sys
import re
from urllib.parse import urlparse
import xml.etree.ElementTree as ET
import argparse
from subprocess import Popen, PIPE, STDOUT

def load_result(url):
    response = urllib.request.urlopen(url)
    return response.read().decode('utf-8')

def load_xml(url):
    xml_url = get_xml_url(url)

    xml = load_result(xml_url)

    if xml_url is None:
        return False

    return ET.fromstring(xml)

def get_xml_url(url):
    source = load_result(url)

    pattern = r'(http:\/\/gatling\.ruutu\.fi\/media\-xml-cache\?id=([0-9]+))'
    results = re.search(pattern, source)

    if not results.group(1):
        return False

    return results.group(1)

def load_video_url(url):
    xml = load_xml(url)

    urls = []
    for item in xml.getiterator('AndroidMediaFiles'):
        url = item.find('AndroidMediaFile').text

        if url is not None:
            urls.append(url)

    if len(urls) > 1:
        print('Found more than one URL for given url. Defaulted to first one.')
    return get_first(urls)

def get_first(iterable, default=None):
    if iterable:
        for item in iterable:
            return item
    return default

def create_arg_parser():
    parser = argparse.ArgumentParser(description='Add arguments for ruutu.fi parser')
    parser.add_argument('-p', '--player', required=False, default='mpv', type=str, help='Which player (default: mpv)?')
    parser.add_argument('-i', '--input', required=True, type=str, help='Url to ruutu.fi program. For example: http://www.ruutu.fi/ohjelmat/poliisit/kausi-6-jakso-13-vantaa')

    return vars(parser.parse_args());

def main():
    args = create_arg_parser()
    url = load_video_url(args['input'])

    launch_command = [args['player'], url]
    Popen(launch_command, stdout=PIPE, stdin=PIPE, stderr=STDOUT)

if __name__ == '__main__':
    main()
