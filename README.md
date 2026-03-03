# SMT nuclear pore subdomain plotting utilities (MATLAB)

Minimal MATLAB utilities to **visualise and export** nuclear pore complex (NPC) **subdomain‑resolved**
single‑molecule tracking (SMT) **summary metrics** and **event‑stratified** comparisons for publication figures.

The code here is intentionally limited for public release and **does not bundle any third‑party
packages** and **does not include raw/sensitive data**.

## What this repo is (and is not)

**This repo is:**
- MATLAB functions that take **precomputed summary matrices** and generate
  publication-style figures (JPEG) and simple exports (XLSX/CSV) for NPC subdomain comparisons.
- Built around a 3‑subdomain convention:
  - **S1(F)**: cytoplasmic ring/filament side
  - **S2(N)**: central/inner pore
  - **S3(B)**: nuclear basket side
  - (One function variant also supports a 4th column: **NPC** aggregated)

**This repo is not:**
- A full SMT pipeline (segmentation, tracking, filtering, model fitting).
- A general-purpose plotting library. Several plots/legends assume a lab-specific convention
  (e.g., particular event types or condition labels).

## Repository layout

```
src/
  plots/   ErrorLee02T4*        % grouped line + grouped bar(error) summary plots
  hist/    HistLee2*            % two-condition histograms (JPEG + CSV)
  io/      importAlldataLee2*   % helpers to merge per-sample exports (Excel-based)
run/
  run_analysis_template.m       % minimal entry point you can adapt
docs/
  input_schema.md               % what the functions expect as inputs
```

## MATLAB requirements

- MATLAB with basic graphics and I/O support (`plot`, `bar`, `errorbar`, `writetable`, `csvwrite`).
- The bar+errorbar code includes a compatibility fallback for older MATLAB versions that lack
  `bar(...).XEndPoints`.

## Quick start

1) Clone the repository and open MATLAB in the repo root.

2) Add source folders to the MATLAB path:

```matlab
addpath(genpath(fullfile(pwd,'src')));
```

3) Start from the template:

```matlab
run(fullfile('run','run_analysis_template.m'));
```

## Minimal usage examples

### A) Grouped summary plot (3 subdomains)

Most `ErrorLee02T4*` functions expect:
- `pe_All`: a **1×12 cell array** where each cell contains a numeric array.
  - `pe_All{1..4}`: values for 4 conditions (each `nSeries × 3`)
  - `pe_All{5..8}`: error set **A** for those conditions (same size as values)
  - `pe_All{9..12}`: error set **B** for those conditions (same size as values)
- `peYS`: a **1×6 cell array** defining three y-axis tick/limit presets.

Example (toy data):

```matlab
% Each condition: 2 series (rows) × 3 subdomains (cols)
val_C   = [0.20 0.30 0.40; 0.15 0.25 0.35];
val_0p1 = val_C * 0.95;
val_1   = val_C * 0.80;
val_10  = val_C * 0.60;

errA_C   = 0.02 * ones(size(val_C));
errA_0p1 = 0.02 * ones(size(val_C));
errA_1   = 0.03 * ones(size(val_C));
errA_10  = 0.04 * ones(size(val_C));

errB_C   = 0.01 * ones(size(val_C));
errB_0p1 = 0.01 * ones(size(val_C));
errB_1   = 0.015 * ones(size(val_C));
errB_10  = 0.02 * ones(size(val_C));

pe_All = {val_C,val_0p1,val_1,val_10, errA_C,errA_0p1,errA_1,errA_10, errB_C,errB_0p1,errB_1,errB_10};
peYS = {0:0.1:1,[0 1], 0:0.2:2,[0 2], 0:0.5:5,[0 5]};

outDir = fullfile(pwd,'output_demo');
mkdir(outDir);
ErrorLee02T4IE_3C(pe_All, peYS, 'Demo_metric', 18, [outDir filesep], 'Metric (a.u.)', 'Metric (a.u.)', 10);
```

### B) Two-condition histogram (JPEG + CSV)

```matlab
outDir = fullfile(pwd,'output_demo');
mkdir(outDir);

x1 = randn(500,1) * 0.20;      % condition 1
x2 = randn(500,1) * 0.25;      % condition 2

HistLee2DualDPR(-1,0.2,1, x1, x2, 0.05, 16, 'Distance (a.u.)', [outDir filesep 'Hist_'], 30);
```

## Outputs

The plotting functions write:
- **JPEG figures** (typically 300 dpi for summary plots; 150 dpi for histograms)
- **XLSX tables** (for many `ErrorLee02T4*` functions)
- **CSV** files (for `HistLee2*` histogram bin exports)

Filenames are derived from `FDname`/`F4name` plus suffixes used inside each function.

## License and third‑party code

Only code contained in this repository is intended for public distribution.
No third‑party libraries are bundled.

If you later add external code, do **not** copy it in blindly—add it as a documented dependency
or include it only if its license explicitly permits redistribution and you preserve attribution.
