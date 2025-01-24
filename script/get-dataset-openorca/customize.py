from mlc import utils
import os
import shutil


def preprocess(i):

    env = i['env']

    return {'return': 0}


def postprocess(i):
    env = i['env']
    if env.get('MLC_DATASET_CALIBRATION', '') == "no":
        env['MLC_DATASET_PATH_ROOT'] = env['MLC_DATASET_OPENORCA_PATH']
        env['MLC_DATASET_PATH'] = env['MLC_DATASET_OPENORCA_PATH']
        env['MLC_DATASET_OPENORCA_PARQUET'] = os.path.join(
            env['MLC_DATASET_OPENORCA_PATH'], '1M-GPT4-Augmented.parquet')
    else:
        env['MLC_CALIBRATION_DATASET_PATH'] = os.path.join(
            os.getcwd(), 'install', 'calibration', 'data')

    return {'return': 0}
