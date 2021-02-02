#!/bin/bash

# 02/01/2021; przemys1aw; created

ACONFFILES=(.editorconfig
            .nanorc
           )

for CONFFILE in ${ACONFFILES[*]}; do

  if [[ -L "${HOME}/${CONFFILE}" ]]; then
    unlink ${HOME}/${CONFFILE} && echo "Unlinked ${CONFFILE}"
  elif [[ -f "${HOME}/${CONFFILE}" ]]; then
    mv ${HOME}/${CONFFILE} ${HOME}/${CONFFILE}_$(date "+%Y%m%d%H%M%S") && echo "Moved original ${CONFFILE}"
  else
    "Echo ${CONFFILE} not found"
  fi

  ln -s ${PWD}/${CONFFILE} ${HOME}/${CONFFILE} && echo "Link created to ${CONFFILE}"

done

echo -e "\nParanoid check:"
for CONFFILE in ${ACONFFILES[*]}; do

  ls -l ${HOME}/${CONFFILE}

done
