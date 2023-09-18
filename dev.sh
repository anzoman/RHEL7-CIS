#!/bin/bash

set -eu

run_linters() {
    ansible-lint
    spotter scan --ansible-version 2.12 --display-level warning .
}

run_help() {
    cat <<EOF
usage:
    ./dev.sh <command>

commands:
    lint                runs linters
    help                shows this help
EOF
}

if [ $# -ne 1 ]; then
    echo -e "No arguments were supplied\n"
    run_help
    exit 1
fi

command="$1"
shift

case "$command" in
lint)
    run_linters
    ;;
help)
    run_help
    ;;
*)
    echo -e "Invalid command: $command\n"
    run_help
    ;;
esac
