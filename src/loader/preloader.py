import sys

sys.path.append(".")
import argparse


GLOBAL_ARGS = {}


def main(event={}, context=None):
    pass


def my_argument_parser():
    parser = argparse.ArgumentParser(
        description="this script is for a lambda that serves as a precursor to a load of fresh data. we gather all the metadata and spin up all the temp tables for the load"
    )

    arg_group = parser.add_mutually_exclusive_group()
    arg_group.add_argument(
        "-dates",
        nargs=2,
        help="this is the main way of using this program. specify an interval of dates to use when scanning SL2 for files to upload",
    )
    arg_group.add_argument(
        "-dev",
        action="store_true",
        help="set DEV_MODE flag to help writing/debugging the program",
    )
