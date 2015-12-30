# vim:set ft=make ts=4 sw=4 sts=4 autoindent:

# Makefile, easier than remembering the commands.
#
# Author:   Pontus Stenetorp    <pontus stenetorp se>
# Version:  2015-12-28

target:
	mvn dependency:copy-dependencies
	mvn compile

log/AI2Tune.out: target
	./run.sh AI2

.PHONY: crossval
crossval:
	rm -f data/ai2
	ln -s ai2_crossval data/ai2
	rm -f data/commoncore
	ln -s commoncore_crossval data/commoncore
	rm -f data/illinois
	ln -s illinois_crossval data/illinois

.PHONY: dev
dev:
	rm -f data/ai2
	ln -s ai2_dev data/ai2
	rm -f data/commoncore
	ln -s commoncore_dev data/commoncore
	rm -f data/illinois
	ln -s illinois_dev data/illinois

.PHONY: test
test:
	rm -f data/ai2
	ln -s ai2_test data/ai2
	rm -f data/commoncore
	ln -s commoncore_test data/commoncore
	rm -f data/illinois
	ln -s illinois_test data/illinois

.PHONY: ai2
ai2: log/AI2Tune.out

log/ILTune.out: target
	./run.sh IL

.PHONY: il
il: log/ILTune.out

log/CCTune.out: target
	./run.sh CC

.PHONY: cc
cc: log/CCTune.out

.DEFAULT: experiments
.PHONY: experiments
experiments: ai2 il cc

.PHONY: clean
clean:
	git checkout data/ai2 data/commoncore data/illinois
	rm -r -f annotation-cache-test log models target
