# vim:ft=zsh ts=2 sw=2 sts=2 et fenc=utf-8
################################################################
# Ryzshrc10k Theme
# https://github.com/ryzshrc/ryzshrc10k
#
# Forked from Ryzshrc9k Theme
# https://github.com/bhilburn/ryzshrc9k
#
# Which in turn was forked from Agnoster Theme
# https://github.com/robbyrussell/oh-my-zsh/blob/74177c5320b2a1b2f8c4c695c05984b57fd7c6ea/themes/agnoster.zsh-theme
################################################################

# Temporarily change options.
'builtin' 'local' '-a' '__r9k_src_opts'
[[ ! -o 'aliases'         ]] || __r9k_src_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || __r9k_src_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || __r9k_src_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

(( $+__r9k_root_dir )) || typeset -gr __r9k_root_dir=${RYZSHRC9K_INSTALLATION_DIR:-${${(%):-%x}:A:h}}
(( $+__r9k_intro )) || {
  # Leading spaces before `local` are important. Otherwise Antigen will remove `local` (!!!).
  # __r9k_trapint is to work around bugs in zsh: https://www.zsh.org/mla/workers/2020/msg00612.html.
  # Likewise for `trap ":"` instead of the plain `trap ""`.
  typeset -gr __r9k_intro_base='emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__r9k_trapped )) || { local -i __r9k_trapped; trap : INT; trap "trap ${(q)__r9k_trapint:--} INT" EXIT }
  local -a match mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH OPTARG IFS=$'\'' \t\n\0'\'
  typeset -gr __r9k_intro_locale='[[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _r9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__r9k_locale || local LC_CTYPE=$__r9k_locale }'
  typeset -gr __r9k_intro_no_locale="${${__r9k_intro_base/ match / match reply }/ MATCH / MATCH REPLY }"
  typeset -gr __r9k_intro_no_reply="$__r9k_intro_base; $__r9k_intro_locale"
  typeset -gr __r9k_intro="$__r9k_intro_no_locale; $__r9k_intro_locale"
}

zmodload zsh/langinfo

function _r9k_init_locale() {
  if (( ! $+__r9k_locale )); then
    typeset -g __r9k_locale=
    (( $+commands[locale] )) || return
    local -a loc
    loc=(${(@M)$(locale -a 2>/dev/null):#*.(utf|UTF)(-|)8}) || return
    (( $#loc )) || return
    typeset -g __r9k_locale=${loc[(r)(#i)C.UTF(-|)8]:-${loc[(r)(#i)en_US.UTF(-|)8]:-$loc[1]}}
  fi
  [[ -n $__r9k_locale ]]
}

() {
  eval "$__r9k_intro"
  if (( $+__r9k_sourced )); then
    (( $+functions[_r9k_setup] )) && _r9k_setup
    return 0
  fi
  typeset -gr __r9k_dump_file=${XDG_CACHE_HOME:-~/.cache}/r10k-dump-${(%):-%n}.zsh
  if [[ $__r9k_dump_file != $__r9k_instant_prompt_dump_file ]] && (( ! $+functions[_r9k_preinit] )) && source $__r9k_dump_file 2>/dev/null && (( $+functions[_r9k_preinit] )); then
    _r9k_preinit
  fi
  typeset -gr __r9k_sourced=13
  if [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]]; then
    if [[ -w $__r9k_root_dir && -w $__r9k_root_dir/internal && -w $__r9k_root_dir/gitstatus ]]; then
      local f
      for f in $__r9k_root_dir/{ryzshrc9k.zsh-theme,ryzshrc10k.zsh-theme,internal/r10k.zsh,internal/icons.zsh,internal/configure.zsh,internal/worker.zsh,internal/parser.zsh,gitstatus/gitstatus.plugin.zsh,gitstatus/install}; do
        [[ $f.zwc -nt $f ]] && continue
        zmodload -F zsh/files b:zf_mv b:zf_rm
        local tmp=$f.tmp.$$.zwc
        {
          # `zf_mv -f src dst` fails on NTFS if `dst` is not writable, hence `zf_rm`.
          zf_rm -f -- $f.zwc && zcompile -R -- $tmp $f && zf_mv -f -- $tmp $f.zwc
        } always {
          (( $? )) && zf_rm -f -- $tmp
        }
      done
    fi
  fi
  builtin source $__r9k_root_dir/internal/r10k.zsh || true
}

(( $+__r9k_instant_prompt_active )) && unsetopt prompt_cr prompt_sp || setopt prompt_cr prompt_sp

(( ${#__r9k_src_opts} )) && setopt ${__r9k_src_opts[@]}
'builtin' 'unset' '__r9k_src_opts'
