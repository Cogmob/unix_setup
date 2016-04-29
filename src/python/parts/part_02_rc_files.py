part = {
    'name': 'create config files',
    'steps': [
        {
            'name': 'back up previous files and link new files',
            'instructions': [
                {'arguments': ['mv ~/.zshrc ~/.zshrc.old']},
                {'arguments': ['mv ~/.minttyrc ~/.minttyrc.old']},
                {'arguments': ['mv ~/.antigen ~/.anitgen.old']},

                {'arguments': ['ln -s ~/unix-setup/files-to-copy/.antigen ~/.antigen']},
                {'arguments': ['ln -s ~/unix-setup/files-to-copy/.minttyrc ~/.minttyrc']},
                {'arguments': ['ln -s ~/unix-setup/files-to-copy/.ssh ~/.ssh']},
                {'arguments': ['ln -s ~/unix-setup/files-to-copy/.tmux.conf ~/.tmux.conf']},
                {'arguments': ['ln -s ~/unix-setup/files-to-copy/.vimrc ~/.vimrc']},
                {'arguments': ['ln -s ~/unix-setup/files-to-copy/.zshrc ~/.zshrc']},
                {'arguments': ['alias explore="./~/unix-setup/files-to-copy/explore.bash"']}]}]}