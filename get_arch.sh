#!/bin/sh
#
# (c) 2021 Alex Wicks | github.com/aw1cks
#
# This file is part of shell-util: github.com/aw1cks/shell-util
#
# shell-util is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# shell-util is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with shell-util. If not, see <http://www.gnu.org/licenses/>.

set -e

case "$(uname -m)" in
  'arm64|aarch64') ARCH='arm64' ;;
  'x86_64')
    if [ "$(uname)" = "Darwin" ]; then
      # If running terminal under Rosetta, uname -m will report amd64
      # Work around this by checking kernel release name contains 'ARM64'
      case "$(uname -a)" in
        *ARM64*) ARCH='arm64' ;;
        *) ARCH='amd64' ;;
      esac
    else
      ARCH='amd64'
    fi
    ;;
  *)
    ARCH="$(uname -m)"
esac

printf '%s' "${ARCH}"
