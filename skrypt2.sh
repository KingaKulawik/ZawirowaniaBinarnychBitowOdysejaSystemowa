#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}


if [[ ! -d "${TARGET_DIR}" ]]; then
    mkdir  "${TARGET_DIR}"
echo "Utworzono katalog ${TARGET_DIR}"
fi


while IFS= read -r file; do

    if [[ -e "${SOURCE_DIR}/${file}" ]]; then
        rm "${SOURCE_DIR}/${file}"
    fi
done < "${RM_LIST}"

if [[ $(ls -A "${SOURCE_DIR}" | wc -l) -gt 0 ]]; then
    echo "jeszcze coś zostało"

    NUM_FILES=$(ls -A "${SOURCE_DIR}" | wc -l)

    if [[ ${NUM_FILES} -ge 4 ]]; then
        echo "zostało więcej niż 4 pliki"
    elif [[ ${NUM_FILES} -ge 3 ]]; then
        echo "zostało co najmniej 3 pliki"
    elif [[ ${NUM_FILES} -ge 2 ]]; then
        echo "zostało co najmniej 2 pliki"
    fi
else
    echo "tu był Konowicz"
fi
