#!/bin/bash

polkish.sudo() {
	if command -v "${FUNCNAME##*.}" &> /dev/null ; then
		sudo "${@}"
	else
		echo "${0##*/}: \"${FUNCNAME##*.}\" not found!"
		return 1
	fi
}

polkish.doas() {
	if command -v "${FUNCNAME##*.}" &> /dev/null ; then
		doas "${@}"
	else
		echo "${0##*/}: \"${FUNCNAME##*.}\" not found!"
		return 1
	fi
}

polkish.pkexec() {
	if command -v "${FUNCNAME##*.}" &> /dev/null ; then
		pkexec "${@}"
	else
		echo "${0##*/}: \"${FUNCNAME##*.}\" not found!"
		return 1
	fi
}

polkish.exec() {
	local i=""
	local PRIO=(
		"sudo"
		"doas"
		"pkexec"
	)

	for i in "${PRIO[@]}" ; do
		if command -v "${i}" &> /dev/null ; then
			local DEFAULT="${i}"
			local status="true"
			break
		else
			local status="false"
		fi
	done

	if "${status}" ; then
		polkish."${DEFAULT}" "${@}"
	else
		echo "${0##*/}: ${FUNCNAME%*.}: couldn't determine priority of that programs: \"${PRIO[@]}\"."
		return 1
	fi
}

if [[ "${BASH_SOURCE[-1]}" = "${0}" ]] ; then
	polkish.exec "${@}"
fi