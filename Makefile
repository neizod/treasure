SHELL = /bin/bash

main:
	coffee -bcs < <(tail -n +4 treasure.coffee) > treasure.js

clean:
	rm -f treasure.js
