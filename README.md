# Interpretable Hybrid Machine Learning Models Using FOLD-SE and ASP

## Overview

This repository is built upon and extends the work from [FOLD-R++ ASP Hybrid Repository](https://github.com/sannewielinga/, which integrated FOLD-R++ with black-box ML models. The majority of the codebase originates from that prior work by Sanne Wielinga.
Our contribution is the adaptation of this framework to use FOLD-SE instead of FOLD-R++. We do not claim ownership of the original code architecture, data processing tools, or experimental methodology—we have simply continued and extended the existing work.
We are grateful to Sanne Wielinga for their foundational contributions.

This project uses the Fold-SE API created by the University of Texas at Dallas, which is an implementation of the Fold-SE algorithm by Wang et. al. More information about the api can be found here: [Fold-SE API](http://ec2-52-0-60-249.compute-1.amazonaws.com/ )

## Components

## How to Run

1. Install dependencies:
    ```bash
    pip3 install -r requirements.txt
    ```
    create an account at [Fold-SE API registration](http://ec2-52-0-60-249.compute-1.amazonaws.com/foldse-api/) by filling in your email.
    Copy the contents of the file `config.ini.template` into a file named `config.ini`
    Fill in your email and the password sent to you in `config.ini`

2. Execute:
    ```bash
    python3 main.py
    ```
    This will run 10 experiments per model-dataset combination and produce results.

## Results and Output
- The script prints average accuracy, F1 scores, elasped time and statistical significance results.
- Induced ASP rules and explanations are stored in `results/` directory.

## Licene Original Foldr++ hybrid model:
MIT License

Copyright (c) 2025 Sanne Wielinga

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.