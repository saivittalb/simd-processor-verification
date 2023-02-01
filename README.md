# SIMD Processor Verification

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub followers](https://img.shields.io/github/followers/saivittalb.svg?style=social&label=Follow)](https://github.com/saivittalb?tab=followers)
[![Twitter Follow](https://img.shields.io/twitter/follow/saivittalb.svg?style=social)](https://twitter.com/saivittalb)

Formal verification of a 16-bit SIMD processor. The following properties were fomally verified:

* Functional properties
* Coverage properties
* Fairness/Liveness properties
* Safety properties
* False positive check
* Latency insensitive check

Developed as a part of CSEE E6893 – Formal Verification of Hardware and Software Systems at Columbia University. The final report is named as ```FV_Final_Project_Report.pdf``` and can be found in this repository.

This repository is used for personal reference purposes only. No PRs are welcomed. The source code of the original SIMD processor can be found in the references in the final project report. The assertions can be found in the following path: ```src/assertions/SIMD_assertions.sv```.

## Table of contents

* [License](#license)
* [Requirements](#requirements)
* [Setup](#setup)

## License

This project is licensed under the MIT License, a short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications and larger works may be distributed under different terms and without source code.

<p align="center"> Copyright (c) 2023 Sai Vittal B. All rights reserved.</p>

## Requirements

* Questa PropCheck
* Knowledge of System Verilog Assertions

## Setup

Run the following commands and finally run the makefile in this repository using the following commands in a Linux-based computer with Questa PropCheck installed.

```bash
$ export QHOME=/tools/mentor/questa_2019.2_1/linux_x86_64
$ export PATH=$QHOME/bin:$PATH
$ make run
```

[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://GitHub.com/saivittalb/)
[![ForTheBadge powered-by-electricity](http://ForTheBadge.com/images/badges/powered-by-electricity.svg)](http://ForTheBadge.com)

<p align="center"> Copyright (c) 2023 Sai Vittal B. All rights reserved.</p>
<p align="center"> Made with ❤ by <a href="https://github.com/saivittalb">Sai Vittal B</a></p>
