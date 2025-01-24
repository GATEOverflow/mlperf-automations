from mlc import utils
import os


def preprocess(i):

    os_info = i['os_info']

    env = i['env']

    meta = i['meta']

    automation = i['automation']

    quiet = (env.get('MLC_QUIET', False) == 'yes')

    if env.get("MLC_CALIBRATE_FILTER", "") == "yes":
        i['run_script_input']['script_name'] = "run-filter"
        env['MLC_MLPERF_OPENIMAGES_CALIBRATION_FILTERED_LIST'] = os.path.join(
            os.getcwd(), "filtered.txt")
        env['MLC_MLPERF_OPENIMAGES_CALIBRATION_LIST_FILE_WITH_PATH'] = env['MLC_MLPERF_OPENIMAGES_CALIBRATION_FILTERED_LIST']

    return {'return': 0}


def postprocess(i):

    env = i['env']

    return {'return': 0}
