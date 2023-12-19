#!/bin/bash
set +e
THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KOTLIN_SCRIPT_FILE="${THIS_SCRIPT_DIR}/script.main.kts"

if [ "${kotlin_content}" == "" ]; then
    echo " [!] kotlin_content environment var is missing or empty - no Kotlin Script defined!"
    exit 1
fi

if [ ! -z "${working_dir}" ] ; then
	cd "${working_dir}"
	if [ $? -ne 0 ] ; then
		echo " [!] Failed to switch to working directory: ${working_dir}"
		exit 1
	fi
fi

set -e
# Writing kotlin script to file
echo "${kotlin_content}" > "${KOTLIN_SCRIPT_FILE}"
set +e

cmd_ex_code=0
echo "--- Running kotlin script ---"
kotlin "${KOTLIN_SCRIPT_FILE}"
cmd_ex_code=$?
exit $cmd_ex_code
