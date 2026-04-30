#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Lookup Ref-PYTHON-COLOR-TRY1
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description trying to get colored output with my lookref script by changing to PYTHON instead of sh

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

print("Hello World!")


# add more basic/common imports to this template as needed
import argparse
import logging
import sys
# S3 Imports
from base import system
from s3 import types as s3_types
from base import import_install
from s3 import s3_globals

# General Imports
import io 
import os
from datetime import date

import_install.install_if_not_already("colorama")
from colorama import init as colorama_init
colorama_init()
from colorama import Fore, Back, Style

string_stream = io.StringIO("")

#########################
# SETUP / VARIABLES DEF #
#########################
prod_tagging = "tagging"
prod_scadasdk = "scadasdk"
prod_openscada = "openscada"
prod_scadainterface = "scadainterface"
prod_viewpoint = "viewpoint"
prod_otsfw = "otsfw"
prod_webcomponents = "webcomponents"
prod_securesync = "securesync"

tagging = "rel/1_trunk"
scadasdk = "rel/4_trunk"
openscada = "rel/10_trunk"
scadainterface = "rel/7_trunk"
viewpoint = "rel/4_trunk"
otsfw = "rel/5_trunk"
webcomponents = "rel/2_trunk"
securesync = "rel/1_trunk"

def setup_logging():
    """Configure logging for the script."""
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(levelname)s - %(message)s",
        handlers=[
            logging.StreamHandler(sys.stdout)
        ]
    )

def parse_arguments():
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(description="Describe what this script does.")
    parser.add_argument(
        "--input",
        type=str,
        required=False,
        help="Path to the input file (optional)."
    )
    parser.add_argument(
        "--output",
        type=str,
        required=False,
        help="Path to the output file (optional)."
    )
    return parser.parse_args()


#####################
# FUNCTIONS/HELPERS #
#####################
def myFunc():
    """Example function to demonstrate structure."""
    # print(Fore.LIGHTCYAN_EX + f"{prod_openscada + ' :::> ' + openscada}" + Style.RESET_ALL)

    # logging.info("This is an example function.")
    # Add your function logic here
    print(Fore.LIGHTMAGENTA_EX + f"{'12.1_TRUNKS_FOR_EACH_PRODUCT:'}" + Style.RESET_ALL)
    # print("12.1 TRUNKS FOR EACH PRODUCT:")

    # print statement without creating a new line
    print(prod_tagging + "\t\t", end='')
    print(Fore.YELLOW + f"{tagging}✅" + Style.RESET_ALL)

    print(prod_scadasdk + "\t", end='')
    print(Fore.LIGHTCYAN_EX + f"{scadasdk}" + Style.RESET_ALL)

    print(prod_openscada + "\t", end='')
    print(Fore.YELLOW + f"{openscada}" + Style.RESET_ALL)

    print(prod_scadainterface + "\t", end='')
    print(Fore.LIGHTCYAN_EX + f"{scadainterface}" + Style.RESET_ALL)

    print(prod_viewpoint + "\t", end='')
    print(Fore.YELLOW + f"{viewpoint}" + Style.RESET_ALL)

    print(prod_otsfw + "\t\t", end='')
    print(Fore.LIGHTCYAN_EX + f"{otsfw}" + Style.RESET_ALL)

    print(prod_webcomponents + "\t", end='')
    print(Fore.YELLOW + f"{webcomponents}" + Style.RESET_ALL) 

    print(prod_securesync + "\t", end='')
    print(Fore.LIGHTCYAN_EX + f"{securesync}" + Style.RESET_ALL)

    # print(prod_openscada + " " + openscada)
    # print(prod_otsfw + " " + otsfw)
    # print(prod_scadasdk + " " + scadasdk)
    # print(prod_scadainterface + " " + scadainterface)
    # print(prod_webcomponents + " " + webcomponents)
    # print(prod_securesync + " " + securesync)
    # print(prod_tagging + " " + tagging)
    # print(prod_viewpoint + " " + viewpoint)

    # free_gb = 123.45
    # print(Fore.GREEN + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.BLUE + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.MAGENTA + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.LIGHTGREEN_EX + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.YELLOW + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.CYAN + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.LIGHTBLUE_EX + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.LIGHTCYAN_EX + f"{free_gb} GB" + Style.RESET_ALL)
    # print(Fore.LIGHTMAGENTA_EX + f"{free_gb} GB" + Style.RESET_ALL)


'''
list = 

[head] -> [50] -> [30] -> [15] -> [7] -> 

[head] -> [7] -> [15] -> [30] -> [50] -> 


'''


#################################################
# Main function to encapsulate the script logic #
#################################################
def main():
    """Main function."""
    setup_logging()
    args = parse_arguments()

    # logging.info("Script started.")
    
    # Example usage of arguments
    if args.input:
        logging.info(f"Input file: {args.input}")
    if args.output:
        logging.info(f"Output file: {args.output}")

    # TODO: Add your script logic here (aka func calls)
    myFunc()

    # logging.info("Script finished.")

if __name__ == "__main__":
    main()


