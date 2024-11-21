# Konfigurasi zstyle untuk Git
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%B%F{blue}[%b]%f %F{yellow}⇡%p⇣%P%f %F{red}🚀%c%f%B'
zstyle ':vcs_info:git:*' actionformats '%B%F{red}[%b|%a]%f%B'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%B%F{green}●%f%B'
zstyle ':vcs_info:*' unstagedstr '%B%F{red}✗%f%B'
zstyle ':vcs_info:*' cleanstr '%B%F{cyan}✓%f%B'

autoload -Uz vcs_info

# Fungsi untuk informasi Git yang lebih detail
git_status() {
    vcs_info
    local git_changes=""
    
    # Pastikan hanya dijalankan di direktori Git
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # Cabang Git
        if [[ -n $vcs_info_msg_0_ ]]; then
            git_changes="%B$vcs_info_msg_0_%B"
        fi
        
        # Status perubahan (staged dan unstaged)
        local git_status_raw=$(git status --porcelain 2>/dev/null)
        if [[ -n $git_status_raw ]]; then
            local staged=$(echo "$git_status_raw" | grep -E '^[A-Z]' | wc -l)
            local unstaged=$(echo "$git_status_raw" | grep -E '^.[A-Z]' | wc -l)
            [[ $staged -gt 0 ]] && git_changes+=" %B%F{green}●$staged%f%B"
            [[ $unstaged -gt 0 ]] && git_changes+=" %B%F{red}✗$unstaged%f%B"
        fi

        # Push dan pull hanya jika ada perubahan
        local push_count=$(git rev-list @{u}..HEAD 2>/dev/null | wc -l)
        local pull_count=$(git rev-list HEAD..@{u} 2>/dev/null | wc -l)
        [[ $push_count -gt 0 ]] && git_changes+=" %B%F{yellow}⇡$push_count%f%B"
        [[ $pull_count -gt 0 ]] && git_changes+=" %B%F{yellow}⇣$pull_count%f%B"
    fi

    echo "$git_changes"
}

# Variabel global untuk mencatat waktu
LASTSECONDS=$SECONDS
STARTTIME=0

# Fungsi precmd untuk reset waktu dan menampilkan informasi
precmd() {
    # Reset waktu untuk perintah berikutnya
    local elapsed=$((SECONDS - LASTSECONDS))
    LASTSECONDS=$SECONDS

    # Tampilkan direktori kerja selalu
    print -Pn "%B%F{cyan}%~%f%B" # Direktori saat ini
    # Tambahkan informasi Git hanya jika ada
    local git_info=$(git_status)
    if [[ -n $git_info ]]; then
        print -Pn " $git_info"
    fi
    print -Pn "\n"
}

# Fungsi preexec untuk mencatat waktu mulai eksekusi perintah
preexec() {
    STARTTIME=$SECONDS
}

# Fungsi untuk menghitung waktu dinamis di RPROMPT
function format_time {
    local elapsed=0
    if ((STARTTIME > 0)); then
        elapsed=$((SECONDS - STARTTIME))
    else
        elapsed=$((SECONDS - LASTSECONDS))
    fi

    local hours=$((elapsed / 3600))
    local minutes=$(((elapsed % 3600) / 60))
    local seconds=$((elapsed % 60))

    if ((hours > 0)); then
        echo "%B${hours}h ${minutes}m ${seconds}s%B"
    elif ((minutes > 0)); then
        echo "%B${minutes}m ${seconds}s%B"
    else
        echo "%B${seconds}s%B"
    fi
}

# Fungsi untuk mengubah warna prompt berdasarkan status exit
function set_prompt_color {
    if [[ $? -eq 0 ]]; then
        PROMPT='%B%F{green}%M%f %# %B'
    else
        PROMPT='%B%F{red}%M%f %# %B'
    fi
}

# Tambahkan ke `precmd_functions` dan `preexec_functions`
precmd_functions+=(set_prompt_color)
preexec_functions+=(preexec)

# Right Prompt (RPROMPT)
RPROMPT='$(format_time)'

# Konfigurasi tambahan
autoload -Uz colors && colors
setopt prompt_subst
