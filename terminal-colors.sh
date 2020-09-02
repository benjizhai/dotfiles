#!/bin/sh
# Liquid Carbon improved
# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff3030"           # SYNTAX_STRING
export COLOR_03="#68af61"           # COMMAND
export COLOR_04="#cc8700"           # COMMAND_COLOR2
export COLOR_05="#0099cc"           # PATH
export COLOR_06="#c7428d"           # SYNTAX_VAR
export COLOR_07="#5daeb6"           # PROMP
export COLOR_08="#bccccc"           #

export COLOR_09="#1a1a1a"           #
export COLOR_10="#f12d4c"           # COMMAND_ERROR
export COLOR_11="#81b966"           # EXEC
export COLOR_12="#f8ac17"           #
export COLOR_13="#02a5d3"           # FOLDER
export COLOR_14="#d865a6"           #
export COLOR_15="#7ac4cc"           #
export COLOR_16="#e7ebeb"           #

export BACKGROUND_COLOR="#303030"   # Background Color
export FOREGROUND_COLOR="#dedede"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Benji"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
