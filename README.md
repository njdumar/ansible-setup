# Purpose
Arch or Debian based Linux distros only.

Use ansible to install a collection of packages, configurations, and link dotfiles (if ~/dotfiles exists) on a local system.

Note: These ansible playbooks are meant to be run locally. This isn't setup to be on an ansible controller.

# Installation:
If you have a repo containing saved dotfiles and .configs/, clone that repo to ~/dotfiles first.

To install dependencies and run all the ansible playbooks:
```
./run.sh
```

# Post Installation
Updates to config files needed:
  - Ubuntu:
    - Install latest nodejs from binary: https://github.com/nodesource/distributions
  - All:
    - Nvidia drivers: https://wiki.archlinux.org/title/NVIDIA
    - Configure monitors via arandr and save to ~/.screenlayout/defaul.sh
    - Monitors may have different names then what is in .config/i3/config Update it
    - Prevent displays from turning off: xset s off -dpms
    - Use this to get all system info: inxi -Fzxx

# Terminal color test:
To check if your terminal and/or tmux session supports 256 colors:
```
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```
The resulting output should have a smooth color gradient
