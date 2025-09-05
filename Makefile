.PHONY: default
default:
	nix build --print-build-logs --show-trace --offline
