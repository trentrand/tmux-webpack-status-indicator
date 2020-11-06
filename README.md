# Tmux Webpack Status Indicator

> Print a badge in your Tmux status bar indicating the current build status for Webpack

By parsing the visible buffer of your webpack process' tmux pane, this
script will print a circular badge colored to indicate whether your build failed,
succeeded or is being built. 

## Setup

Clone this repository into a folder and note the path. This will be used in the
tmux configuration.

Open your tmux configuration file (e.g. `~/.tmux.conf`) and modify or add a new entry
to customize your status line.

To add this indicator to the right-region of your status line, add the
following tmux configuration:

```
set-option -g status-right "#[fg=colour255, bg=colour237] #(/path/to/tmux-webpack-status-indicator/main.sh)"
```

Adjust the specified path to match the directory where this repository is cloned.


To ensure this script runs continually, adjust your status line refresh interval:

```
set -g status-interval 2
```

A more complete example may look like the following:
```
# Refresh status line every x seconds
set -g status-interval 1

# Customize status line
set-option -g status-right "\
#[fg=colour2] \
#[fg=colour255, bg=colour237] #(/path/to/tmux-webpack-status-indicator/main.sh) \
#[fg=colour246, bg=colour237] %b %d %y \
#[fg=colour107] %I:%M %p \
#[bg=colour237] 🌎 \
#[fg=colour248, bg=colour237]"
```
