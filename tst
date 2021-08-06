#! /usr/bin/python3

import re

with open("King_James_Bible.txt","r") as fd:
    out = [""]
    for line in fd:
        if line == "\n" and len(out[-1]) > 100:
            if len(out[-1]) > 0:
                out.append("")
        else:
            out[-1] = out[-1] + " " + re.sub("[^\.a-zA-Z' ]", "", line.strip())

    for i in range(0,10):
        print(i,out[i])
