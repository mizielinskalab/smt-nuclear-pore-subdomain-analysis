@echo off
REM Portable template. Edit these paths for your own machine.

SET REPO_ROOT=%~dp0
SET DATASET=LB3_005_All_mc256p512b4_SD2_n31000
SET ORDER=Model_prediction_01
SET N_IMAGES=120

REM Set this to your local pytorch_fnet installation
SET FNET_ROOT=C:\path\to\pytorch_fnet-release_1

SET MODEL_DIR=%REPO_ROOT%01-Model\%DATASET%
SET PATH_DATASET_CSV_TEST=%REPO_ROOT%03-Input-images-csv\input_location.csv
SET PATH_SAVE_DIR_TEST=%REPO_ROOT%04-Results\%ORDER%\
SET GPU_IDS=0

SET classD=TiffDataset
SET transformS=fnet.transforms.normalize
SET transformT=fnet.transforms.normalize

python %FNET_ROOT%\predict.py --class_dataset %classD% --transform_signal %transformS% --transform_target %transformT% --path_model_dir %MODEL_DIR% --n_images %N_IMAGES% --gpu_ids %GPU_IDS% --path_dataset_csv %PATH_DATASET_CSV_TEST% --path_save_dir %PATH_SAVE_DIR_TEST%
