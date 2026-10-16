.PHONY: test serve

test:
	uv run python tests/js/make_golden.py --check
	node --test tests/js/*.test.mjs

serve:
	python3 -m http.server 8000 --directory docs
