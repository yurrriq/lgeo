LFE_BIN = _build/default/lib/lfe/bin
LFE = $(LFE_BIN)/lfe

all: build

build:
	rebar3 compile

repl:
	@$(LFE)

check:
	rebar3 eunit -v

check-quiet:
	rebar3 eunit

clean:
	rebar3 clean
	rm -fr priv

clean-all: clean
	rebar3 lfe clean

dialyzer-build: build
	dialyzer --build_plt --output_plt erlogr.plt \
        -o dialyzer.build \
        -r src ebin
