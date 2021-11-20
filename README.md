## repgrep - repeated grep
`repgrep` automates your `grep` command and will run your command every X seconds.

Just change your `grep` command to `repgrep` and add the -rep X flag.

# Example
![repgrep](https://user-images.githubusercontent.com/5290591/142718362-c57f2939-a184-4a96-993b-2099d6a4f693.jpg)

# Usage
- Set alias for `repgrep`, such as: alias repgrep='~/repgrep/repgrep.sh'.
- Set the script full permissions using chmod
- Use `repgrep` command instead of `grep`. add -rep for setting the interval (default is 10sec)
  - i.e. repgrep "/share/xorg" ../ -r -rep 3

# Contribution
Just go for it.

