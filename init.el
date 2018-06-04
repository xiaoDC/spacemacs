;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

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
       (clojure :variables clojure-enable-fancify-symbols nil)
       ;; elm
       emacs-lisp
       ;; javascript
       (go :variables
         go-tab-width 2)
       ;; haskell
       html
       ;; lua
       ;; nginx
       ;; (python :variables
       ;;         python-test-runner '(nose pytest))
       ;; racket
       ;; react
       ;; (ruby :variables ruby-version-manager 'chruby)
       ;; ruby-on-rails
       ;; rust
       ;; (shell :variables shell-default-shell 'eshell)
       sql
       typescript
       ;; yaml
       ivy

       ;; gpu
       ;; better-defaults
       ;; ranger
       ;; colors
       ;; prodigy
       ;; search-engine
       ;; graphviz
       ;; (syntax-checking :variables syntax-checking-enable-by-default nil
       ;;                  syntax-checking-enable-tooltips nil)
       ;; (spell-checking :variables spell-checking-enable-by-default nil)
       (vinegar :variables vinegar-reuse-dired-buffer t)
       (spacemacs-layouts :variables layouts-enable-autosave nil
         layouts-autosave-delay 3000)

       (git :variables
         git-magit-status-fullscreen t
         magit-push-always-verify nil
         magit-save-repository-buffers 'dontask
         magit-revert-buffers 'silent
         magit-refs-show-commit-count 'all
         magit-revision-show-gravatars nil
         )

       (ibuffer :variables ibuffer-group-buffers-by 'projects)

       (auto-completion :variables
         auto-completion-enable-sort-by-usage t
         auto-completion-enable-snippets-in-popup t
         :disabled-for org markdown)

       (osx :variables osx-dictionary-dictionary-choice "Simplified Chinese - English"
         osx-command-as 'super)
       ;; restclient
       ;; (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
       ;; docker
       ;; latex
       ;; deft
       markdown
       ;; (org :variables org-want-todo-bindings t)
       (org :variables
         org-want-todo-bindings t
         org-enable-reveal-js-support t)

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
                                        ;; sicp
                                        doom-themes
                                        solarized-theme
                                        youdao-dictionary
                                        highlight-indent-guides
                                        editorconfig
                                        color-theme-sanityinc-tomorrow
                                        all-the-icons
                                        all-the-icons-dired
                                        exec-path-from-shell
                                        ;; spacemacs-dark
                                        ;; spacemacs-light
                                        (stylus-mode :location (recipe :fetcher github :repo "vladh/stylus-mode"))
                                        ;; (reason-mode :location (recipe :fetcher github :repo "reasonml-editor/reason-mode" :stable t))
                                        (alect-themes :location (recipe :fetcher github :repo "alezost/alect-themes"))
                                        (carbon-now-sh :location (recipe :fetcher github :repo "veelenga/carbon-now-sh.el"))
                                        ;; tide
                                        hierarchy
                                        string-inflection
                                        ;; git-gutter
                                        ;; git-gutter+
                                        neotree
                                        ;; rainbow-delimiters
                                        rainbow-mode
                                        ;; ox-reveal
                                        ;; org-reveal
                                        ;; js-doc
                                        ;; soothe-theme
                                        ;; material-theme
                                        ;; ample-theme
                                        ;; treemacs
                                        ;; treemacs-evil
                                        ;; treemacs-projectile
                                        ;; cnfonts
                                        )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages
   '(magit-gh-pulls magit-gitflow org-projectile evil-mc realgud
      evil-args evil-ediff evil-exchange evil-unimpaired
      evil-indent-plus volatile-highlights smartparens
      spaceline holy-mode skewer-mode
      ;; rainbow-delimiters
      highlight-indentation vi-tilde-fringe eyebrowse
      anaconda
      lispy
      flycheck-gometalinter
      org-bullets
      ;; org-repo-todo
      ;; org-download
      flycheck
      js-mode
      pangu-spacing
      js2refactor
      ;; js2-mode
      ;; company
      ;; org-timer
      ;; org-pomodoro
      ;; org-brain
      ;; org-plus-contrib
      livid-mode
      git-gutter
      git-gutter-fringe  evil-escape
      leuven-theme gh-md evil-lisp-state spray lorem-ipsum symon
      ac-ispell ace-jump-mode auto-complete auto-dictionary
      clang-format define-word google-translate disaster epic
      fancy-battery org-present orgit orglue spacemacs-theme
      helm-flyspell flyspell-correct-helm clean-aindent-mode
      helm-c-yasnippet ace-jump-helm-line helm-make magithub
      helm-themes helm-swoop helm-spacemacs-help smeargle
      ido-vertical-mode flx-ido company-quickhelp counsel-projectile
      window-purpose ivy-purpose helm-purpose spacemacs-purpose-popwin
      ac-ispell 2048-game 4clojure tide
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
   dotspacemacs-check-for-update nil
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
   ;; dotspacemacs-startup-banner 2
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
    dotspacemacs-startup-lists '(
                                  (recents . 40)
                                  ;; (projects . 20)
                                  )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(
                           ;; spacemacs-light
                           ;; doom-tomorrow-night
                           solarized-dark
                           solarized-light
                           ;; doom-peacock
                           spacemacs-dark
                           )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '(
                                 ;; "Source Code Pro"
                                 ;; "Anonymous Pro"
                                 ;; "consolas"
                                 ;; "Monaco"
                                 ;; "Menlo"
                                 ;; "Operator Mono"
                                 ;; "DejaVu Sans Mono"
                                 ;; "Fira Code"
                                 ;; "PT Mono"
                                 ;; "Hack"
                                 ;; "Office Code Pro"
                                 ;; "Iosevka"
                                 ;; "CamingoCode"
                                 ;; "Input Mono"
                                 ;; "InconsolataGo Nerd Font"
                                 ;; "Inconsolata"
                                 ;; "Nitti Basic"
                                 ;; "Go Mono"
                                 ;; "Courier New"
                                 "Pica10 BT"
                                 :size 18
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.2)
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
    dotspacemacs-default-layout-name "fri3nds"
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
   ;; dotspacemacs-smooth-scrolling nil
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
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "https://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "https://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "https://elpa.emacs-china.org/gnu/")))

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
  (setq exec-path-from-shell-arguments '("-l"))
  (setq purpose-mode nil)

  (defun spacemacs-buffer/goto-buffer ()
    (interactive))
  )

(defun dotspacemacs/user-config ()
  (setq save-abbrevs nil)


  ;; (setq racer-rust-src-path "/Users/fri3nds/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")

  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

  ;; Setting Chinese Font
  (when (and (spacemacs/system-is-mswindows) window-system)
    (setq ispell-program-name "aspell")
    (setq w32-pass-alt-to-system nil)
    (setq w32-apps-modifier 'super)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
        charset
        (font-spec :family "Monoid" :size 14))))
        ;; (font-spec :family "Microsoft Yahei" :size 14))))


  (fset 'evil-visual-update-x-selection 'ignore)
  (setq org-default-notes-file "/Users/fri3nds/org/notes.org")


  ;; (when (window-system)
  ;;  (set-default-font "Fira Code"))

  ;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
  ;;                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
  ;;                 (36 . ".\\(?:>\\)")
  ;;                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
  ;;                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
  ;;                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
  ;;                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
  ;;                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
  ;;                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
  ;;                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
  ;;                 (48 . ".\\(?:x[a-zA-Z]\\)")
  ;;                 (58 . ".\\(?:::\\|[:=]\\)")
  ;;                 (59 . ".\\(?:;;\\|;\\)")
  ;;                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
  ;;                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
  ;;                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
  ;;                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
  ;;                 (91 . ".\\(?:]\\)")
  ;;                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
  ;;                 (94 . ".\\(?:=\\)")
  ;;                 (119 . ".\\(?:ww\\)")
  ;;                 (123 . ".\\(?:-\\)")
  ;;                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
  ;;                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
  ;;                 )
  ;;         ))
  ;;   (dolist (char-regexp alist)
  ;;     (set-char-table-range composition-function-table (car char-regexp)
  ;;       `([,(cdr char-regexp) 0 font-shape-gstring]))))


  (add-hook 'helm-major-mode-hook
    (lambda ()
      (setq auto-composition-mode nil)))



  ;; force horizontal split window
  (setq split-width-threshold 300)

  ;; (global-linum-mode 1)

  ;; (global-linum-mode nil)
  ;; (linum-relative-on)
  (setq-default line-spacing 4)
  ;; (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

  ;; (spacemacs|add-company-backends :modes text-mode)
  ;; (add-hook 'after-init-hook 'global-company-mode)

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; temp fix for ivy-switch-buffer
  ;; (spacemacs/set-leader-keys "bb" 'helm-mini)

  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)

  ;; 让 cnfonts 随着 Emacs 自动生效。
  ;; (cnfonts-enable)
  ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
  ;; (cnfonts-set-spacemacs-fallback-fonts)



  ;; (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
    '("Capstanfile\\'" . yaml-mode))

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
  ;; (setq solarized-use-variable-pitch nil)
  ;; make the modeline high contrast
  ;; (setq solarized-high-contrast-mode-line t)
  ;; Use less bolding
  ;; (setq solarized-use-less-bold t)
  ;; Use more italics
  ;; (setq solarized-use-more-italic t)
  ;; Use less colors for indicators such as git:gutter, flycheck and similar
  ;; (setq solarized-emphasize-indicators nil)
  ;; Don't change size of org-mode headlines (but keep other size-changes)
  ;; (setq solarized-scale-org-headlines nil)
  ;; Avoid all font-size changes
  ;; (setq solarized-height-minus-1 1.0)
  ;; (setq solarized-height-plus-1 1.0)
  ;; (setq solarized-height-plus-2 1.0)
  ;; (setq solarized-height-plus-3 1.0)
  ;; (setq solarized-height-plus-4 1.0)


  ;; (add-to-list 'org-capture-templates '("w" "Work Tasks"))






  (global-display-line-numbers-mode 1)

  (defun my-prog-mode-hook ()
    "active after prog-mode"
    (interactive)
    ;; (yas-minor-mode 1)
    ;; (auto-complete-mode 1)
    ;; (column-enforce-mode 1)
    ;; (parinfer-active)
    (linum-mode -1)
    (abbrev-mode 1)
    (display-line-numbers-mode 1)
    ;; (blank-mode t)
    ;; (global-company-mode)
    (highlight-indent-guides-mode 1)

    ;; (fci-mode 1)
    (editorconfig-mode 1)
    )

  (setq highlight-indent-guides-auto-character-face-perc 8)
  (setq highlight-indent-guides-method 'character)



  (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.json\\'" . typescript-mode))

  (add-hook 'prog-mode-hook 'my-prog-mode-hook)
  ;; (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-on)) 'append)
  ;; (global-set-key (kbd "<escape>")      'keyboard-quit)

  (add-hook 'text-mode-hook 'my-prog-mode-hook)


  (setq neo-theme 'icons)
  (setq neo-vc-integration (quote (char)))
  (setq neo-window-position 'left)

  ;; (setq company-backends-typescript-mode '(
  ;;                                           company-yasnippet
  ;;                                           (company-dabbrev-code company-gtags company-etags company-keywords)
  ;;                                           company-files
  ;;                                           company-dabbrev
  ;;                                           ))
  (setq company-backends-typescript-mode (cdr company-backends-typescript-mode))

  (with-eval-after-load 'company
    (add-to-list 'company-backends '(
                                      company-files
                                      company-capf :with company-dabbrev
                                      )))

  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-modes t)
  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-ignore-buffers "\\`\\'")

  (with-eval-after-load 'neotree
    (define-key neotree-mode-map (kbd "h") 'spacemacs/neotree-collapse)
    (define-key neotree-mode-map (kbd "o") 'spacemacs/neotree-expand-or-open)
    (define-key neotree-mode-map (kbd "y") 'neotree-copy-node)
    (define-key neotree-mode-map (kbd "r") 'neotree-change-root)
    (setq-default neo-show-updir-line t)

    (setq neo-window-fixed-size nil)
    (setq neo-show-hidden-files nil)
    (setq-default neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.DS_Store$" "^node_modules" "babel_cache"))
    )




  (setq ido-ignore-buffers '("\\` " "^\*grep*" "^\*scratch*" "^\*Messages*" "^\*emacs*" "^\*spacemacs*"))
  (setq iswitchb-buffer-ignore '("\\` " "^\*grep*" "^\*Messages*" "^\*emacs*" "^\*spacemacs*"))
  (setq helm-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*Messages" "\\*scratch"))



  (setq yas-indent-line 'fixed)


  ;; (custom-set-faces
  ;;   (set-face-background 'git-gutter+-modified "yellow") ;; background color
  ;;   (set-face-foreground 'git-gutter+-added "green")
  ;;   (set-face-foreground 'git-gutter+-deleted "DarkRed"))

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



  (setq-default mode-line-format
    (list
      " %1"
      '(:eval (propertize
                (window-number-mode-line)
                'face
                'font-lock-type-face))

      ;; '(:eval (custom-update-persp-name))

      "%1 "
      ;; the buffer name; the file name as a tool tip
      '(:eval (propertize "%b " 'face 'font-lock-type-face
                'help-echo (buffer-file-name)))

      (propertize "%I" 'face 'font-lock-constant-face) ;; size

      " "

      ;; anzu
      anzu--mode-line-format

      ;; the current major mode for the buffer.
      " "
      '(:eval (propertize "%m" 'face 'font-lock-string-face
                'help-echo buffer-file-coding-system))

      ;; my-flycheck-mode-line
      ;; evil state
      '(:eval evil-mode-line-tag)

      ;; minor modes
      ;; minor-mode-alist
      ;; git info
      " "
      `(vc-mode vc-mode)
      " "

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
      "("
      (propertize "%4l" 'face 'font-lock-type-face)
      ","
      (propertize "%3c" 'face 'font-lock-type-face)
      ")"

      "    "
      '(:eval (buffer-encoding-abbrev))

      " "
      (propertize "%p" 'face 'font-lock-constant-face) ;; % above top

      "   " ;; insert vs overwrite mode, input-method in a tooltip
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
      ))



  (setq-default header-line-format
    '((:eval (if (buffer-file-name)
               (abbreviate-file-name (buffer-file-name))
               "%b"))))



  )

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))

(load custom-file 'no-error 'no-message)

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (set-face-background 'company-tooltip-selection "red")
  (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages '(evil-unimpaired f s dash)))

  (custom-set-faces

    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.

    ;; '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :slant normal :weight normal :height 130 :width normal))))
    )

  )
