#!/bin/bash
set +e
THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KOTLIN_SCRIPT_FILE="${THIS_SCRIPT_DIR}/script.main.kts"

if [ "${kotlin_script}" == "" ]; then
    echo " [!] kotlin_script environment is missing or empty - no Kotlin Script defined!"
    exit 1
fi

if [ -n "${script_run_dir}" ]; then
    cd "${script_run_dir}"
fi

set -e
# Writing kotlin script to file
echo "${kotlin_script}" > "${KOTLIN_SCRIPT_FILE}"
set +e

cmd_ex_code=0
echo "--- Running kotlin script ---"
echo ""
kotlin "${KOTLIN_SCRIPT_FILE}"
cmd_ex_code=$?
echo ""
echo "---        finished       ---"
exit $cmd_ex_code
