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
	rm -r -f annotation-cache-test log models target
