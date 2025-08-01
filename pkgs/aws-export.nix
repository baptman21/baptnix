{ pkgs, ... }: {
  # Simple exporter to
  awse = pkgs.writeShellScriptBin "aws-export.sh" ''
    REGION="$(${pkgs.fzf}/bin/fzf --prompt "Region: " <<EOL | tr -d ' '
      us-east-1
      us-east-2
      us-west-1
      us-west-2
      af-south-1
      ap-east-1
      ap-south-2
      ap-southeast-3
      ap-southeast-5
      ap-southeast-4
      ap-south-1
      ap-northeast-3
      ap-northeast-2
      ap-southeast-1
      ap-southeast-2
      ap-east-2
      ap-southeast-7
      ap-northeast-1
      ca-central-1
      ca-west-1
      eu-central-1
      eu-west-1
      eu-west-2
      eu-south-1
      eu-west-3
      eu-south-2
      eu-north-1
      eu-central-2
      il-central-1
      mx-central-1
      me-south-1
      me-central-1
      sa-east-1
    EOL
    )"
    PROFILE="$(${pkgs.awscli2}/bin/aws configure list-profiles | ${pkgs.fzf}/bin/fzf --prompt "Profile: " | tr -d ' ')"
    export AWS_PROFILE="$PROFILE"
    export AWS_DEFAULT_PROFILE="$AWS_PROFILE"
    export AWS_REGION="$REGION"

    print -s $(echo "export AWS_PROFILE=$PROFILE && export AWS_DEFAULT_PROFILE=$PROFILE && export AWS_REGION=$REGION && echo awse")
  '';

  awsu = pkgs.writeShellScriptBin "aws-unset.sh" ''
    unset AWS_PROFILE
    unset AWS_REGION
    unset AWS_DEFAULT_PROFILE
  '';
}
