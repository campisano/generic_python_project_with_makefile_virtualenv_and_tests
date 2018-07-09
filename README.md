###### *Tests:* linux: [![Build Status](https://travis-ci.org/campisano/python-sample-project-with-makefile-virtualenv-tests.svg?branch=master "Linux build")](https://travis-ci.org/campisano/python-sample-project-with-makefile-virtualenv-tests)
---


# python-sample-project-with-makefile-virtualenv-tests

A minimal python sample project configured to use a Makefile to setup virtualenv and tests tools.

The Makefile is configured to run the test as its main target. The result of such run is the same reported in Travis-CI site [![Build Status](https://travis-ci.org/campisano/python-sample-project-with-makefile-virtualenv-tests.svg?branch=master "Linux build")](https://travis-ci.org/campisano/python-sample-project-with-makefile-virtualenv-tests).

Before the test, the make command creates a local virtualenv installing the dependent packages defined in requirements.txt file, as well as the pylint and pytest tools.
