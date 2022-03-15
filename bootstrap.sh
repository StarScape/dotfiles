# Brew packages
brew install neovim \
  clojure/tools/clojure clojure-lsp ripgrep node \
  lazygit

# NPM packages
npm install -g shadow-cljs

# Link nvim config directory
ln -s $(pwd)/nvim/ ~/.config/nvim

