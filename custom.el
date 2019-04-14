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
 '(org-agenda-files
   (quote
    ("/Users/fri3nds/Dropbox/org/tuya-work.org" "/Users/fri3nds/org/notes.org")))
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
    (company-tabnine unicode-escape writeroom-mode visual-fill-column treemacs-projectile treemacs-evil treemacs ht pfuture prettier-js magit-svn ivy-yasnippet go-impl go-gen-test go-fill-struct gitignore-templates evil-goggles doom-modeline eldoc-eval shrink-path dotenv-mode transient lv names chinese-word-at-point pos-tip imenu-list visual-regexp powerline json-mode json-snatcher json-reformat js2-mode simple-httpd htmlize parent-mode hierarchy haml-mode with-editor popup makey go-mode inflections edn multiple-cursors paredit peg highlight spinner pkg-info clojure-mode epl f s packed all-the-icons memoize log4e gntp avy dash hydra bind-key spaceline async docker-tramp projectile markdown-mode flycheck diff-hl yasnippet-snippets ivy-xref ivy-hydra helm-ag evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit magit ghub evil-lion evil-indent-plus evil-iedit-state evil-cleverparens smartparens evil-anzu counsel-css counsel swiper ivy company-web company-tern company-statistics company-go company-ghci company-ghc company-cabal cider-eval-sexp-fu ace-window ace-link helm helm-core magit-popup company yasnippet cider evil youdao-dictionary yaml-mode ws-butler wrap-region winum window-purpose which-key wgrep web-mode web-completion-data web-beautify visual-regexp-steroids uuidgen use-package undo-tree typescript-mode treepy toc-org tiny tern tagedit stylus-mode string-inflection sql-indent spaceline-all-the-icons solarized-theme smex slim-mode sesman scss-mode sayid sass-mode reveal-in-osx-finder restart-emacs request rainbow-delimiters queue pug-mode popwin persp-mode peep-dired pcre2el password-generator paradox overseer org-plus-contrib org-mime org-bullets open-junk-file neotree nameless move-text mmm-mode markdown-toc macrostep linum-relative link-hint json-navigator js2-refactor js-doc ishikk intero indent-guide impatient-mode iedit ibuffer-projectile hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indent-guides haskell-snippets graphql goto-chg golden-ratio godoctor go-tag go-rename go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit ghc fzf fuzzy font-lock+ flx fill-column-indicator expand-region exec-path-from-shell eval-sexp-fu emmet-mode elisp-slime-nav editorconfig dumb-jump dockerfile-mode docker discover-my-major diminish dash-functional dante column-enforce-mode cmm-mode clojure-snippets clojure-cheatsheet clj-refactor centered-cursor-mode calfw-org calfw browse-at-remote bind-map auto-yasnippet auto-highlight-symbol auto-compile anzu all-the-icons-dired alert alect-themes aggressive-indent adaptive-wrap)))
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
