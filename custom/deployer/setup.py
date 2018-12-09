#!/usr/bin/env python

from setuptools import setup, find_packages

# Version info -- read without importing
_locals = {}
with open("deployer/_version.py") as fp:
    exec(fp.read(), None, _locals)
version = _locals["__version__"]

setup(
    name="deployer",
    version=version,
    description="Simple custom Orchestration",
    license="MIT",
    long_description=open("README.rst").read(),
    author="John Landis",
    author_email="john.landis@jacquette.com",
    install_requires=["fabric>=2.0,<3.0", "python-dotenv"],
    packages=find_packages(),
    classifiers=[],
)
