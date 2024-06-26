dict-gen=python mb-tool/steno_dict.py

programs=rime
scripts=kana

.PHONY: all clean

all: $(foreach script,$(scripts),$(script)_all)

kana_all: $(foreach program,$(programs),$(program)-kana)

rime-%: build-%
	cat build/$*.tsv | mb-tool/format.sh rime > build/rime-$*.tsv

build-%:
	cat $*/table.tsv | awk -F '\t' '{print $$1"\t"$$2} $$2 ~ /^\S+$$/ {print $$1"\t "$$2}' | \
		$(dict-gen) $*/system.json $*/chordmap.tsv > build/$*.tsv

clean:
	rm build/*
