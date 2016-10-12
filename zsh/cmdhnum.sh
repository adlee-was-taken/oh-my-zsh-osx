#!/bin/bash
history | tail -1 | awk '{print $1}'
