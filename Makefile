paperless-ai-0.1.0.tgz:
	helm package .

install: paperless-ai-0.1.0.tgz
	helm push paperless-ai-0.1.0.tgz oci://registry.nick.wtf/library
