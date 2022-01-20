#!/bin/bash

if pip list | grep sqlfluff 1>/dev/null; then
	# sqlfluff is already installed.
	echo 'sqlfluff is already installed. Skip the install step.'
else
	# sqlfluff is NOT installed. We will install it.
	echo 'sqlfluff is NOT installed. Start to install it now.'
	pip install sqlfluff
fi

SQL_FILES=$(find ./ -type f -name \*.sql)

sqlfluff lint ${SQL_FILES} --dialect postgres