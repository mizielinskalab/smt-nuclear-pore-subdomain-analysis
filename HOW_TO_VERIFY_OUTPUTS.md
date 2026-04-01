# How to verify the shared outputs

The shared example outputs can be checked directly without retraining the model.

## Running the example inference

For rerunning the example prediction workflow on Windows, open **Anaconda Prompt**, activate the `fnet` environment, and then run `predict_2d_anaconda_prompt_LB3.bat`. The batch file is intended for **Anaconda Prompt** rather than a standard Command Prompt.

## Quick check

1. Open `03-Input-images-csv/input_location.csv`.
2. Confirm that each row links a bright-field input (`path_signal`) to a Lamin B1 fluorescence image (`path_target`).
3. Open `04-Results/Model_prediction_01/predictions.csv`.
4. Pick a numbered output folder, for example `04-Results/Model_prediction_01/00/`.
5. Compare:
   - `signal.tiff` = bright-field input
   - `prediction_LB3_005_All_mc256p512b4_SD2_n31000.tiff` = processed prediction
   - `prediction_LB3_005_All_mc256p512b4_SD2_n31000_unpropped.tiff` = unprocessed saved prediction
   - `target.tiff` = measured Lamin B1 fluorescence target

## What should match

- The `signal.tiff` in the output folder should correspond to the `path_signal` entry in the CSV.
- The `target.tiff` in the output folder should correspond to the `path_target` entry in the CSV.
- The prediction should reproduce nuclear-envelope-like Lamin B1 structure better than the bright-field image alone, although accuracy will vary across fields.

## What this does and does not prove

This check verifies that:

- the repository structure is internally consistent,
- the input-to-output mapping is traceable,
- the saved outputs correspond to the listed inputs.

This check does **not** by itself prove full model generalization across microscopes or cell types.

## Restoring the split model archive

If the model weights are distributed as `model.zip.001` to `model.zip.004`, place all four files in the same folder and extract only `model.zip.001` with 7-Zip or WinRAR; the archive tool should automatically reconstruct the full archive.
