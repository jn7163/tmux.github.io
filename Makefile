RELEASE=2.5

.PHONY: index.html all

all: index.html
	(rm -f ss-small-* && \
		for i in ss-tmux[0-9].png; do \
			convert "$$i" \
				-resize '150x' -resize 'x100<' \
				-gravity center -crop 150x100+0+0 +repage \
				"ss-small-$${i##ss-}"; \
		done)

index.html:
	sed "s/%%RELEASE%%/${RELEASE}/g" index.html.in >index.html
