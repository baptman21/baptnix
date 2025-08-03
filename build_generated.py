import json
import os
import subprocess


def main():
    OUTPUTS_PATH = (
        "nixosConfigurations.whirlwind.config.home-manager.users.baptman.bapt.outputs"
    )
    p = subprocess.run(
        args=["nix", "eval", "--impure", "--json", f"{os.getcwd()}#{OUTPUTS_PATH}"],
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

    for output in outputs:
        print(output)


if __name__ == "__main__":
    main()
