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