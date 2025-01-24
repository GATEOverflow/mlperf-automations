from mlc import utils
import os


def preprocess(i):

    os_info = i['os_info']

    env = i['env']

    meta = i['meta']

    automation = i['automation']

    quiet = (env.get('MLC_QUIET', False) == 'yes')

    if env.get('MLC_RCLONE_CONFIG_CMD', '') != '':
        env['MLC_RUN_CMD'] = env['MLC_RCLONE_CONFIG_CMD']

    return {'return': 0}


def postprocess(i):

    env = i['env']

    return {'return': 0}
