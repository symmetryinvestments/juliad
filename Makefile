julia.d: source/juliad/julia.dpp
	dub run dpp -- --keep-d-files source/juliad/julia.dpp --include-path /usr/include/julia --preprocess-only --define JULIA_ENABLE_THREADING=1 --clang-option "-fPIC"
