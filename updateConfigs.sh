#!/bin/bash

# 02/01/2021; przemys1aw; created
# 02/17/2021; przemys1aw; yaml and md files hijacked from https://github.com/serialhex/nano-highlight

ACONFFILES=(.editorconfig
            .nanorc
           )

SYNDIR=".nano"
ASYNFILES=(yaml.nanorc
           markdown.nanorc
					 c.nanorc
					 python.nanorc
					 sh.nanorc
          )

for CONFFILE in ${ACONFFILES[*]}; do

  if [[ -L "${HOME}/${CONFFILE}" ]]; then
    unlink ${HOME}/${CONFFILE} && echo "Unlinked ${CONFFILE}"
  elif [[ -f "${HOME}/${CONFFILE}" ]]; then
    mv ${HOME}/${CONFFILE} ${HOME}/${CONFFILE}_$(date "+%Y%m%d%H%M%S") && echo "Moved original ${CONFFILE}"
  else
    echo "${CONFFILE} not found"
  fi

  ln -s ${PWD}/${CONFFILE} ${HOME}/${CONFFILE} && echo "Link created to ${CONFFILE}"

done

if [[ -d "${HOME}/${SYNDIR}" ]]; then
  echo -e "Found ${HOME}/${SYNDIR}"
else
  mkdir ${HOME}/${SYNDIR} && echo "Created ${HOME}/${SYNDIR}"
fi

for SYNFILE in ${ASYNFILES[*]}; do

  if [[ -L "${HOME}/${SYNDIR}/${SYNFILE}" ]]; then
    unlink ${HOME}/${SYNDIR}/${SYNFILE} && echo "Unlinked ${SYNFILE}"
  elif [[ -f "${HOME}/${SYNDIR}/${SYNFILE}" ]]; then
    mv ${HOME}/${SYNDIR}/${SYNFILE} ${HOME}/${SYNDIR}/${SYNFILE}_$(date "+%Y%m%d%H%M%S") && echo "Moved original ${SYNFILE}"
  else
    echo "${SYNFFILE} not found"
  fi

  ln -s ${PWD}/${SYNDIR}/${SYNFILE} ${HOME}/${SYNDIR}/${SYNFILE} && echo "Link created to ${SYNFILE}"

done

echo -e "\nParanoid check:"
for CONFFILE in ${ACONFFILES[*]}; do
  ls -l ${HOME}/${CONFFILE}
done

for SYNFILE in ${ASYNFILES[*]}; do
  ls -l ${HOME}/${SYNDIR}/${SYNFILE}
done
