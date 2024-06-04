scripts=kana

.PHONY: all clean

all: $(foreach script,$(scripts),$(script)_all)

kana_all: build-kana

build-%:
	cat $*/table.tsv | awk -F '\t' '{print $$1"\t"$$2} $$2 ~ /^\S+$$/ {print $$1"\t "$$2}'

clean:
	rm build/*
