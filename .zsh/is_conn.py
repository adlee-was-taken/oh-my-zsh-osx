#!/usr/bin/env python
# -*- coding: utf-8 -*-
import socket
REMOTE_SERVER = "www.google.com"
def is_connected():
  class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m' 
  try:
    # see if we can resolve the host name -- tells us if there is
    # a DNS listening
    host = socket.gethostbyname(REMOTE_SERVER)
    # connect to the host -- tells us if the host is actually
    # reachable
    s = socket.create_connection((host, 80), 2)
    return bcolors.OKGREEN + "√" + bcolors.ENDC 
  except:
     pass
  return bcolors.FAIL + "X" + bcolors.ENDC
print is_connected()
