part = {
    'name': 'create config files',
    'steps': [
        {
            'name': 'back up previous files and link new files',
            'instructions': [
                {'arguments': [
                    'mkdir -p ~/.config-old',

                    'mv ~/.minttyrc ~/.config-old/.minttyrc',
                    'mv ~/.zshrc ~/.config-old/.zshrc',
                    'rm -rf ~/.ssh',

                    'ln -s ~/unix-setup/src/files-to-copy/.antigen ~/.antigen',
                    'ln -s ~/unix-setup/src/files-to-copy/.minttyrc ~/.minttyrc',
                    'ln -s ~/unix-setup/src/files-to-copy/.ssh ~/.ssh',
                    'ln -s ~/unix-setup/src/files-to-copy/.tmux.conf ~/.tmux.conf',
                    'ln -s ~/unix-setup/src/files-to-copy/.vimrc ~/.vimrc',
                    'ln -s ~/unix-setup/src/files-to-copy/.zshrc ~/.zshrc',

                    'alias explore="./~/unix-setup/src/files-to-copy/explore.bash"']}]}]}
