import subprocess
import os

for file in os.listdir("."):
    subprocess.call("./sleep.sh ", shell=True)
