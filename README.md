# Lamin B1 bright-field-to-fluorescence prediction model used in this study

This repository shares the **study-specific Lamin B1 prediction package** used in our work. The model was built **on top of the Allen Institute `pytorch_fnet` framework** and follows the general approach introduced in *Label-free prediction of three-dimensional fluorescence images from transmitted-light microscopy* by Ounkomol *et al.* (Nature Methods, 2018).

This repository does **not** present a new deep-learning framework. Instead, it shares the **study-specific Lamin B1 model weights, training options, example input pairs, input CSV, inference command, and example prediction outputs** used to support the nuclear-envelope prediction step in this study.

## Scope of this repository

This repository documents one **supporting image-analysis component** of the paper. The paper is **not a software-development paper**, and the deep-learning model is **not presented as the main methodological contribution**.

In this study, **bright-field images were used to perform a supporting Lamin B1-like nuclear-envelope prediction step**, and we share the **study-specific trained model** together with **example inference inputs and outputs** so that readers can inspect this part of the workflow.

## Recommended public repository contents

The public GitHub repository should contain:

```text
README.md
HOW_TO_VERIFY_OUTPUTS.md
HOW_THIS_MODEL_WAS_USED_IN_THE_STUDY.md
THIRD_PARTY_AND_LICENSE_NOTE.md
.gitignore
predict_2d_anaconda_prompt_LB3.bat
predict_2d_anaconda_prompt_LB3_portable_template.bat
01-Model/
└── LB3_005_All_mc256p512b4_SD2_n31000/
    └── train_options.json
02-Input-images/
03-Input-images-csv/
└── input_location.csv
04-Results/
└── Model_prediction_01/
```

The large model archive itself should **not** be committed into the main repository history. Instead, the split model archive should be uploaded through the **Releases** section of the same repository:

```text
model.zip.001
model.zip.002
model.zip.003
model.zip.004
```

## Repository contents used in this study

```text
01-Model/
└── LB3_005_All_mc256p512b4_SD2_n31000/
    ├── train_options.json
    └── model.p    [distributed separately through GitHub Release assets]

02-Input-images/
├── 216 TIFF files total
└── 108 paired examples:
    - c2 = bright-field input (`signal`)
    - c1 = Lamin B1 fluorescence target (`target`)

03-Input-images-csv/
└── input_location.csv

04-Results/
└── Model_prediction_01/
    ├── predictions.csv
    ├── predict_options.json
    └── 108 numbered folders (00-107), each containing:
        ├── prediction_LB3_005_All_mc256p512b4_SD2_n31000.tiff
        ├── prediction_LB3_005_All_mc256p512b4_SD2_n31000_unpropped.tiff
        ├── signal.tiff
        └── target.tiff
```

## Model weights

The study-specific Lamin B1 model weights are hosted separately as **four split GitHub Release assets** because the original model file exceeds GitHub’s standard repository file limits. The code, documentation, training options, example inference workflow, and example outputs are available in this repository, and the full model weights can be downloaded from the **Releases** section of this same repository.

After downloading all four parts into the same folder, reconstruct the archive using the same archive tool that was used to split it. In practice, if the files were split with 7-Zip or WinRAR, keep `model.zip.001` to `model.zip.004` in the same folder and extract only `model.zip.001`; the archive tool should automatically rebuild the full archive.

The reconstructed archive should contain:

```text
01-Model/LB3_005_All_mc256p512b4_SD2_n31000/model.p
```

## What each folder means

### `01-Model/`
This folder contains the study-specific model configuration.

- `train_options.json`: training configuration generated within the upstream `pytorch_fnet` framework
- `model.p`: trained model weights distributed through the GitHub Release assets because of file size constraints

### `02-Input-images/`
This folder contains **108 paired test examples**. Each pair was acquired from the same imaging location.

- `c2`: bright-field image used as the model input
- `c1`: Lamin B1 fluorescence image used as the reference target

### `03-Input-images-csv/`
This folder contains the CSV file that maps the input and target image paths used for prediction.

- `input_location.csv`: links each bright-field input image (`path_signal`) to its Lamin B1 fluorescence target (`path_target`)

### `04-Results/`
This folder contains the saved inference results.

Inside each numbered output folder:

- `prediction_... .tiff`: processed model prediction
- `prediction_..._unpropped.tiff`: unprocessed model prediction saved by the upstream pipeline
- `signal.tiff`: input bright-field image copied into the output folder
- `target.tiff`: corresponding Lamin B1 fluorescence image copied into the output folder

This structure allows direct comparison of **input bright-field**, **predicted Lamin B1**, and **measured Lamin B1 fluorescence**.

