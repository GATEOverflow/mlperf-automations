from mlc import utils
import os


def preprocess(i):

    os_info = i['os_info']

    env = i['env']

    env['MLC_TMP_PATH'] = os.path.join(os.getcwd(), 'install', 'bin')
    env['MLC_TMP_FAIL_IF_NOT_FOUND'] = 'yes'

    return {'return': 0}
