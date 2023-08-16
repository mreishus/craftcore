#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'
RESET='\e[0m'

if [ ! -d "./wordpress-develop" ]; then
  echo -e "${RED}Error${RESET}: wordpress-develop directory does not exist. Please clone it from the official GitHub repository."
  echo "git clone https://github.com/WordPress/wordpress-develop.git"
  exit 1
fi

if ! command -v nvm &> /dev/null; then
  if [[ "$SHELL" != "/bin/bash" ]]; then
      echo -e "${ORANGE}Warning${RESET}: nvm is not detected in the bash environment. "
      echo ""
      echo "... but you are using $SHELL so it could be installed there. This script may not detect all tools correctly if they're installed in other shells."
      echo ""
  else
      echo -e "${ORANGE}Warning${RESET}: nvm is not installed."
  fi
fi

if ! command -v wp-env &> /dev/null; then
  echo -e "${RED}Error${RESET}: wp-env is not installed globally."
  echo ""
  echo "If you're using nvm or a similar version manager, ensure the correct Node version is activated ('nvm use')."
  echo "Then install wp-env using 'npm install -g @wordpress/env'."
  echo ""
  exit 1
fi

echo -e "${GREEN}All checks passed!${RESET}"
echo ""