## Upstream dependency and software environment

This repository depends on the Allen Institute `pytorch_fnet` codebase. Users should obtain the upstream framework directly from that repository and follow the original installation guidance there.

This repository does **not** redistribute the full upstream framework and does **not** provide a frozen exact local environment export. Instead, it documents the **study-specific model, training options, example data mapping, example outputs, and batch inference commands** used in this work.

## How to run inference

### Step 1. Install the upstream framework
Install `pytorch_fnet` from the Allen Institute repository and create the matching Anaconda environment used for prediction. In practical use, inference was run from **Anaconda Prompt** with the `fnet` environment activated.

### Step 2. Obtain the study-specific model weights
Download all four release assets from the **Releases** section of this repository:

- `model.zip.001`
- `model.zip.002`
- `model.zip.003`
- `model.zip.004`

Reconstruct the original archive and place `model.p` at:

```text
01-Model/LB3_005_All_mc256p512b4_SD2_n31000/model.p
```

### Step 3. Place this repository on disk
The original study batch file expects a Windows directory structure such as:

```text
D:\Deep_learning_model
```

If you keep the original batch file unchanged, place the folders under that root path or edit the file paths accordingly. A portable template is also provided.


### Step 4. Run the provided batch command

Open **Anaconda Prompt**, activate the `fnet` environment used for `pytorch_fnet`, and run:

```bat
conda activate fnet
predict_2d_anaconda_prompt_LB3.bat
```

The provided batch file is intended to be run from **Anaconda Prompt** on Windows rather than from a standard Command Prompt, because it assumes an Anaconda-managed environment for the upstream `pytorch_fnet` installation.

The original study batch file uses:

- model directory: `D:\Deep_learning_model\01-Model\LB3_005_All_mc256p512b4_SD2_n31000`
- input CSV: `D:\Deep_learning_model\03-Input-images-csv\input_location.csv`
- output directory: `Deep_learning_model\04-Results\Model_prediction_01\`
- upstream prediction script: `D:\Deep_learnig\Softwares\Label_free_prediction\pytorch_fnet-release_1\predict.py`

A portable path-editable template is included as:

- `predict_2d_anaconda_prompt_LB3_portable_template.bat`

## Notes on the provided outputs

The shared results folder already contains **108 example prediction cases** for inspection. A reader can verify the mapping between:

1. the input bright-field image,
2. the predicted Lamin B1 image,
3. the unprocessed saved prediction, and
4. the measured Lamin B1 fluorescence target.

`predictions.csv` and `predict_options.json` provide additional bookkeeping for those outputs.

## Imaging conditions relevant to model transfer

This model was trained for a **specific microscopy setting and sample type**, and transfer performance should be interpreted accordingly. For the uploaded microscope metadata, the bright-field-relevant acquisition information includes 16-bit images, 512 × 512 frames, 100 ms exposure, no binning, a Plan Apo VC 100x Oil DIC N2 objective, and voxel size 0.1224 × 0.1224 µm. The associated image metadata also report a resolution of 8.1694 pixels per micron. These acquisition details matter because the model is sensitive to changes in image scale and appearance.

## Practical limitations

The model was trained for **our own imaging conditions** and was used in the paper as a practical prediction tool to estimate Lamin B1-defined nuclear-envelope structure from transmitted-light images. It should not be assumed to generalize automatically across microscopes or sample preparation workflows.

Prediction quality can decrease when there is mismatch in:

- image brightness and contrast range,
- transmitted-light acquisition mode,
- camera settings,
- magnification and effective pixel size,
- cell type,
- optical alignment, or
- general image appearance relative to the training data.

In our experience, the model is particularly sensitive to **bright-field intensity range and contrast distribution**. Matching the microscope acquisition settings as closely as possible to the training data is therefore important.

## Recommended citation

Please cite both:

1. the original `pytorch_fnet` framework / Ounkomol *et al.* paper, and
2. this study, when using the shared Lamin B1 model or output examples.

## Suggested statement

> We share the study-specific Lamin B1 prediction model, training options, example bright-field / Lamin B1 image pairs, input CSV, batch inference commands, and example outputs used in this work. The model was built using the Allen Institute `pytorch_fnet` framework and was used in this study as a supporting step to predict Lamin B1-like nuclear-envelope structure from transmitted-light images. Because the trained model file exceeds GitHub’s standard repository file limits, the model weights are distributed separately as split GitHub Release assets linked from this repository.

## References

1. Ounkomol C, Seshamani S, Maleckar MM, Collman F, Johnson GR. *Label-free prediction of three-dimensional fluorescence images from transmitted-light microscopy*. Nature Methods. 2018;15:917-920.
