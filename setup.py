import os
from setuptools import setup, find_packages


def read(filename: str) -> str:
    return open(os.path.join(os.path.dirname(__file__), filename)).read()


VERSION = os.environ.get("LBB_COMMON_VERSION", None)

if not VERSION:
    raise ValueError("No VERSION was supplied")

packages = find_packages(exclude=("labonneboite_common.tests",))

setup(
    name="labonneboite-common",
    version="0.1.1",
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
