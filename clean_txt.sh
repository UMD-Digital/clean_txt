# #!/bin/bash

# Flags:
# ----------------------------------
# -i    (required) Path to the input file.
# -o    (required) Path to the output file.

# Colors:
# ----------------------------------
c_red=$'\e[1;31m'
c_grn=$'\e[1;32m'
c_blu=$'\e[1;34m'
c_mag=$'\e[1;35m'
c_cyn=$'\e[1;36m'
c_wht=$'\e[0m'

function USAGE() {
  echo "USAGE: cmd [-i /path/to/input-file.txt] [-o /path/to/output-file.txt]
DESCRIPTION: Take an existing txt file and verify it has no special characters" 1>&2
}

while getopts ":i:o:h" opt; do
  case ${opt} in
    i )
      INPUT_FILE=$OPTARG
      ;;
    o )
      OUTPUT_FILE=$OPTARG
      ;;
    h )
      USAGE
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Fail if an executable isn't provided.
if [[ -z "$INPUT_FILE" ]]; then
  echo "$c_red
ILLEGAL: Provide a valid Input File to parse with the [-i] flag. $c_wht
" 1>&2
  USAGE
  exit 1
fi

if [[ -z "$OUTPUT_FILE" ]]; then
  echo "$c_red
ILLEGAL: Provide an Output file name with the [-o] flag. $c_wht
" 1>&2
  USAGE
  exit 1
fi

echo "$c_blu
Running script
---------------------------$c_wht"

sed 's/'/'\''/g;s/•/-/g;s/"/"/g;s/"/"/g;s/—/-/g' $INPUT_FILE > $OUTPUT_FILE;

echo "$c_blu
Done
--------------------------$c_wht"
