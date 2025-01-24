import os

if __name__ == "__main__":

    print('')
    print('Main script:')
    print('Experiment: {}'.format(os.environ.get('MLC_EXPERIMENT', '')))
    print('')

    exit(0)
