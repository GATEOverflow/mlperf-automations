from mlc import utils
import os


def preprocess(i):

    os_info = i['os_info']

    env = i['env']

    automation = i['automation']
    cm = automation.action_object

    # If windows, download here otherwise use run.sh
    if os_info['platform'] == 'windows':

        path = os.getcwd()

        clean_dirs = env.get('MLC_CLEAN_DIRS', '').strip()
        if clean_dirs != '':
            import shutil
            for cd in clean_dirs.split(','):
                if cd != '':
                    if os.path.isdir(cd):
                        print('Clearning directory {}'.format(cd))
                        shutil.rmtree(cd)

        url = env['MLC_PACKAGE_WIN_URL']

        urls = [url] if ';' not in url else url.split(';')

        print('')
        print('Current directory: {}'.format(os.getcwd()))

        for url in urls:

            url = url.strip()

            print('')
            print('Downloading from {}'.format(url))
            env['MLC_DAE_FINAL_ENV_NAME'] = 'FILENAME'
            env['MLC_OUTDIRNAME'] = os.getcwd()
            r = cm.access({'action': 'run',
                           'target': 'script',
                           'env': env,
                           'tags': 'download-and-extract,_extract',
                           'url': url})
            if r['return'] > 0:
                return r

        print('')

        # Add to path
        env['+PATH'] = [os.path.join(path, 'bin')]

    return {'return': 0}
