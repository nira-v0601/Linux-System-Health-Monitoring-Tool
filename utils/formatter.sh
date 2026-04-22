#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print section header
print_header() {
  echo -e "${BLUE}==============================${NC}"
  echo -e "${BLUE}$1${NC}"
  echo -e "${BLUE}==============================${NC}"
}

# Print success
print_ok() {
  echo -e "${GREEN}[OK] $1${NC}"
}

# Print warning
print_warning() {
  echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Print alert
print_alert() {
  echo -e "${RED}[ALERT] $1${NC}"
}
