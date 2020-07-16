#!/bin/bash

DEFAULT="no para, use default"

# when use default value need $, but para no need $

echo ${1:-$DEFAULT}
