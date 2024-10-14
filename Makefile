PIP = pip3
REQUIREMENTS = pandas

all: install

install:
	$(PIP) install $(REQUIREMENTS)