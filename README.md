# `create-gist.sh` 

A utility to create gists from command line

    usage:

        create-gist.sh /path/to/file Github_user_name

        or

        lsusb | create-gist.sh Github_user_name

        or 

        lsusb | create-gist.sh your_token


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
