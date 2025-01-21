# environment

Working environment included fonts, presets and must be have programs.

1. Install fonts.
2. In the terminal settings general tab change `shells open with` from `default` to `command` and change `/bin/zsh` to `/usr/local/bin/bash`.
3. Import `Basic.terminal` profile.
4. Execute `sudo vi /etc/shells` and add `/usr/local/bin/bash` to the list.
5. Execute `chsh -s /usr/local/bin/bash username` and restart terminal.
