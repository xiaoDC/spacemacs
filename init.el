;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; 862e81e49aefd6689e9d92a150212ac46ec66e99
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil
   ;; dotspacemacs-enable-lazy-installation t
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; (c-c++ :variables
     ;;        c-c++-default-mode-for-headers 'c++-mode)
     ;; clojure
     (scala :variables scala-backend 'scala-metals
            scala-indent:use-javadoc-style t
            scala-enable-eldoc t
            scala-auto-insert-asterisk-in-comments t
            scala-use-unicode-arrows nil)

     (clojure :variables clojure-enable-fancify-symbols nil)
     ;; (elm :variables
     ;;      elm-backend 'lsp)
     ;; elm
     emacs-lisp
     ;; chinese
     ;; javascript
     (lsp :variables
          lsp-ui-doc-enable nil
          lsp-ui-sideline-enable nil
          )
     (rust :variables
           rust-backend 'racer
           lsp-rust-server 'rust-analyzer)
     (go :variables
         go-tab-width nil
         go-use-gometalinter nil
         ;; godoc-at-point-function 'godoc-gogetdoc
         go-backend 'lsp
         gofmt-command "goimports")

     (haskell :variables
              haskell-completion-backend nil
              haskell-enable-hindent t)

     ;; (elixir :variables elixir-backend 'alchemist)
     ;; (elixir :variables elixir-backend 'lsp)
     ;; purescript
     ;; haskell
     ;; html
     ;; lua
     ;; nginx
     ;; (python :variables
     ;;         python-test-runner '(nose pytest))
     ;; racket
     ;; react
     ;; (ruby :variables ruby-version-manager 'chruby)
     ;; rust
     ;; (shell :variables shell-default-shell 'eshell)
     ;; sql

     (typescript :variables
                 typescript-backend 'lsp
                 ypescript-lsp-linter nil)

     yaml
     ivy
     ;; idris

     ;; json
     ;; prettier
     ;; spacemacs-prettier
     ;; gpu
     ;; better-defaults
     ;; ranger
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t)
     ;; graphviz
     ;; (syntax-checking :variables syntax-checking-enable-by-default nil
     ;;                  syntax-checking-enable-tooltips nil)
     ;; (spell-checking :variables spell-checking-enable-by-default nil)
     (vinegar :variables vinegar-reuse-dired-buffer t
              vinegar-dired-hide-details t)
     (spacemacs-layouts
      :variables layouts-enable-autosave nil
      layouts-autosave-delay 600
      )

     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          ;; magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil
          )

     (ibuffer :variables ibuffer-group-buffers-by 'projects)

     ;; (auto-completion :variables
     ;; auto-completion-enable-sort-by-usage t
     ;; auto-completion-enable-snippets-in-popup t
     ;; ;;                  ;; :disabled-for org markdown
     ;; )

     ;; (osx :variables osx-dictionary-dictionary-choice "Simplified Chinese - English"
     ;;   osx-command-as 'super)
     ;; restclient
     ;; (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     docker
     ;; latex
     ;; deft
     ;; markdown
     ;; (org :variables org-want-todo-bindings t)
     (org :variables
          org-want-todo-bindings nil
          ;; org-enable-reveal-js-support t
          )

     fri3nds
     ;; (chinese :packages youdao-dictionary fcitx
     ;;   :variables chinese-enable-fcitx nil
     ;;   chinese-enable-youdao-dict t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; abyss-theme
                                      ;; cyberpunk-theme
                                      ;; ibuffer-sidebar
                                      ;; rainbow-fart
                                      lsp-mode
                                      ;; lsp-metals
                                      ;; lsp-elm
                                      ;; sicp
                                      doom-themes
                                      ;; base16-theme
                                      ;; soothe-theme
                                      ;; alect-themes
                                      ;; calfw-cal
                                      ;; calfw-org
                                      ;; color-theme-sanityinc-solarized
                                      diff-hl
                                      ;; prettier-js
                                      company-tabnine
                                      ;; company-sql
                                      ;; dash
                                      ;; dash-functional
                                      ;; helm-dash
                                      ;; youdao-dictionary
                                      highlight-indent-guides
                                      editorconfig
                                      ;; fzf
                                      ;; evil-indent-plus
                                      ;; color-theme-sanityinc-tomorrow

                                      ;; all-the-icons
                                      ;; all-the-icons-dired
                                      ;; treemacs-icons-dired

                                      ;; exec-path-from-shell
                                      reveal-in-osx-finder
                                      format-all
                                      format-sql

                                      ;; flower
                                      ;; spacemacs-dark
                                      ;; spacemacs-light
                                      ;; (vline :location (recipe :fetcher github :repo "emacsmirror/vline"))
                                      ;; (awesome-tab :location (recipe :fetcher github :repo "manateelazycat/awesome-tab"))
                                      ;; (stylus-mode :location (recipe :fetcher github :repo "vladh/stylus-mode"))
                                      ;; (ishikk :location (recipe :fetcher github :repo "raxod502/ishikk"))
                                      ;; (reason-mode :location (recipe :fetcher github :repo "reasonml-editor/reason-mode" :stable t))
                                      ;; (alect-themes :location (recipe :fetcher github :repo "alezost/alect-themes"))
                                      ;; (carbon-now-sh :location (recipe :fetcher github :repo "veelenga/carbon-now-sh.el"))
                                      ;; tide
                                      ;; hierarchy
                                      string-inflection
                                      ;; cal-china-x
                                      ;; git-gutter
                                      ;; git-gutter+
                                      ;; neotree
                                      ;; rainbow-delimiters
                                      ;; rainbow-mode
                                      ;; ox-reveal
                                      ;; org-reveal
                                      ;; js-doc
                                      ;; (lsp-haskell :location (recipe :fetcher github :repo "emacs-lisp/lsp-haskell"))
                                      ;; json-reformat
                                      ;; soothe-theme
                                      ;; ample-theme
                                      ;; treemacs
                                      ;; treemacs-evil
                                      ;; treemacs-projectile
                                      ;; cnfonts
                                      ;; window-purpose
                                      whitespace
                                      eglot
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(magit-gh-pulls
     magit-gitflow
     org-projectile
     evil-mc
     realgud
     ghub
     alchemist
     multiple-cursors
     git-messenger
     graphviz-dot-mode
     helm-github-stars
     evil-args
     evil-ediff
     evil-exchange
     evil-unimpaired
     evil-tuto
     evil-matchit
     evil-lion
     ghub
     git-timemachine
     clojure-cheatsheet
     volatile-highlights smartparens
     spaceline holy-mode skewer-mode
     rainbow-delimiters
     dash
     dash-functional
     highlight-indentation vi-tilde-fringe eyebrowse
     anaconda
     lispy
     flycheck
     flycheck-gometalinter
     flycheck-elsa
     ;; flycheck-package
     flycheck-pos-tip

     ;; org-bullets
     org-repo-todo
     org-download
     dap-mode
     js-mode
     pangu-spacing
     js2refactor
     js2-mode
     ;; company
     org-timer
     org-pomodoro
     org-brain
     ;; org-plus-contrib
     livid-mode
     git-gutter
     git-gutter-fringe  evil-escape
     leuven-theme gh-md evil-lisp-state spray lorem-ipsum symon
     ac-ispell ace-jump-mode auto-complete auto-dictionary
     clang-format define-word google-translate disaster epic
     fancy-battery org-present orgit orglue
     ;; spacemacs-theme
     helm
     helm-flyspell flyspell-correct-helm clean-aindent-mode
     helm-c-yasnippet ace-jump-helm-line helm-make
     magithub
     helm-themes helm-swoop helm-spacemacs-help smeargle
     ido-vertical-mode flx-ido company-quickhelp counsel-projectile
     ;; window-purpose
     ivy-purpose helm-purpose spacemacs-purpose-popwin
     ac-ispell 2048-game 4clojure
     tide
     )
   dotspacemacs-install-packages 'used-only
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 100
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; dotspacemacs-startup-banner 666
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; dotspacemacs-startup-lists nil
   dotspacemacs-startup-lists '(
                                (projects . 0)
                                (recents . 0)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; doom-solarized-dark
                         solarized-dark
                         solarized-light
                         spacemacs-light
                         cyberpunk
                         tsdh-light
                         abyss
                         ;; wheatgrass
                         ;; adwaita
                         ;; spacemacs-dark
                         ;; alect-black
                         ;; deeper-blue
                         ;; base16-3024
                         ;; base16-atelier-estuary
                         ;; base16-atelier-plateau
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               ;; "Anonymous Pro"
                               ;; "Source Code Pro"
                               "Courier New"
                               ;; "Courier Prime Code"
                               ;; "Code New Roman"
                               ;; "Dank Mono"
                               ;; "DejaVu Sans Mono"
                               ;; "Droid Sans Mono"
                               ;; "Fantasque Sans Mono"
                               ;; "FandolKai"
                               ;; "Fira Code"
                               ;; "Fira Mono"
                               ;; "Go Mono"
                               ;; "Hack"
                               ;; "Hasklig"
                               ;; "Iosevka"
                               ;; "Input Mono"
                               ;; "Input Mono Narrow"
                               ;; "FantasqueSansMono Nerd Font Mono"
                               ;; "Fantasque Sans Mono"
                               ;; "Droid Sans Mono Slashed for Powerline"
                               ;; "DroidSansMono Nerd Font"
                               ;; "Inconsolata"
                               ;; "Inconsolata LGC"
                               ;; "Menlo"
                               ;; "Meslo LG S for Powerline"
                               ;; "Monoid"
                               ;; "Monaco"
                               ;; "monospace"
                               ;; "Noto Mono"
                               ;; "Office Code Pro"
                               ;; "Operator Mono"
                               ;; "Pica10 BT"
                               ;; "PragmataPro"
                               ;; "PT Mono"
                               ;; "Roboto Mono for Powerline"
                               ;; "SF Mono"
                               ;; "Source Code Pro for Powerline"
                               ;; "Cousine Nerd Font Mono"
                               ;; "Inconsolata-dz for Powerline"
                               ;; "Sometype Mono"
                               ;; "JetBrains Mono"
                               ;; "Cascadia Code"
                               ;; "Cascadia Mono"
                               ;; "Ubuntu Mono"
                               ;; "Sarasa mono SC"
                               :size 21
                               :weight normal
                               :height 600
                               ;; :weight light
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "fri3nd"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   ;; dotspacemacs-folding-method 'origami
   dotspacemacs-folding-method 'vim
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   ;; dotspacemacs-whitespace-cleanup 'changed
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  (setq configuration-layer-elpa-archives
        '(
          ("melpa-cn" . "https://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "https://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "https://elpa.emacs-china.org/gnu/")
          ))
  ;; (setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
  ;;                                           ("org" . "orgmode.org/elpa/") ("gnu" . "elpa.gnu.org/packages/")))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  ;; (setq tramp-ssh-controlmaster-options
  ;;       "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; ss proxy. But it will cause anacond-mode failed.
  ;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  ;; (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  ;; (setq warning-minimum-level :error)
  ;; hack for remove purpose mode
  ;; (setq exec-path-from-shell-arguments '("-l"))
  (setq purpose-mode nil)

  ;; (add-to-list 'load-path "~/.emacs.d/elpa/develop/doom-themes-20190904.2252")
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/develop/doom-themes-20190904.2252")

  ;; // 直接进入 scratch buffer
  ;; (defun spacemacs-buffer/goto-buffer ()
  ;;   (interactive))
  )

(defun dotspacemacs/user-config ()
  ;; (add-to-list 'load-path (expand-file-name "/Users/fri3nds/.spacemacs.d/aweshell"))


  ;; (setq awesome-tab-style 'alternate)
  ;; (setq awesome-tab-style 'box)
  ;; (setq awesome-tab-style 'slant)
  ;; (awesome-tab-mode t)

  ;; (defun awesome-tab-buffer-groups ()
  ;;   (list "fri3nd"))

  ;; (defun awesome-tab-hide-tab (x)
  ;;   (let ((name (format "%s" x)))
  ;;     (or
  ;;      (string-prefix-p "*epc" name)
  ;;      (string-prefix-p "*Messages" name)
  ;;      (string-prefix-p "*helm" name)
  ;;      (string-prefix-p "*Compile-Log*" name)
  ;;      (string-prefix-p "*lsp" name)
  ;;      (string-prefix-p "*ts-ls" name)
  ;;      (string-prefix-p "*gopls" name)
  ;;      (string-prefix-p "*rls" name)
  ;;      (and (string-prefix-p "magit" name)
  ;;           (not (file-name-extension name)))
  ;;      )))

  (setq auto-mode-alist
        (append '(("\\.cpt$" . sensitive-mode)) auto-mode-alist))
  (add-hook 'sensitive-mode (lambda () (auto-save-mode nil)))
  (setq load-path (cons "~/.spacemacs.d/ccrypt" load-path))
  (require 'ps-ccrypt "ps-ccrypt.el")

  ;; (setq evil-insert-state-cursor '(bar "medium sea green"))

  ;; (require 'aweshell)
  (when (window-system)
    (set-frame-font "Fira Code"))

  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 ;; (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                 )
               ))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring]))))

  ;; (spacemacs/load-theme 'solarized-dark-light-high-contrast t)
  ;; (spacemacs/load-theme 'doom-solarized-dark t)
  (setq save-abbrevs nil)
  (setq ivy-use-virtual-buffers t)

  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; (require 'lsp-mode)
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-stdio-connection "/usr/local/bin/reason-language-server")
  ;;                   :major-modes '(reason-mode)
  ;;                   :notification-handlers (ht ("client/registerCapability" 'ignore))
  ;;                   :priority 1
  ;;                   :server-id 'reason-ls))

  ;; (setq racer-rust-src-path "/Users/fri3nds/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")

  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 12 14)))

  (when (display-graphic-p)
    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family "PingFang SC" :size 12))))

  ;; Setting Chinese Font
  ;; (when (and (spacemacs/system-is-mswindows) window-system)
  ;;   (setq ispell-program-name "aspell")
  ;;   (setq w32-pass-alt-to-system nil)
  ;;   (setq w32-apps-modifier 'super)
  ;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;     (set-fontset-font (frame-parameter nil 'font)
  ;;       charset
  ;;       (font-spec :family "Monoid" :size 12))))
  ;; (font-spec :family "Microsoft Yahei" :size 14))))

  (fset 'evil-visual-update-x-selection 'ignore)

  ;;;; (add-hook 'helm-major-mode-hook
  ;;;;   (lambda ()
  ;;;;     (setq auto-composition-mode nil)))

  ;; force horizontal split window
  (setq split-width-threshold 300)
  (setq
   scroll-conservatively 101
   scroll-margin 5
   scroll-preserve-screen-position 't
   )

  ;; (global-linum-mode 1)
  ;; (setq linum-format "%4d")

  ;; (linum-relative-on)
  (setq-default line-spacing 3)
  (setq calendar-mark-diary-entries-flag t)
  ;; (setq org-agenda-include-diary t)

  (add-hook 'org-finalize-agenda-hook
            (lambda ()
              (setq appt-message-warning-time 10        ;; warn 10 min in advance
                    appt-display-diary nil              ;; do not display diary when (appt-activate) is called
                    appt-display-mode-line t            ;; show in the modeline
                    appt-display-format 'window         ;; display notification in window
                    calendar-mark-diary-entries-flag t) ;; mark diary entries in calendar
              (org-agenda-to-appt)                      ;; copy all agenda schedule to appointments
              (appt-activate 1)))

  ;; (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

  ;; (spacemacs|add-company-backends :modes text-mode)
  ;; (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 10 1024 1024))))
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (global-hungry-delete-mode t)
  ;; (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  ;; (spacemacs|diminish counsel-mode)

  ;; 让 cnfonts 随着 Emacs 自动生效。
  ;; (cnfonts-enable)
  ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
  ;; (cnfonts-set-spacemacs-fallback-fonts)


  ;; (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
               '("Capstanfile\\'" . yaml-mode))

  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; (add-to-list 'default-frame-alist '(ns-appearance . light))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-spelling-checking-on)


  ;; https://emacs-china.org/t/topic/4627
  (setq yas-snippet-dirs
        '(
          "~/.emacssnippets/snippets/"
          "~/.emacs.d/layers/+completion/auto-completion/local/snippets"))


  ;; (typescript-mode)

  ;; make the fringe stand out from the background
  ;; (setq solarized-distinct-fringe-background t)
  ;; Don't change the font for some headings and titles
  ;; make the modeline high contrast
  ;; (setq solarized-high-contrast-mode-line t)
  ;; Use less bolding
  ;; Use more italics
  ;; (setq solarized-use-more-italic t)
  ;; Use less colors for indicators such as git:gutter, flycheck and similar


  ;; (setq solarized-emphasize-indicators t)
  ;; Don't change size of org-mode headlines (but keep other size-changes)
  ;; (setq solarized-use-less-bold t)
  ;; (setq solarized-scale-org-headlines nil)
  ;; (setq solarized-use-variable-pitch t)
  ;; ;; Avoid all font-size changes
  ;; (setq solarized-height-minus-1 1.0)
  ;; (setq solarized-height-plus-1 1.0)
  ;; (setq solarized-height-plus-2 1.0)
  ;; (setq solarized-height-plus-3 1.0)
  ;; (setq solarized-height-plus-4 1.0)
  (setq x-underline-at-descent-line t)

  ;; (setq doom-themes-enable-bold t
  ;;   doom-themes-enable-italic t)

  ;; (vline-global-mode 1)
  ;; (set-face-background vline-face "#073642")

  ;; (global-display-line-numbers-mode 1)
  ;; (global-diff-hl-mode 1)

  ;; (setq my-holidays
  ;;   ;;纪念日
  ;;   (holiday-fixed 1 1 "New Year")
  ;;   ;; (holiday-lunar 1 2 "我的生日"  0)
  ;;   )
  ;; (setq calendar-holidays my-holidays)  ;只显示我定制的节假日

  ;; (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
  ;; (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark)))
  ;; (setq whitespace-display-mappings '(
  ;;                                      (space-mark 32 [183] [46]) ; normal space
  ;;                                      (space-mark 160 [164] [95])
  ;;                                      (space-mark 2208 [2212] [95])
  ;;                                      (space-mark 2336 [2340] [95])
  ;;                                      (space-mark 3616 [3620] [95])
  ;;                                      (space-mark 3872 [3876] [95])
  ;;                                      (newline-mark 10 [35 10]) ; newlne
  ;;                                      (tab-mark 9 [9655 9] [92 9]) ; tab
  ;;                                     ))
  ;; (setq display-line-numbers-type 'relative)

  (defun my-prog-mode-hook ()
    "active after prog-mode"
    (interactive)
    ;; (spacemacs/toggle-fill-column-indicator-on)
    (yas-minor-mode 1)
    ;; (auto-complete-mode 1)
    ;; (column-enforce-mode 1)
    ;; (parinfer-active)
    ;; (linum-mode 1)
    (abbrev-mode 1)
    ;; (display-line-numbers-mode 'relative)
    (display-line-numbers-mode -1)
    ;; (vline-mode -1)
    ;; (blank-mode t)
    (global-company-mode)
    ;; (whitespace-mode 1)
    ;; (highlight-indent-guides-mode 1)
    ;; (set-face-background vline-face "#c2ebff")
    ;; (fci-mode 1)
    (editorconfig-mode 1)
    )


  (setq highlight-indent-guides-auto-character-face-perc 8)
  (setq highlight-indent-guides-method 'character)
  ;; (setq highlight-indent-guides-character ?\⎨)
  ;; (setq highlight-indent-guides-character ?\￤)
  ;; (setq highlight-indent-guides-character ?\：)
  ;; (setq highlight-indent-guides-character ?\｜)
  (setq highlight-indent-guides-character ?\┆)
  ;; (setq highlight-indent-guides-character ?\⫶)
  ;; 𝄀 𝄁 𝄂 𝄃 𝄄 𝄅




  (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . typescript-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.json\\'" . typescript-mode))


  (add-hook 'prog-mode-hook 'my-prog-mode-hook)
  ;; (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-on)) 'append)
  ;; (global-set-key (kbd "<escape>")      'keyboard-quit)

  (add-hook 'text-mode-hook 'my-prog-mode-hook)


  (setq neo-theme 'icons)
  ;; (setq neo-theme 'arrow)
  (setq neo-vc-integration (quote (char)))
  ;; (setq neo-window-position 'right)
  (setq neo-window-position 'left)

  (setq company-backends-typescript-mode '(
                                           company-yasnippet
                                           company-files
                                           (company-dabbrev-code company-gtags company-etags company-keywords)
                                           company-dabbrev
                                           ))
  ;; (setq company-backends-typescript-mode (cdr company-backends-typescript-mode))

  ;; (defun setup-tide-mode ()
  ;;   (electric-indent-local-mode -1)
  ;;   (electric-indent-mode -1)
  ;; (interactive)
  ;;   (tide-setup)
  ;;   (flycheck-mode -1)
  ;;   ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;;   (eldoc-mode -1)
  ;;   (tide-hl-identifier-mode -1)
  ;;   ;; company is an optional dependency. You have to
  ;;   ;; install it separately via package-install
  ;;   ;; `M-x package-install [ret] company`
  ;; (company-mode -1))
  ;; (add-hook 'typescript-mode-hook #'setup-tide-mode)

  (with-eval-after-load 'company
    (add-to-list 'company-backends '(
                                     company-files
                                     company-capf :with company-dabbrev
                                     ;; company-elm
                                     ;; company-tabnine
                                     )))

  ;; (eval-after-load 'dash '(dash-enable-font-lock))
  ;; (setq helm-dash-docsets-path "/Users/fri3nds/Library/Application Support/Dash/Versioned DocSets")

  ;; (setq company-dabbrev-code-everywhere t)
  ;; (setq company-dabbrev-code-modes t)
  ;; (setq company-dabbrev-code-other-buffers 'all)
  ;; (setq company-dabbrev-ignore-buffers "\\`\\'")
  ;; (setq company-idle-delay 0)

  ;; (with-eval-after-load 'neotree
  ;;   (define-key neotree-mode-map (kbd "h") 'spacemacs/neotree-collapse)
  ;;   (define-key neotree-mode-map (kbd "o") 'spacemacs/neotree-expand-or-open)
  ;;   (define-key neotree-mode-map (kbd "y") 'neotree-copy-node)
  ;;   (define-key neotree-mode-map (kbd "r") 'neotree-change-root)
  ;;   (setq-default neo-show-updir-line t)

  ;;   (setq neo-window-width 48)
  ;;   (setq neo-window-fixed-size nil)
  ;;   (setq neo-show-hidden-files nil)
  ;;   ;; (setq-default neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.DS_Store$" "^node_modules" "babel_cache"))
  ;;   )

  ;; (treemacs-git-mode 'deferred)

  (setq treemacs-width 36)
  (setq treemacs-filewatch-mode t);
  (setq treemacs-file-event-delay 1000)

  (with-eval-after-load "treemacs"
    (define-key treemacs-mode-map (kbd "h") 'treemacs-collapse-parent-node)
    (define-key treemacs-mode-map (kbd "o") 'treemacs-visit-node-no-split)
    (define-key treemacs-mode-map (kbd "s") 'treemacs-toggle-show-dotfiles)
    (define-key treemacs-mode-map (kbd "y") 'treemacs-copy-file)

    (setq treemacs-indentation-string (propertize "⫶  " 'face 'font-lock-comment-face)
          treemacs-indentation 1)

    ;; (with-eval-after-load 'all-the-icons
    ;;   (let ((all-the-icons-default-adjust 0)
    ;;         (tab-width 1))
    ;;     ;; Root icon
    ;;     (setq treemacs-icon-root-png
    ;;           (concat (all-the-icons-octicon "repo" :height 0.8 :v-adjust -0.2)  " "))
    ;;     ;; File icons
    ;;     (setq treemacs-icon-open-png
    ;;           (concat
    ;;            (all-the-icons-octicon "chevron-down" :height 0.8 :v-adjust 0.1)
    ;;            "\t"
    ;;            (all-the-icons-octicon "file-directory" :v-adjust 0)
    ;;            "\t")
    ;;           treemacs-icon-closed-png
    ;;           (concat
    ;;            (all-the-icons-octicon "chevron-right" :height 0.8
    ;;                                   :v-adjust 0.1 :face 'font-lock-doc-face)
    ;;            "\t"
    ;;            (all-the-icons-octicon "file-directory" :v-adjust 0 :face 'font-lock-doc-face)
    ;;            "\t"))
    ;;     ;; File type icons
    ;;     (setq treemacs-icons-hash (make-hash-table :size 200 :test #'equal)
    ;;           treemacs-icon-fallback (concat
    ;;                                   "\t\t"
    ;;                                   (all-the-icons-faicon "file-o" :face 'all-the-icons-dsilver
    ;;                                                         :height 0.8 :v-adjust 0.0)
    ;;                                   "\t")
    ;;           treemacs-icon-text treemacs-icon-fallback)

    ;;     (dolist (item all-the-icons-icon-alist)
    ;;       (let* ((extension (car item))
    ;;              (func (cadr item))
    ;;              (args (append (list (caddr item)) '(:v-adjust -0.05) (cdddr item)))
    ;;              (icon (apply func args))
    ;;              (key (s-replace-all '(("^" . "") ("\\" . "") ("$" . "") ("." . "")) extension))
    ;;              (value (concat "\t\t" icon "\t")))

    ;;         (unless (ht-get treemacs-icons-hash (s-replace-regexp "\\?" "" key))
    ;;           (ht-set! treemacs-icons-hash (s-replace-regexp "\\?" "" key) value))
    ;;         (unless (ht-get treemacs-icons-hash (s-replace-regexp ".\\?" "" key))
    ;;           (ht-set! treemacs-icons-hash (s-replace-regexp ".\\?" "" key) value))))))

    )



  (setq ido-ignore-buffers '("\\` " "^\*grep*" "^\*scratch*" "^\*Messages*" "^\*emacs*" "^\*spacemacs*"))
  (setq iswitchb-buffer-ignore '("\\` " "^\*grep*" "^\*Messages*" "^\*emacs*" "^\*spacemacs*"))
  ;; (setq helm-ff-skip-boring-files t)
  ;;;; (setq helm-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*Messages" "\\*scratch"))


  (setq yas-indent-line 'fixed)

  (custom-set-faces
   ;;   (set-face-background 'git-gutter+-modified "yellow") ;; background color
   ;;   (set-face-foreground 'git-gutter+-added "green")
   ;; (set-face-foreground 'git-gutter+-deleted "DarkRed")
   (set-face-background 'highlight "#EEAD0E")
   )


  ;; (custom-set-variables
  ;;   ;; 设置 git-gutter
  ;;   '(git-gutter+-window-width 6)
  ;;   '(git-gutter+-modified-sign " ")
  ;;   '(git-gutter+-added-sign " ")
  ;;   '(git-gutter+-deleted-sign " ")
  ;;   ;; ︴‖︳|┆┃║┇
  ;;   ;; '(git-gutter+:modified-sign nil)
  ;;   ;; '(git-gutter+:added-sign nil)
  ;;   ;; '(git-gutter+:deleted-sign nil)
  ;;   ;; '(git-gutter+:visual-line nil)
  ;;   '(git-gutter:update-interval 0))

  ;; (global-git-gutter+-mode)

  ;; Removing dot files in helm-find-files menu
  ;; https://www.reddit.com/r/emacs/comments/5q922h/removing_dot_files_in_helmfindfiles_menu/
  ;; (require 'cl-lib)
  ;; (defvar no-dots-whitelist
  ;;   '()
  ;;   "List of helm buffers in which to show dots.")

  ;; (defun no-dots/whitelistedp ()
  ;;   (member (with-helm-buffer (buffer-name)) no-dots-whitelist))

  ;; (defun no-dots/helm-ff-filter-candidate-one-by-one (fcn file)
  ;;   (when (or (no-dots/whitelistedp)
  ;;             (not (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)))
  ;;     (funcall fcn file)))

  ;; (defun no-dots/helm-file-completion-source-p (&rest args) t)

  ;; (defun no-dots/helm-attrset (fcn attribute-name value &optional src)
  ;;   (let ((src (or src (helm-get-current-source))))
  ;;     (when src
  ;;       (funcall fcn attribute-name value src))))

  ;; (defun no-dots/helm-find-files-up-one-level (fcn &rest args)
  ;;   (advice-add 'helm-file-completion-source-p
  ;;               :around 'no-dots/helm-file-completion-source-p)
  ;;   (advice-add 'helm-attrset
  ;;               :around 'no-dots/helm-attrset)
  ;;   (let ((res (apply fcn args)))
  ;;     (advice-remove 'helm-file-completion-source-p
  ;;                   'no-dots/helm-file-completion-source-p)
  ;;     (advice-remove 'helm-attrset
  ;;                   'no-dots/helm-attrset)
  ;;     res))

  ;; (with-eval-after-load 'helm-files
  ;;   (advice-add 'helm-ff-filter-candidate-one-by-one
  ;;               :around 'no-dots/helm-ff-filter-candidate-one-by-one)
  ;;   (advice-add 'helm-find-files-up-one-level
  ;;               :around 'no-dots/helm-find-files-up-one-level))
  ;; ;; end ====================================================== Removing dot files in helm-find-files menu

  (setq-default mode-line-format
                (list
                 ;; " ❐ "
                 " "
                 ;; " %1"
                 '(:eval (propertize
                          (window-number-mode-line)
                          'face
                          'font-lock-type-face))

                 ;; '(:eval (custom-update-persp-name))

                 ;; "%1 "
                 " "
                 ;; the buffer name; the file name as a tool tip
                 '(:eval (propertize "%b " 'face 'font-lock-type-face
                                     'help-echo (buffer-file-name)))

                 " "
                 (propertize "%I" 'face 'font-lock-constant-face) ;; size

                 " "

                 ;; anzu
                 ;; anzu--mode-line-format

                 ;; the current major mode for the buffer.
                 '(:eval (propertize "%m" 'face nil
                                     'help-echo buffer-file-coding-system))
                 ;; '(:eval (propertize "%m" 'face 'font-lock-string-face
                 ;;           'help-echo buffer-file-coding-system))

                 ;; my-flycheck-mode-line
                 ;; evil state
                 " "
                 '(:eval evil-mode-line-tag)

                 ;; minor modes
                 ;; minor-mode-alist
                 ;; git info
                 " "
                 `(vc-mode vc-mode)
                 ;; " "

                 ;; global-mode-string goes in mode-line-misc-info
                 ;; mode-line-misc-info

                 ;; (mode-line-fill 'mode-line 30)

                 ;; (propertize "%z" 'face 'font-lock-type-face)

                 ;; mode-line-end-spaces
                 ;; add the time, with the date and the emacs uptime in the tooltip
                 ;; '(:eval (propertize (format-time-string "%a, %Y %m %d, %H:%M") 'face 'font-lock-constant-face))
                 ;; '(:eval (list (nyan-create)))

                 ;; relative position, size of file

                 ;; line and column
                 ;; "("
                 (propertize "%6l" 'face 'font-lock-type-face)
                 "  "
                 (propertize "%4C" 'face 'font-lock-type-face)
                 ;; ")"

                 " "
                 '(:eval (buffer-encoding-abbrev))

                 " "
                 (propertize "%p" 'face 'font-lock-constant-face) ;; % above top

                 " " ;; insert vs overwrite mode, input-method in a tooltip
                 '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                     'face 'font-lock-preprocessor-face
                                     'help-echo (concat "Buffer is in "
                                                        (if overwrite-mode
                                                            "overwrite"
                                                          "insert") " mode")))

                 ;; was this buffer modified since the last save?
                 '(:eval (when (buffer-modified-p)
                           (concat ","  (propertize "Mod"
                                                    'face 'font-lock-warning-face
                                                    'help-echo "Buffer has been modified"))))

                 ;; is this buffer read-only?
                 '(:eval (when buffer-read-only
                           (concat ","  (propertize "RO"
                                                    'face 'font-lock-warning-face
                                                    'help-echo "Buffer is read-only"))))

                 "  "
                 ;; '(:eval (format-time-string "%Y-%m-%d %H:%M" (current-time)))
                 ;; '(:eval (list (nyan-create)))
                 ))

  (setq-default header-line-format
                '(" "
                  (:eval (propertize (if (buffer-file-name)
                                         (abbreviate-file-name (buffer-file-name)) "%b") 'face 'font-lock-type-face))))

  ;; (setq-default header-line-format
  ;;               '((:eval (propertize "  1 %b | " 'face 'font-lock-type-face
  ;;                                    'help-echo (buffer-file-name)))
  ;;                 ;; " ⟹ "
  ;;                 (:eval
  ;;                  ;; (when (powerline-selected-window-active)
  ;;                  (if (buffer-file-name)
  ;;                      (let ((buffer-coll (-filter 'buffer-file-name (-filter #'(lambda (x) (not (eq (buffer-file-name x) (buffer-file-name)))) (buffer-list)))))
  ;;                        (mapconcat #'(lambda (x) (format "%s %s" (car x) (cdr x))) (-zip-pair (number-sequence 2 80) (sort (mapcar #'(lambda (x) (format "%s" x)) buffer-coll) #'string-lessp)) " | ")
  ;;                        )
  ;;                    ;;              ;; (let ((buffer-coll (remove nil (mapcar 'buffer-file-name (buffer-list)))))
  ;;                    ;;              ;; (concat
  ;;                    ;;              ;;   ;; "⟹"
  ;;                    ;;              ;;   ;; " ❐ "
  ;;                    ;;              ;;   " "
  ;;                    ;;              ;;   (number-to-string (+ 1 (position
  ;;                    ;;              ;;                            (buffer-file-name)
  ;;                    ;;              ;;                            buffer-coll)))
  ;;                    ;;              ;;   "/"
  ;;                    ;;              ;;   (number-to-string (list-length buffer-coll))
  ;;                    ;;              ;;   " "
  ;;                    ;;              ;;   (abbreviate-file-name (buffer-file-name)))
  ;;                    "%b"))))

  )

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))

(load custom-file 'no-error 'no-message)

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages '(evil-unimpaired f s dash)))
  '(spacemacs-theme-custom-colors ;                              GUI       TER                           GUI       TER
    '((bg1        . (if (eq variant 'dark) (if (true-color-p) "#222226" "#262626") (if (true-color-p) "#fbf8ef" "#ffffff")))
      (bg2        . (if (eq variant 'dark) (if (true-color-p) "#17181B" "#1c1c1c") (if (true-color-p) "#efeae9" "#e4e4e4")))
      (comment-bg . (if (eq variant 'dark) (if (true-color-p) "#23282A" "#262626") (if (true-color-p) "#ecf3ec" "#ffffff")))
      (highlight  . (if (eq variant 'dark) (if (true-color-p) "#61526E" "#444444") (if (true-color-p) "#d3d3e7" "#d7d7ff")))
      (act2       . (if (eq variant 'dark) (if (true-color-p) "#603D8E" "#444444") (if (true-color-p) "#d3d3e7" "#d7d7ff")))
      (border     . (if (eq variant 'dark) (if (true-color-p) "#603D8E" "#444444") (if (true-color-p) "#d3d3e7" "#d7d7ff")))
      )))
