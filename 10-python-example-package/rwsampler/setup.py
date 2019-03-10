import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="alexanderbuchholz",
    version="0.0.1",
    author="Alexander Buchholz",
    author_email="ab2603@cam.ac.uk",
    description="A small example package that illustrates testing based on the RWMH sampler",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/rr-mrc-bsu/reproducible-research/10-python-example-package/rwsampler",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)

