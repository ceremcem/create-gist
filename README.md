# `create-gist.sh` 

A utility to create gists from command line

    usage:

        $(basename $0) /path/to/file Github_user_name

        or

        lsusb | $(basename $0) Github_user_name

        or 

        lsusb | $(basename $0) your_token

    If no credential is passed and $config_file is found, 
    contents of config file is used. 

# Creating OAuth token

1. Go to https://github.com/settings/tokens/new and generate a new token with `create gist` permission.
2. Use the token for authentication: 

```
lsusb | create-gist.sh your-token-here
```


# Dependencies 

* `curl`

```bash
apt-get install curl
```
