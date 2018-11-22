;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(command-log-mode-window-size 50)
 '(company-dabbrev-minimum-length 3)
 '(company-dabbrev-other-buffers nil)
 '(company-show-numbers t)
 '(company-statistics-auto-restore nil)
 '(ctags-update-delay-seconds 1024)
 '(erc-nick "fri3nds")
 '(erc-port 6666)
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol t)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(expand-region-contract-fast-key "V")
 '(expand-region-exclude-text-mode-expansions (quote (html-mode nxml-mode web-mode)))
 '(expand-region-reset-fast-key "r")
 '(git-gutter+-added-sign " ")
 '(git-gutter+-deleted-sign " ")
 '(git-gutter+-modified-sign " ")
 '(git-gutter+-window-width 6)
 '(git-gutter:update-interval 0)
 '(global-command-log-mode nil)
 '(helm-buffer-max-length 56)
 '(helm-move-to-line-cycle-in-source t)
 '(ivy-height 18)
 '(lua-documentation-url "http://www.lua.org/manual/5.3/manual.html")
 '(magit-use-overlays nil)
 '(only-global-abbrevs t)
 '(org-agenda-custom-commands nil)
 '(org-agenda-ndays 1)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-text-search-extra-files (quote (agenda-archives)))
 '(org-deadline-warning-days 14)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-into-drawer t)
 '(org-pomodoro-play-sounds nil)
 '(org-reverse-note-order t)
 '(package-selected-packages
   (quote
    (helm-xref helm-projectile helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company dante lcr intero hlint-refactor hindent haskell-snippets company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode evil-indent-plus treepy graphql base16-theme vline pbcopy linum-relative evil-search-highlight-persist adaptive-wrap tide flycheck epl f dash s yasnippet packed all-the-icons memoize avy goto-chg undo-tree bind-key youdao-dictionary names chinese-word-at-point pos-tip yasnippet-snippets ws-butler wrap-region winum wgrep web-mode web-beautify visual-regexp-steroids visual-regexp uuidgen typescript-mode toc-org tiny tagedit stylus-mode string-inflection sql-indent spaceline-all-the-icons spaceline powerline solarized-theme smex slim-mode scss-mode sayid sass-mode reveal-in-osx-finder restart-emacs request rainbow-mode rainbow-delimiters pug-mode popwin persp-mode peep-dired password-generator paradox ox-reveal overseer osx-trash osx-dictionary org-pomodoro alert log4e gntp org-mime org-download org-bullets org-brain open-junk-file neotree nameless move-text mmm-mode markdown-toc markdown-mode magit-svn macrostep link-hint launchctl json-navigator json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc ivy-yasnippet ivy-xref ivy-hydra indent-guide impatient-mode simple-httpd ibuffer-projectile projectile hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indent-guides hierarchy helm-github-stars helm-ag haml-mode golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flx fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit magit magit-popup git-commit ghub with-editor evil-lion evil-iedit-state iedit evil-goggles evil-cleverparens smartparens evil-anzu anzu emmet-mode elisp-slime-nav editorconfig dumb-jump doom-themes discover-my-major makey counsel-css counsel swiper ivy company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company column-enforce-mode color-theme-sanityinc-tomorrow clojure-snippets clojure-cheatsheet helm helm-core popup clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu eval-sexp-fu highlight cider which-key use-package spinner sesman queue pkg-info pcre2el org-plus-contrib hydra font-lock+ evil dotenv-mode diminish clojure-mode centered-cursor-mode carbon-now-sh browse-at-remote bind-map auto-yasnippet auto-highlight-symbol auto-compile async all-the-icons-dired alect-themes aggressive-indent ace-window ace-link)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(sp-show-pair-from-inside t)
 '(tags-revert-without-query t)
 '(tramp-syntax (quote default) nil (tramp))
 '(vc-follow-symlinks t)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((t (:foreground "#d33682" :slant normal :weight bold))))
 '(ahs-face ((t (:foreground "#d33682" :weight bold))))
 '(command-log-command ((t (:foreground "dark magenta"))))
 '(command-log-key ((t (:foreground "dark cyan"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(iedit-occurrence ((t (:inherit cursor))))
 '(ivy-virtual ((t (:background "skyblue"))))
 '(js2-external-variable ((t (:foreground "plum3"))))
 '(mc/cursor-bar-face ((t (:background "chartreuse3"))))
 '(show-paren-match ((t (:background "dark gray" :foreground "#d33682" :weight bold))))
 '(sp-show-pair-match-face ((t (:background "#272822" :foreground "gray" :inverse-video t :weight normal))))
 '(web-mode-current-element-highlight-face ((t (:background "dark gray")))))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
