#!/bin/bash

# Compile the DSDL files
uv run nnvg -v --outdir src/ --target-language py                                                dsdl/uavcan
uv run nnvg -v --outdir src/ --target-language py --lookup-dir dsdl/uavcan                       dsdl/reg
uv run nnvg -v --outdir src/ --target-language py --lookup-dir dsdl/uavcan --lookup-dir dsdl/reg dsdl/starcopter
uv run nnvg -v --outdir src/ --target-language py --lookup-dir dsdl/uavcan --lookup-dir dsdl/reg dsdl/zubax

# Move nunavut_support.py to nunavut_support/__init__.py
mkdir -p src/nunavut_support
mv -f src/nunavut_support.py src/nunavut_support/__init__.py
