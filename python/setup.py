from setuptools import find_packages, setup
from distutils.util import convert_path
import codecs
import sys
import os
import re

main_ns = {}
ver_path = convert_path('src/pob_version.py')
with open(ver_path) as ver_file:
    exec(ver_file.read(), main_ns)

# Prepare and send a new release to PyPI
if "release" in sys.argv[-1]:
    os.system("python setup.py sdist")
    os.system("twine upload dist/*")
    os.system("rm -rf dist/pob*")
    sys.exit()


# PROJECT SPECIFIC

NAME = "pob"
PACKAGES = find_packages(where="src")
META_PATH = os.path.join("src", "pob", "__init__.py")
CLASSIFIERS = [
    "Development Status :: 3 - Alpha",
    "Intended Audience :: Financial and Insurance Industry",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
    "Programming Language :: Python :: 3.0",
]
INSTALL_REQUIRES = ["numpy", "pandas", "pandas_datareader"]
EXTRA_REQUIRE = {
    "test": ["pytest>=3.6"],
    "docs": [
        "sphinx>=3.3",
        "sphinx-book-theme",
        "matplotlib",
    ],
}
EXTRA_REQUIRE["coverage"] = EXTRA_REQUIRE["test"] + ["pytest-cov"]

# END PROJECT SPECIFIC


HERE = os.path.dirname(os.path.realpath(__file__))


def read(*parts: str) -> str:
    with codecs.open(os.path.join(HERE, *parts), "rb", "utf-8") as f:
        return f.read()


def find_meta(meta: str, meta_file: str = read(META_PATH)) -> str:
    meta_match = re.search(
        r"^__{meta}__ = ['\"]([^'\"]*)['\"]".format(meta=meta), meta_file, re.M
    )
    if meta_match:
        return meta_match.group(1)
    raise RuntimeError("Unable to find __{meta}__ string.".format(meta=meta))


setup(
    name=NAME,
    version=main_ns['__version__'],
    author=find_meta("author"),
    author_email=find_meta("email"),
    maintainer=find_meta("author"),
    maintainer_email=find_meta("email"),
    url=find_meta("uri"),
    license=find_meta("license"),
    description=find_meta("description"),
    long_description=read("README.md"),
    long_description_content_type="text/markdown",
    packages=PACKAGES,
    package_dir={"": "src"},
    include_package_data=True,
    python_requires=">=3.6",
    install_requires=INSTALL_REQUIRES,
    extras_require=EXTRA_REQUIRE,
    classifiers=CLASSIFIERS,
    zip_safe=True,
)
