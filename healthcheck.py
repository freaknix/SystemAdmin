#!/usr/bin/python3

import shutil
import psutil

du = (shutil.disk_usage("/"))
free = du.free / du.total * 100
print("Free disk space:", free)
usage = psutil.cpu_percent()
print("CPU utilization:", usage)
