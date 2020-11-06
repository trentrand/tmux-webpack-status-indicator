#!/bin/bash
STATUS=""
WEBPACK_WINDOW=`tmux list-windows | grep "webpack"`
if [ -n "$WEBPACK_WINDOW" ]; then
  PANE_OUTPUT=`tmux capture-pane -t :webpack -p  -S- -E-|sed '/^$/d' | tail -2`
  ERROR=`echo $PANE_OUTPUT | grep "Failed to compile."`
  BUILD_COMPLETED=`echo $PANE_OUTPUT | grep "Compiled successfully."`
  COMPILING=`echo $PANE_OUTPUT | grep "Compiling..."`
  if [ -n "$ERROR" ]; then
    STATUS="#[fg=colour1]●"
  elif [ -n "$BUILD_COMPLETED" ]; then
    STATUS="#[fg=colour2]●"
  elif [ -n "$COMPILING" ]; then
    STATUS="#[fg=colour3]●"
  else
    STATUS="#[fg=colour3]●"
  fi
fi

echo $STATUS
