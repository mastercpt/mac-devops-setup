#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking tools"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  if ! has_command "watchman"; then
    e_pending "Installing watchman"
    brew install watchman
    test_command "watchman"
  fi
fi

if has_command "brew"; then
  if ! has_command "trash"; then
    e_pending "Installing trash"
    brew install trash
    test_command "trash"
  fi
fi

if has_command "brew"; then
  if ! has_command "git"; then
    get_consent "Install git"
    if has_consent; then
      e_pending "Installing git"
      brew install git
      test_command "git"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "zsh"; then
    get_consent "Install zsh"
    if has_consent; then
      e_pending "Installing zsh"
      brew install zsh
      test_command "zsh"
    fi
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "powerlevel10k"; then
    get_consent "Install powerlevel10k (CLI theming)"
    if has_consent; then
      e_pending "Installing powerlevel10k"
      brew install powerlevel10k
      echo '# Theme configuration: PowerLevel10K' >> ~/.zshrc
      echo 'source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
      echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
      echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
      test_brew "powerlevel10k"
      p10k configure
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    get_consent "Install zsh-autosuggestions"
    if has_consent; then
      e_pending "Installing zsh-autosuggestions"
      brew install zsh-autosuggestions
      echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
      test_brew "zsh-autosuggestions"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-syntax-highlighting"; then
    get_consent "Install zsh-syntax-highlighting"
    if has_consent; then
      e_pending "Installing zsh-syntax-highlighting"
      brew install zsh-syntax-highlighting
      echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc
      echo "# Warning: Must be last sourced!" >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
      test_brew "zsh-syntax-highlighting"
    fi
  fi
fi

if has_command "python"; then
  if ! has_command "python"; then
    get_consent "Install python"
    if has_consent; then
      e_pending "Installing python"
      brew install python
      test_command "python"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "vim"; then
    get_consent "Install vim"
    if has_consent; then
      e_pending "Installing vim"
      brew install vim
      test_command "vim"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "aws"; then
    get_consent "Install awscli"
    if has_consent; then
      e_pending "Installing awscli"
      brew install awscli
      test_command "aws"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "gh"; then
    get_consent "Install gh"
    if has_consent; then
      e_pending "Installing gh"
      brew install gh
      test_command "gh"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "wget"; then
    get_consent "Install wget"
    if has_consent; then
      e_pending "Installing wget"
      brew install wget
      test_command "wget"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "tree"; then
    get_consent "Install tree"
    if has_consent; then
      e_pending "Installing tree"
      brew install tree
      test_command "tree"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "groovy"; then
    get_consent "Install groovy"
    if has_consent; then
      e_pending "Installing groovy"
      brew install groovy
      test_command "groovy"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "curl"; then
    get_consent "Install curl"
    if has_consent; then
      e_pending "Installing curl"
      brew install curl
      test_command "curl"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "telnet"; then
    get_consent "Install telnet"
    if has_consent; then
      e_pending "Installing telnet"
      brew install telnet
      test_command "telnet"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "java"; then
    get_consent "Install openjdk"
    if has_consent; then
      e_pending "Installing openjdk"
      brew install openjdk
      sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
      test_command "java"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "ansible"; then
    get_consent "Install ansible"
    if has_consent; then
      e_pending "Installing ansible"
      brew install ansible
      test_command "ansible"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "ruby"; then
    get_consent "Install ruby"
    if has_consent; then
      e_pending "Installing ruby"
      brew install ruby
      test_command "ruby"
    fi
  fi
fi



# ------------------------------------------------------------------------------
e_message "Tools complete"
# ------------------------------------------------------------------------------
