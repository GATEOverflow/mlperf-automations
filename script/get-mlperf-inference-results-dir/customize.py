from mlc import utils
import os


def preprocess(i):

    os_info = i['os_info']

    env = i['env']

    meta = i['meta']

    automation = i['automation']

    quiet = (env.get('MLC_QUIET', False) == 'yes')

    if env.get('MLC_MLPERF_INFERENCE_RESULTS_DIR', '') == '':
        env['MLC_MLPERF_INFERENCE_RESULTS_DIR'] = os.getcwd()

    return {'return': 0}


def postprocess(i):

    env = i['env']

    env['MLC_GET_DEPENDENT_CACHED_PATH'] = env['MLC_MLPERF_INFERENCE_RESULTS_DIR']

    return {'return': 0}
