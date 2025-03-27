dict-gen=python mb-tool/steno_dict.py

system=system/abc.json

chordmap=kana/kana.tsv

all:
	$(dict-gen) $(system) $(chordmap) --no-table > dict.tsv
	printf "\n" >> dict.tsv
	sed -E 's/\t/\t>/'  $(chordmap) | \
		$(dict-gen) $(system) /dev/stdin --no-table >> dict.tsv

clean:
	rm build/*
