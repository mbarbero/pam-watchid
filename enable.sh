#!/usr/bin/env bash

SUDO_FILE=$1
PAM_LIB=$2

if [[ ! -f ${SUDO_FILE} ]]; then
    echo "sudo file not found: ${SUDO_FILE}"
    exit 1
fi

if [[ ! -f ${PAM_LIB} ]]; then
    echo "pam lib not found: ${PAM_LIB}"
    exit 1
fi

if grep -q "^[[:space:]]*auth[[:space:]]*sufficient[[:space:]]*${PAM_LIB}[[:space:]]*$" "${SUDO_FILE}"; then
    echo "pam_watchid already enabled in ${SUDO_FILE}"
    exit 0
else 
    echo "auth       sufficient     /usr/local/lib/pam/pam_watchid.so" >> "${SUDO_FILE}"
fi