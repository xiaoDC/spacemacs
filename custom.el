;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(command-log-mode-window-size 50)
 '(company-dabbrev-minimum-length 3)
 '(company-dabbrev-other-buffers nil)
 '(company-show-numbers t)
 '(company-statistics-auto-restore nil)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(erc-nick "fri3nd")
 '(erc-port 6666)
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol t)
 '(exec-path-from-shell-arguments '("-l"))
 '(expand-region-contract-fast-key "V")
 '(expand-region-exclude-text-mode-expansions '(html-mode nxml-mode web-mode))
 '(expand-region-reset-fast-key "r")
 '(fci-rule-color "#073642" t)
 '(git-gutter+-added-sign " ")
 '(git-gutter+-deleted-sign " ")
 '(git-gutter+-modified-sign " ")
 '(git-gutter+-window-width 6)
 '(git-gutter:update-interval 0)
 '(global-command-log-mode nil)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900") t)
 '(ivy-height 18)
 '(lua-documentation-url "http://www.lua.org/manual/5.3/manual.html")
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(only-global-abbrevs t)
 '(org-agenda-custom-commands nil)
 '(org-agenda-files
   '("~/Dropbox/org/tuya-work.org" "~/org/Learning.org" "~/org/notes.org" "~/org/Learning.org" "~/org/malfunction.org"))
 '(org-agenda-ndays 1)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-text-search-extra-files '(agenda-archives))
 '(org-deadline-warning-days 14)
 '(org-fast-tag-selection-single-key 'expert)
 '(org-log-into-drawer t)
 '(org-pomodoro-play-sounds nil)
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(yasnippet-snippets yaml-mode ws-butler writeroom-mode visual-fill-column wrap-region winum window-purpose imenu-list wgrep web-beautify visual-regexp-steroids visual-regexp uuidgen typescript-mode treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org tiny symbol-overlay string-inflection spaceline-all-the-icons spaceline all-the-icons memoize powerline solarized-theme smex reveal-in-osx-finder restart-emacs request prettier-js posframe popwin persp-mode peep-dired password-generator paradox overseer org-mime org-cliplink org-bullets open-junk-file nodejs-repl nameless move-text magit-svn magit-section macrostep lsp-ui lsp-ivy link-hint json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc ivy-yasnippet ivy-xref ivy-hydra indent-guide ibuffer-projectile hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indent-guides golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-link fuzzy format-sql format-all language-id flycheck-pos-tip pos-tip flycheck-package package-lint flycheck flycheck-elsa flx expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-magit magit git-commit with-editor transient evil-indent-plus evil-iedit-state evil-goggles evil-cleverparens smartparens evil-anzu anzu emr iedit clang-format projectile paredit list-utils elisp-slime-nav editorconfig dumb-jump popup doom-themes discover-my-major makey diff-hl devdocs dap-mode lsp-treemacs bui lsp-mode treemacs pfuture markdown-mode ht dash-functional cyberpunk-theme counsel swiper ivy company-go go-mode company column-enforce-mode clojure-snippets cider-eval-sexp-fu eval-sexp-fu cider sesman spinner queue pkg-info parseedn clojure-mode parseclj a epl centered-cursor-mode calfw-org calfw browse-at-remote f dash s auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed alert log4e gntp aggressive-indent ace-window ace-link avy abyss-theme which-key use-package pcre2el org-plus-contrib hydra lv hybrid-mode font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(ring-bell-function 'ignore)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(sp-show-pair-from-inside t)
 '(spacemacs-theme-custom-colors
   '((bg1 if
          (eq variant 'dark)
          (if
              (true-color-p)
              "#222226" "#262626")
          (if
              (true-color-p)
              "#fbf8ef" "#ffffff"))
     (bg2 if
          (eq variant 'dark)
          (if
              (true-color-p)
              "#17181B" "#1c1c1c")
          (if
              (true-color-p)
              "#efeae9" "#e4e4e4"))
     (comment-bg if
                 (eq variant 'dark)
                 (if
                     (true-color-p)
                     "#23282A" "#262626")
                 (if
                     (true-color-p)
                     "#ecf3ec" "#ffffff"))
     (highlight if
                (eq variant 'dark)
                (if
                    (true-color-p)
                    "#61526E" "#444444")
                (if
                    (true-color-p)
                    "#d3d3e7" "#d7d7ff"))
     (act2 if
           (eq variant 'dark)
           (if
               (true-color-p)
               "#603D8E" "#444444")
           (if
               (true-color-p)
               "#d3d3e7" "#d7d7ff"))
     (border if
             (eq variant 'dark)
             (if
                 (true-color-p)
                 "#603D8E" "#444444")
             (if
                 (true-color-p)
                 "#d3d3e7" "#d7d7ff"))))
 '(tags-revert-without-query t)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tramp-syntax 'default nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#c9485ddd1797")
     (60 . "#bf7e73b30bcb")
     (80 . "#b58900")
     (100 . "#a5a58ee30000")
     (120 . "#9d9d91910000")
     (140 . "#9595943e0000")
     (160 . "#8d8d96eb0000")
     (180 . "#859900")
     (200 . "#67119c4632dd")
     (220 . "#57d79d9d4c4c")
     (240 . "#489d9ef365ba")
     (260 . "#3963a04a7f29")
     (280 . "#2aa198")
     (300 . "#288e98cbafe2")
     (320 . "#27c19460bb87")
     (340 . "#26f38ff5c72c")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
