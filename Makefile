default:
	@echo "Usage:"
	@echo "\tmake test"
	@echo "\tmake format"
	@echo "\tmake docs"
	@echo "\tmake package"
	@echo "\tmake clean"
	@echo "\tmake publish"
test:

build-arm:
	cd cli && env GOOS=linux GOARCH=arm go build cli/

format-py:
	autoflake -i cvpm/*.py
	# autoflake -i cvpm/**/*.py

	isort -i cvpm/*.py
	# isort -i cvpm/**/*.py 

	yapf -i cvpm/*.py
	# yapf -i cvpm/**/*.py

format-go:
	gofmt -l -s -w *.go

docs:
	cd docs && npm run docs:build

package:
	python setup.py sdist bdist_wheel

clean:
	rm -rf build
	rm -rf dist
	rm -rf cvpm.egg-info

publish-test:
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

publish-prod:
	twine upload dist/*

.PHONY: docs