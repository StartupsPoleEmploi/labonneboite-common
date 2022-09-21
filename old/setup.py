import os
from setuptools import setup, find_packages


def read(filename: str) -> str:
    return open(os.path.join(os.path.dirname(__file__), filename)).read()


PACKAGE_NAME = os.environ.get("PACKAGE_NAME", None)
PACKAGE_VERSION = os.environ.get("PACKAGE_VERSION", None)

if not PACKAGE_NAME:
    raise ValueError("No NAME was supplied")
if not PACKAGE_VERSION:
    raise ValueError("No VERSION was supplied")

packages = find_packages(exclude=("labonneboite_common.tests",))

setup(
    name=PACKAGE_NAME,
    version=PACKAGE_VERSION,
    author="La Bonne Boite - common library",
    author_email="labonneboite@pole-emploi.fr",
    description="",
    packages=packages,
    package_data={"labonneboite_common": ["py.typed"]},
    include_package_data=True,
    long_description=read("README.md"),
    install_requires=[req for req in open("requirements.txt")],
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "License :: OSI Approved :: GNU Affero General Public License v3",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.6",
    ],
)
