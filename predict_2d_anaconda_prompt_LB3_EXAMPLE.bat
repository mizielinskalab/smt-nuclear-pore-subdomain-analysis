SET DATASET=LB3_005_All_mc256p512b4_SD2_n31000
SET ORDER=Model_prediction_01
SET DATASETCSV=csv_Model_prediction
SET N_IMAGES=120
SET MODEL_DIR=D:\Deep_learning_model\01-Model\%DATASET%
SET PATH_DATASET_CSV_TEST=D:\Deep_learning_model\03-Input-images-csv\input_location.csv
SET PATH_SAVE_DIR_TEST=D:\Deep_learning_model\04-Results\%ORDER%\
SET GPU_IDS=0

SET classD=TiffDataset
SET transformS=fnet.transforms.normalize
SET transformT=fnet.transforms.normalize

python D:\Deep_learnig\Softwares\Label_free_prediction\pytorch_fnet-release_1\predict.py --class_dataset %classD% --transform_signal %transformS% --transform_target %transformT% --path_model_dir %MODEL_DIR% --n_images %N_IMAGES% --gpu_ids %GPU_IDS% --path_dataset_csv %PATH_DATASET_CSV_TEST% --path_save_dir %PATH_SAVE_DIR_TEST%

