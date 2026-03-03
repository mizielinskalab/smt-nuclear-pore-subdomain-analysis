# Input expectations

This repository contains plotting utilities that were developed around a lab-specific SMT workflow.
The functions are **not** fully self-describing (they were written for internal use), so this page
documents the *minimum* input shapes and conventions required to run them.

If you want others to reproduce your exact figures, consider adding a small anonymised example
dataset under `data/example/`.

---

## 1) `ErrorLee02T4*` grouped summary plots

### 1.1 Function signatures

The main variants included here are:

- `ErrorLee02T4only_3C(pe_All, peYS, FDname, ffs, cSave2, yLa1, yLa2, CS)`
- `ErrorLee02T4OC_3C(pe_All, peYS, FDname, ffs, cSave2, yLa1, yLa2, CS)`
- `ErrorLee02T4IE_3C(pe_All, peYS, FDname, ffs, cSave2, yLa1, yLa2, CS)`
- `ErrorLee02T4IE_3CAA(pe_All, peYS, FDname, ffs, cSave2, yLa1, yLa2, CS, AA, AB)`
- `ErrorLee02T4IE_3CAA_Mol(pe_All, peYS, FDname, ffs, cSave2, yLa1, yLa2, CS, AA, AB)`
- `ErrorLee02T4IE_3CAA_u4(pe_All, peYS, FDname, ffs, cSave2, yLa1, yLa2, CS, AA, AB)`

### 1.2 `pe_All` (values + two error sets)

`pe_All` must be a **1×12 cell array**:

| Index | Meaning | Expected shape |
|---:|---|---|
| `pe_All{1}` | Values, condition 1 (e.g., Control) | `nSeries × nSubdomains` |
| `pe_All{2}` | Values, condition 2 (e.g., 0.1) | `nSeries × nSubdomains` |
| `pe_All{3}` | Values, condition 3 (e.g., 1) | `nSeries × nSubdomains` |
| `pe_All{4}` | Values, condition 4 (e.g., 10) | `nSeries × nSubdomains` |
| `pe_All{5..8}` | Error set **A** for conditions 1..4 | same as values |
| `pe_All{9..12}` | Error set **B** for conditions 1..4 | same as values |

Notes:
- `nSubdomains` is **3** for the `_3C` functions (S1/S2/S3).
- `ErrorLee02T4IE_3CAA_u4` expects `nSubdomains = 4` with the 4th column representing an
  additional aggregated NPC metric (`S123_NPC`).
- The code writes multiple outputs per call (line plots + grouped bar plots) and uses **error set A**
  and **error set B** in different panels. The function code does not enforce whether A is SD and B
  is SE (or vice-versa). Choose one convention and pass consistent arrays.

### 1.3 Row conventions (`nSeries`)

The plotting functions assume a particular **row ordering** for labels/legends (hard-coded in the
functions). Keep your `nSeries` rows aligned with the intended meaning.

Common internal conventions:

- `ErrorLee02T4IE_3C` (Import/Export summary):
  - row 1: `Importing`
  - row 2: `Exporting`

- `ErrorLee02T4OC_3C` (Open/Close summary):
  - row 1: `Transmitted(Open)`
  - row 2: `Aborted(Close)`

- `ErrorLee02T4only_3C` (single-series summary):
  - typically expects a single row (`1×3`) per condition, but also accepts `nSeries×3`.

- `ErrorLee02T4IE_3CAA*` (row selection):
  - `AA` is a row index (or vector of row indices) into the `nSeries` rows.
  - `AB` is a label prefix used to build the legend entries.

If your internal workflow uses a different row order, you have two options:
1) Reorder your matrices before calling these functions, or
2) Edit the legend/rownames inside the plotting function.

### 1.4 `peYS` (y-axis scale presets)

`peYS` must be a **1×6 cell array**:

```
peYS = {YT11, YT12,  YT21, YT22,  YT31, YT32};
```

Where each pair defines a y-axis scale preset:
- `YT11` is a tick vector, `YT12 = [yMin yMax]`
- `YT21` is a tick vector, `YT22 = [yMin yMax]`
- `YT31` is a tick vector, `YT32 = [yMin yMax]`

The functions loop over 3 presets internally and write multiple panels.

### 1.5 Output location (`cSave2`) and naming (`FDname`)

- `cSave2` must be a folder path **ending with a file separator** (e.g., `[outDir filesep]`).
- `FDname` is used as the filename prefix.

The functions save:
- JPEG figures (typically `-r300`) with suffixes like `01Location`, `02PS`, `03STD`, `05SE`, etc.
- XLSX exports via `writetable` for many panels.

---

## 2) `HistLee2*` two-condition histograms

### 2.1 Function signatures

- `HistLee2DualDPR(mYS1, mYS2, mYS3, tSCY, tSCY2, VW, ffs, yLa, F4name, eHistsize)`
- `HistLee2DualDPRSM2(...)` and plot variants follow a similar convention.

### 2.2 Inputs

- `tSCY`, `tSCY2`: numeric vectors for two conditions (e.g., distances, speeds, etc.)
- `mYS1:mYS2:mYS3`: x-axis tick settings and range (`XTick` and `XLim`)
- `VW`: bin width (same units as `tSCY`)
- `yLa`: x-axis label string
- `F4name`: output file prefix (including folder), e.g. `[outDir filesep 'Hist_']`
- `eHistsize`: y-axis scaling used for the percentage panel

### 2.3 Outputs

Each call writes:
- JPEG histogram(s)
- A CSV export `*_Data.csv` containing bin centres and binned values (the exact columns depend on
  the panel type inside the function).

---

## 3) `importAlldataLee2*` merge helpers (Excel-based exports)

These helpers merge per-sample outputs into aggregated arrays.

### 3.1 `importAlldataLee2mat`

```matlab
[data1, pos1, data2, pos2] = importAlldataLee2mat(aFolderName, a01, aC31);
```

Expected conventions (from the function code):
- `a01` is a folder pattern (e.g., `'N*P*'`) used by `dir(a01)`.
- Each matched sample folder is expected to contain:
  - `aFolderName` (a subfolder)
  - A file matching pattern `aC31` within that subfolder
  - A folder `03-Individual-Tracking-Record/` containing at least one `*.tif` (used as a presence check)
- The imported Excel is expected to contain fields `w05TTN` and `w01OPN` (accessed after `importdata`).

### 3.2 `importAlldataLee2matSe`

Same as above, plus:
- `aSelection4`: indices of rows to remove from the aggregated cell arrays before returning.

### 3.3 `importAlldataLee2SRaw`

```matlab
bData = importAlldataLee2SRaw(aFolderName, a01, aFolderNameC2, aC31, aSelection4);
```

This variant loads Excel files from a deeper path:
`<sample>/<aFolderName>/<aFolderNameC2>/<aC31>`.

The return type follows `importdata` output concatenation as used in the function.
