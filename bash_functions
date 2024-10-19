#!/usr/bin/env bash

# Function to print a blank line
print_blank_line() {
  echo
}

# Function to print a message in green color (informational)
print_info_message() {
  echo -e "\033[0;32m$1\033[0m"
}

# Function to print a warning message in yellow color
print_warning_message() {
  echo -e "\033[1;33mWarning: $1\033[0m"
}

# Function to print a heading with decoration
print_heading() {
  print_blank_line
  print_info_message '------------------'
  print_info_message "==> $1"
  print_info_message '------------------'
}
