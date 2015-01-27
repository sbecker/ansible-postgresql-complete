
export-galaxy-roles:
	ansible-galaxy list -p roles/ > galaxy-roles.txt

import-galaxy-roles:
	ansible-galaxy install -r galaxy-roles.txt -p roles

