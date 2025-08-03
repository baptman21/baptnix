import json
import os
from os.path import exists
import subprocess
import argparse
from dataclasses import dataclass

from typing import Dict
from pathlib import Path
import shutil


@dataclass
class Output:
    target: str
    source: str


def get_outputs(target: str, flake_path: str) -> Dict[str, Output]:
    p = subprocess.run(
        args=["nix", "eval", "--impure", "--json", f"{flake_path}#{target}"],
        stderr=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    try:
        p.check_returncode()
    except subprocess.CalledProcessError as e:
        print("Got the following")
        print(e.stderr.decode("utf-8"))
        raise e

    outputs = json.loads(p.stdout.decode("utf-8"))

    t = type(outputs)
    if t is not dict:
        raise TypeError(
            f"Got invalid type of target evalutation: got {t} expected dict"
        )

    out: Dict[str, Output] = dict()
    for key, value in outputs.items():
        out[key] = Output(target=value["target"], source=value["source"])

    return out


def copy_outputs(outputs: Dict[str, Output], dest: Path):
    if dest.exists():
        shutil.rmtree(dest)
    os.makedirs(dest)

    for output in outputs.values():
        file = dest.joinpath(output.target)
        os.makedirs(file.parent, exist_ok=True)
        shutil.copy2(output.source, file)
        os.chmod(file, 0o640)


def main():
    parser = argparse.ArgumentParser(
        prog="build_generated",
        description="Build generated folder base of outputs from the flake. The flake outputs are defined at modules/home/bapt/default.nix",
    )
    parser.add_argument("-F", "--flake-path", dest="flake_path", default=os.getcwd())
    parser.add_argument("target")
    parser.add_argument("output")
    parser.add_argument("-d", "--delete", action="store_true", default=False)
    args = parser.parse_args()

    outputs = get_outputs(args.target, args.flake_path)
    copy_outputs(outputs, Path(args.output))


if __name__ == "__main__":
    main()
