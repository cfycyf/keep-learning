#!/usr/bin/env python3

import os, sys
import argparse
from scapy.all import *


def main():
    if not os.geteuid() == 0:
        sys.exit('Script must be run as root')

    parser = argparse.ArgumentParser()
    parser.add_argument('-i', dest='iface', action='store', type=str, help='interface for DHCP', required=True)
    args=parser.parse_args()


if __name__ == '__main__':
    main()
