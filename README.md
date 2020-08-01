# `create-gist.sh` 

A utility to create gists from command line

    usage:

        create-gist.sh /path/to/file your_token

        or 

        lsusb | create-gist.sh your_token

    If no token is passed and /home/ceremcem/.create-gist.cfg is found,
    contents of config file is used as the token, so 
    the usage becomes:

        lsusb | create-gist.sh

        or 

        create-gist.sh /path/to/file 


# Creating OAuth token

1. Go to https://github.com/settings/tokens/new
2. Generate a new token with `gist` (`create gist`) permission.
3. Use the token for authentication: 


    lsusb | create-gist.sh your-token-here


4. Optionally save your token to `~/.create-gist.cfg` file. 

# Dependencies 

* `curl`

```bash
apt-get install curl
```
