
init:
	@echo 'This script will try install ansible roles in local folder "galaxy_roles"'
	@read -p 'Do you agree? [Y/n] ' agree; if [ "$$agree" = "n" ]; then echo 'aborting'; exit 1; fi
	ansible-galaxy role install -f -r requirements.yml --roles-path galaxy_roles
	@echo "Done!"

