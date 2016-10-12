import os
import time

rawPingFile = os.popen('ping -c 1 google.com')
rawPingData = rawPingFile.readlines()
rawPingFile.close()
# Extract the ping time
if len(rawPingData) < 2:
    # Failed to find a DNS resolution or route
    failed = True
    latency = 0
else:
    index = rawPingData[1].find('time=')
    if index == -1:
        # Ping failed or timed-out
        failed = True
        latency = 0
    else:
        # We have a ping time, isolate it and convert to a number
        failed = False
        latency = rawPingData[1][index + 5:]
        latency = latency[:latency.find(' ')]
        latency = float(latency)
print "%.1f" % latency
