import subprocess

def run_command(command):
    """Run a shell command and print output in real-time."""
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    for line in process.stdout:
        print(line.decode(), end="")  # Decode bytes and print line
    process.wait()

def confirm(prompt):
    """Ask for user confirmation."""
    while True:
        resp = input(f"{prompt} (Y/n): ").strip().lower()
        if resp == 'y' or resp == '':
            return True
        elif resp == 'n':
            return False

# Define package manager
PM = "sudo apt install "

def install_packages(package_list, confirm_en):
    """Install a list of packages using the package manager."""
    for item in package_list:
        # If the package has a description, unpack it; otherwise, just use the name.
        if isinstance(item, tuple):
            pkg, description = item
        else:
            pkg, description = item, None
        
        print()
        # If confirmation is enabled, prompt the user with the description (if available)
        if confirm_en:
            prompt = f"Install {pkg}?" + (f" ({description})" if description else "")
            if not confirm(prompt):
                continue

        print(f"Installing {pkg}...")
        run_command(f"{PM} -y {pkg}")

# Define package lists with optional descriptions
optional = [
    ("wireshark", "Network protocol analyzer"),
    ("sshpass", "Tool for non-interactive SSH password authentication"),
    ("bear", "Build system wrapper for compilation database generation"),
    ("figlet", "Program for making large text out of ASCII characters"),
    ("xclip", "[Linux] Command-line interface to X selections (clipboard app)")
]

mandatory = [
    "zsh", "gdb", "binutils", "curl", "gcc", "valgrind",
    "g++", "make", "python3", "python3-pip", "zip", "unzip",
    "python3-venv", "shellcheck", "software-properties-common",
    "ripgrep", "hping3"
]

# Install mandatory and optional packages
install_packages(mandatory, confirm_en=False)
install_packages(optional, confirm_en=True)
