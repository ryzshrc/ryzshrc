function svn_prompt_info() {
  local info
  info=$(LANG= svn info 2>&1) || return 1 # capture stdout and stderr
  local repo_need_upgrade=$(svn_repo_need_upgrade $info)

  if [[ -n $repo_need_upgrade ]]; then
    printf '%s%s%s%s%s%s%s\n' \
      "$ZSH_PROMPT_BASE_COLOR" \
      "$ZSH_THEME_SVN_PROMPT_PREFIX" \
      "$ZSH_PROMPT_BASE_COLOR" \
      "$repo_need_upgrade" \
      "$ZSH_PROMPT_BASE_COLOR" \
      "$ZSH_THEME_SVN_PROMPT_SUFFIX" \
      "$ZSH_PROMPT_BASE_COLOR"
  else
    printf '%s%s%s%s %s%s%s:%s%s%s%s' \
      "$ZSH_PROMPT_BASE_COLOR" \
      "$ZSH_THEME_SVN_PROMPT_PREFIX" \
      "$(svn_status_info $info)" \
      "$ZSH_PROMPT_BASE_COLOR" \
      \
      "$ZSH_THEME_BRANCH_NAME_COLOR" \
      "${$(svn_current_branch_name $info):gs/%/%%}" \
      "$ZSH_PROMPT_BASE_COLOR" \
      \
      "$(svn_current_revision $info)" \
      "$ZSH_PROMPT_BASE_COLOR" \
      "$ZSH_THEME_SVN_PROMPT_SUFFIX" \
      "$ZSH_PROMPT_BASE_COLOR"
  fi
}

function svn_repo_need_upgrade() {
  command grep -q "E155036" <<< "${1:-$(LANG= svn info 2>/dev/null)}" && \
    echo "E155036: upgrade repo with svn upgrade"
}

function svn_current_branch_name() {
  ryz_urldecode "$(
    command grep '^URL:' <<< "${1:-$(svn info 2>/dev/null)}" | command grep -Eo '(tags|branches)/[^/]+|trunk'
  )"
}

function svn_repo_root_name() {
  command grep '^Repository\ Root:' <<< "${1:-$(LANG= svn info 2>/dev/null)}" | sed 's#.*/##'
}

function svn_current_revision() {
  echo "${1:-$(LANG= svn info 2>/dev/null)}" | sed -n 's/Revision: //p'
}

function svn_status_info() {
  local svn_status_string="$ZSH_THEME_SVN_PROMPT_CLEAN"
  local svn_status="$(svn status 2>/dev/null)";
  if command grep -E '^\s*A' &>/dev/null <<< "$svn_status"; then
    svn_status_string+="${ZSH_THEME_SVN_PROMPT_ADDITIONS:-+}"
  fi
  if command grep -E '^\s*D' &>/dev/null <<< "$svn_status"; then
    svn_status_string+="${ZSH_THEME_SVN_PROMPT_DELETIONS:-✖}"
  fi
  if command grep -E '^\s*M' &>/dev/null <<< "$svn_status"; then
    svn_status_string+="${ZSH_THEME_SVN_PROMPT_MODIFICATIONS:-✎}"
  fi
  if command grep -E '^\s*[R~]' &>/dev/null <<< "$svn_status"; then
    svn_status_string+="${ZSH_THEME_SVN_PROMPT_REPLACEMENTS:-∿}"
  fi
  if command grep -E '^\s*\?' &>/dev/null <<< "$svn_status"; then
    svn_status_string+="${ZSH_THEME_SVN_PROMPT_UNTRACKED:-?}"
  fi
  if command grep -E '^\s*[CI!L]' &>/dev/null <<< "$svn_status"; then
    svn_status_string+="${ZSH_THEME_SVN_PROMPT_DIRTY:-!}"
  fi
  echo $svn_status_string
}
