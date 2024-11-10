if [ ! -f /tmp/.apt_update_done ]; then
    python3 -c "
import os
import subprocess
import time
import signal
import sys

def signal_handler(sig, frame):
    print('\nsaiba: Skipping update check...')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)  # Handle Ctrl+C
signal.signal(signal.SIGTSTP, signal_handler)  # Handle Ctrl+Z

print('--< boron ¹² >--')
print('saiba: welkommen, master gilarb!')
print('saiba: checking update first...')
print('saiba: C-c to skip it...')

subprocess.call(['sudo', 'apt', 'update'])

# Get the list of upgradable packages
try:
    upgrade_output = subprocess.check_output(['apt', 'list', '--upgradable'], text=True)
    upgrade_needed = len(upgrade_output.splitlines()) > 1  # Check if there are upgradable packages
except subprocess.CalledProcessError as e:
    print('saiba: Failed to check for upgradable packages.')
    upgrade_needed = False

if upgrade_needed:
    print('saiba: Upgrading packages...')
    subprocess.call(['sudo', 'apt', 'upgrade', '-y'])
else:
    subprocess.call(['clear'])
    print('saiba: All packages are up to date...')
    time.sleep(0.9)

with open('/tmp/.apt_update_done', 'w') as f:
    f.write(' ')

subprocess.call(['clear'])
print('starting engine...')
time.sleep(0.9)
subprocess.call(['clear'])
"
fi

trap_cleanup() {
    python3 -c "
import os
if os.path.exists('/tmp/.apt_update_done'):
    os.remove('/tmp/.apt_update_done')
"
}
trap trap_cleanup EXIT
