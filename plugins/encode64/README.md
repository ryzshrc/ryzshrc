# encode64

Alias plugin for encoding or decoding using `base64` command.

To use it, add `encode64` to the plugins array in your zshrc file:

```zsh
plugins=(... encode64)
```

## Functions and Aliases

| Function       | Alias  | Description                            |
| -------------- | ------ | -------------------------------------- |
| `encode64`     | `e64`  | Encodes given data to base64           |
| `encodefile64` | `ef64` | Encodes given file's content to base64 |
| `decode64`     | `d64`  | Decodes given data from base64         |

## Usage and examples

### Encoding

- From parameter

  ```console
  $ encode64 "ry-zsh-rc"
  b2gtbXktenNo
  $ e64 "ry-zsh-rc"
  b2gtbXktenNo
  ```

- From piping

  ```console
  $ echo "ry-zsh-rc" | encode64
  b2gtbXktenNo==
  $ echo "ry-zsh-rc" | e64
  b2gtbXktenNo==
  ```

### Encoding a file

Encode a file's contents to base64 and save output to text file.
**NOTE:** Takes provided file and saves encoded content as new file with `.txt` extension

- From parameter

  ```console
  $ encodefile64 ryzshrc.icn
  ryzshrc.icn's content encoded in base64 and saved as ryzshrc.icn.txt
  $ ef64 "ry-zsh-rc"
  ryzshrc.icn's content encoded in base64 and saved as ryzshrc.icn.txt
  ```

### Decoding

- From parameter

  ```console
  $ decode64 b2gtbXktenNo
  ry-zsh-rc%
  $ d64 b2gtbXktenNo
  ry-zsh-rc%
  ```

- From piping

  ```console
  $ echo "b2gtbXktenNoCg==" | decode64
  ry-zsh-rc
  $ echo "b2gtbXktenNoCg==" | d64
  ry-zsh-rc
  ```
