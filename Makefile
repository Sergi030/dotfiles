
help:
	@bash ./.make_help.sh APP

install:
ifdef APP
	@bash .make_install.sh $(APP)
endif
