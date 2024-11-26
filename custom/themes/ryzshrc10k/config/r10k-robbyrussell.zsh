# Config file for Ryzshrc10k with the style of robbyrussell theme from Oh My Zsh.
#
# Original: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell.
#
# Replication of robbyrussell theme is exact. The only observable difference is in
# performance. Ryzshrc10k prompt is very fast everywhere, even in large Git repositories.
#
# Usage: Source this file either before or after loading Ryzshrc10k.
#
#   source ~/ryzshrc10k/config/r10k-robbyrussell.zsh
#   source ~/ryzshrc10k/ryzshrc10k.zsh-theme

# Temporarily change options.
'builtin' 'local' '-a' 'r10k_config_opts'
[[ ! -o 'aliases'         ]] || r10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || r10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || r10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(RYZSHRC9K_*|DEFAULT_USER)~RYZSHRC9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # Left prompt segments.
  typeset -g RYZSHRC9K_LEFT_PROMPT_ELEMENTS=(prompt_char dir vcs)
  # Right prompt segments.
  typeset -g RYZSHRC9K_RIGHT_PROMPT_ELEMENTS=()

  # Basic style options that define the overall prompt look.
  typeset -g RYZSHRC9K_BACKGROUND=                            # transparent background
  typeset -g RYZSHRC9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
  typeset -g RYZSHRC9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
  typeset -g RYZSHRC9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol
  typeset -g RYZSHRC9K_VISUAL_IDENTIFIER_EXPANSION=           # no segment icons

  # Green prompt symbol if the last command succeeded.
  typeset -g RYZSHRC9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=green
  # Red prompt symbol if the last command failed.
  typeset -g RYZSHRC9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=red
  # Prompt symbol: bold arrow.
  typeset -g RYZSHRC9K_PROMPT_CHAR_CONTENT_EXPANSION='%B➜ '

  # Cyan current directory.
  typeset -g RYZSHRC9K_DIR_FOREGROUND=cyan
  # Show only the last segment of the current directory.
  typeset -g RYZSHRC9K_SHORTEN_STRATEGY=truncate_to_last
  # Bold directory.
  typeset -g RYZSHRC9K_DIR_CONTENT_EXPANSION='%B$P9K_CONTENT'

  # Git status formatter.
  function my_git_formatter() {
    emulate -L zsh
    if [[ -n $P9K_CONTENT ]]; then
      # If P9K_CONTENT is not empty, it's either "loading" or from vcs_info (not from
      # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
      typeset -g my_git_format=$P9K_CONTENT
    else
      # Use VCS_STATUS_* parameters to assemble Git status. See reference:
      # https://github.com/ryzshrc/gitstatus/blob/master/gitstatus.plugin.zsh.
      typeset -g my_git_format="${1+%B%4F}git:(${1+%1F}"
      my_git_format+=${${VCS_STATUS_LOCAL_BRANCH:-${VCS_STATUS_COMMIT[1,8]}}//\%/%%}
      my_git_format+="${1+%4F})"
      if (( VCS_STATUS_NUM_CONFLICTED || VCS_STATUS_NUM_STAGED ||
            VCS_STATUS_NUM_UNSTAGED   || VCS_STATUS_NUM_UNTRACKED )); then
        my_git_format+=" ${1+%3F}✗"
      fi
    fi
  }
  functions -M my_git_formatter 2>/dev/null

  # Disable the default Git status formatting.
  typeset -g RYZSHRC9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  # Install our own Git status formatter.
  typeset -g RYZSHRC9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
  typeset -g RYZSHRC9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  # Grey Git status when loading.
  typeset -g RYZSHRC9K_VCS_LOADING_FOREGROUND=246

  # Instant prompt mode.
  #
  #   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
  #              it incompatible with your zsh configuration files.
  #   - quiet:   Enable instant prompt and don't print warnings when detecting console output
  #              during zsh initialization. Choose this if you've read and understood
  #              https://github.com/ryzshrc/ryzshrc10k#instant-prompt.
  #   - verbose: Enable instant prompt and print a warning when detecting console output during
  #              zsh initialization. Choose this if you've never tried instant prompt, haven't
  #              seen the warning, or if you are unsure what this all means.
  typeset -g RYZSHRC9K_INSTANT_PROMPT=verbose

  # Hot reload allows you to change RYZSHRC9K options after Ryzshrc10k has been initialized.
  # For example, you can type RYZSHRC9K_BACKGROUND=red and see your prompt turn red. Hot reload
  # can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
  # really need it.
  typeset -g RYZSHRC9K_DISABLE_HOT_RELOAD=true

  # If r10k is already loaded, reload configuration.
  # This works even with RYZSHRC9K_DISABLE_HOT_RELOAD=true.
  (( ! $+functions[r10k] )) || r10k reload
}

# Tell `r10k configure` which file it should overwrite.
typeset -g RYZSHRC9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#r10k_config_opts} )) && setopt ${r10k_config_opts[@]}
'builtin' 'unset' 'r10k_config_opts'
