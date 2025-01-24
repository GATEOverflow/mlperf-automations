import os

if __name__ == "__main__":

    print('')
    print('Main script:')
    print('ENV MLC_VAR1: {}'.format(os.environ.get('MLC_VAR1', '')))
    print('')

    exit(0)
