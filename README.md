# Interpretable Hybrid Machine Learning Models Using FOLD-SE and ASP

## Overview

This repository is built upon and extends the work from [FOLD-R++ ASP Hybrid Repository](https://github.com/sannewielinga/, which integrated FOLD-R++ with black-box ML models. The majority of the codebase originates from that prior work by Sanne Wielinga.
Our contribution is the adaptation of this framework to use FOLD-SE instead of FOLD-R++, in addition to implementing a dynamic confidence threshold. We do not claim ownership of the original code architecture, data processing tools, or experimental methodology—we have simply continued and extended the existing work.
We are grateful to Sanne Wielinga for their foundational contributions.

This project uses the Fold-SE API created by the University of Texas at Dallas, which is an implementation of the Fold-SE algorithm by Wang et. al. More information about the api can be found here: [Fold-SE API](http://ec2-52-0-60-249.compute-1.amazonaws.com/ )

For more information about our work, please read the paper included in the repository.

## Project Structure

| File | Description |
|------|-------------|
| `datasets`| contains all raw csv datasets
| `paper_results`| contains the results used in the attached paper
| `config.ini.template` | Template for configuration settings. Copy this to `config.ini` and adjust values for your setup. |
| `data_loader.py` | Handles loading and preprocessing of the datasets. |
| `datasets.py` | Contains dataset definitions and related utilities. |
| `fold_model.py` | The model class with helper functions (adapted from the FOLD-R++ repository). |
| `foldse_api.py` | Contains the calls to the FOLD-SE API for training and inference. |
| `hybrid_model.py` | Combines ML model predictions with ASP rules using a dynamic confidence threshold. |
| `explainability.py` | Produces and stores explanations derived from the ASP rules. |
| `main.py` | Primary script that executes the complete experimental pipeline. |
| `ml_models.py` | Contains the objects of the available Machine Learning models. |
| `requirements.txt` | Lists all Python dependencies needed to run the project. |

## How to Run

1. Install dependencies and create config file:
    ```bash
    pip3 install -r requirements.txt
    cp config.ini.template config.ini
    ```

    This installs the required dependencies and makes a copy of `config.ini.template` to `config.ini`.
    Create an account at [Fold-SE API registration](http://ec2-52-0-60-249.compute-1.amazonaws.com/foldse-api/) by filling in your email.
    Fill in your email and the password sent to you in `config.ini`

2. Execute:
    ```bash
    python3 main.py
    ```
    This will run 10 experiments per model-dataset combination and produce results.

## Results and Output
- The script prints average accuracy, F1 scores, elasped time and statistical significance results.
- Induced ASP rules and explanations are stored in `results/programs/` directory.

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

## License modifications and extensions:
MIT License

Copyright (c) 2025 Renée Vroedsteijn, Sisi Wu

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