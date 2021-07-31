(setq fri3nds-misc-packages
      '(
        ;; helm-github-stars
        ;; helm
        ;; helm-ag
        projectile
        ;; prodigy
        ;; multiple-cursors
        ;; visual-regexp
        ;; visual-regexp-steroids
        ;; command-log
        evil
        ;; fcitx
        ;; discover-my-major
        ace-window
        ;; avy
        ;; 4clojure
        ;; persp-mode
        ;; tiny
        ;; smartparens
        ;; peep-dired
        markdown-mode
        swiper
        magit
        ;; git-messenger
        ;; wrap-region
        ;; browse-at-remote
        ))

;; (defun fri3nds-misc/init-browse-at-remote ()
;;   (use-package browse-at-remote
;;     :defer t
;;     :init (spacemacs/set-leader-keys "gho" 'browse-at-remote)))



;; copy from spacemacs helm layer
;;;; (defun fri3nds-misc/init-helm-ag ()
;;;;   (use-package helm-ag
;;;;     :defer t
;;;;     :init
;;;;     (progn
;;;;       (defun spacemacs//helm-do-ag-region-or-symbol (func &optional dir)
;;;;         "Search with `ag' with a default input."
;;;;         (require 'helm-ag)
;;;;         (cl-letf* (((symbol-value 'helm-ag-insert-at-point) 'symbol)
;;;;                    ;; make thing-at-point choosing the active region first
;;;;                    ((symbol-function 'this-fn) (symbol-function 'thing-at-point))
;;;;                    ((symbol-function 'thing-at-point)
;;;;                     (lambda (thing)
;;;;                       (let ((res (if (region-active-p)
;;;;                                      (buffer-substring-no-properties
;;;;                                       (region-beginning) (region-end))
;;;;                                    (this-fn thing))))
;;;;                         (when res (rxt-quote-pcre res))))))
;;;;           (funcall func dir)))
;;;;
;;;;       (defun spacemacs//helm-do-search-find-tool (base tools default-inputp)
;;;;         "Create a cond form given a TOOLS string list and evaluate it."
;;;;         (eval
;;;;          `(cond
;;;;            ,@(mapcar
;;;;               (lambda (x)
;;;;                 `((executable-find ,x)
;;;;                   ',(let ((func
;;;;                            (intern
;;;;                             (format (if default-inputp
;;;;                                         "spacemacs/%s-%s-region-or-symbol"
;;;;                                       "spacemacs/%s-%s")
;;;;                                     base x))))
;;;;                       (if (fboundp func)
;;;;                           func
;;;;                         (intern (format "%s-%s"  base x))))))
;;;;               tools)
;;;;            (t 'helm-do-grep))))
;;;;
;;;;       ;; Search in current file ----------------------------------------------
;;;;
;;;;       (defun spacemacs/helm-file-do-ag (&optional _)
;;;;         "Wrapper to execute `helm-ag-this-file.'"
;;;;         (interactive)
;;;;         (helm-ag-this-file))
;;;;
;;;;       (defun spacemacs/helm-file-do-ag-region-or-symbol ()
;;;;         "Search in current file with `ag' using a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-file-do-ag))
;;;;
;;;;       (defun spacemacs/helm-file-smart-do-search (&optional default-inputp)
;;;;         "Search in current file using `dotspacemacs-search-tools'.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'
;;;; If DEFAULT-INPUTP is non nil then the current region or symbol at point
;;;; are used as default input."
;;;;         (interactive)
;;;;         (call-interactively
;;;;          (spacemacs//helm-do-search-find-tool "helm-file-do"
;;;;                                               dotspacemacs-search-tools
;;;;                                               default-inputp)))
;;;;
;;;;       (defun spacemacs/helm-file-smart-do-search-region-or-symbol ()
;;;;         "Search in current file using `dotspacemacs-search-tools' with
;;;;  default input.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'."
;;;;         (interactive)
;;;;         (spacemacs/helm-file-smart-do-search t))
;;;;
;;;;       ;; Search in files -----------------------------------------------------
;;;;
;;;;       (defun spacemacs/helm-files-do-ag (&optional dir)
;;;;         "Search in files with `ag' using a default input."
;;;;         (interactive)
;;;;         (helm-do-ag dir))
;;;;
;;;;       (defun spacemacs/helm-files-do-ag-region-or-symbol ()
;;;;         "Search in files with `ag' using a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-files-do-ag))
;;;;
;;;;       (defun spacemacs/helm-files-do-ack (&optional dir)
;;;;         "Search in files with `ack'."
;;;;         (interactive)
;;;;         (let ((helm-ag-base-command "ack --nocolor --nogroup"))
;;;;           (helm-do-ag dir)))
;;;;
;;;;       (defun spacemacs/helm-files-do-ack-region-or-symbol ()
;;;;         "Search in files with `ack' using a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-files-do-ack))
;;;;
;;;;       (defun spacemacs/helm-files-do-pt (&optional dir)
;;;;         "Search in files with `pt'."
;;;;         (interactive)
;;;;         (let ((helm-ag-base-command "pt -e --nocolor --nogroup"))
;;;;           (helm-do-ag dir)))
;;;;
;;;;       (defun spacemacs/helm-files-do-pt-region-or-symbol ()
;;;;         "Search in files with `pt' using a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-files-do-pt))
;;;;
;;;;       (defun spacemacs/helm-files-smart-do-search (&optional default-inputp)
;;;;         "Search in opened buffers using `dotspacemacs-search-tools'.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'
;;;; If DEFAULT-INPUTP is non nil then the current region or symbol at point
;;;; are used as default input."
;;;;         (interactive)
;;;;         (call-interactively
;;;;          (spacemacs//helm-do-search-find-tool "helm-files-do"
;;;;                                               dotspacemacs-search-tools
;;;;                                               default-inputp)))
;;;;
;;;;       (defun spacemacs/helm-files-smart-do-search-region-or-symbol ()
;;;;         "Search in opened buffers using `dotspacemacs-search-tools'.
;;;; with default input.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'."
;;;;         (interactive)
;;;;         (spacemacs/helm-files-smart-do-search t))
;;;;
;;;;       ;; Search in buffers ---------------------------------------------------
;;;;
;;;;       (defun spacemacs/helm-buffers-do-ag (&optional _)
;;;;         "Wrapper to execute `helm-ag-buffers.'"
;;;;         (interactive)
;;;;         (helm-do-ag-buffers))
;;;;
;;;;       (defun spacemacs/helm-buffers-do-ag-region-or-symbol ()
;;;;         "Search in opened buffers with `ag' with a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-buffers-do-ag))
;;;;
;;;;       (defun spacemacs/helm-buffers-do-ack (&optional _)
;;;;         "Search in opened buffers with `ack'."
;;;;         (interactive)
;;;;         (let ((helm-ag-base-command "ack --nocolor --nogroup"))
;;;;           (helm-do-ag-buffers)))
;;;;
;;;;       (defun spacemacs/helm-buffers-do-ack-region-or-symbol ()
;;;;         "Search in opened buffers with `ack' with a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-buffers-do-ack))
;;;;
;;;;       (defun spacemacs/helm-buffers-do-pt (&optional _)
;;;;         "Search in opened buffers with `pt'."
;;;;         (interactive)
;;;;         (let ((helm-ag-base-command "pt -e --nocolor --nogroup"))
;;;;           (helm-do-ag-buffers)))
;;;;
;;;;       (defun spacemacs/helm-buffers-do-pt-region-or-symbol ()
;;;;         "Search in opened buffers with `pt' using a default input."
;;;;         (interactive)
;;;;         (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-buffers-do-pt))
;;;;
;;;;       (defun spacemacs/helm-buffers-smart-do-search (&optional default-inputp)
;;;;         "Search in opened buffers using `dotspacemacs-search-tools'.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'
;;;; If DEFAULT-INPUTP is non nil then the current region or symbol at point
;;;; are used as default input."
;;;;         (interactive)
;;;;         (call-interactively
;;;;          (spacemacs//helm-do-search-find-tool "helm-buffers-do"
;;;;                                               dotspacemacs-search-tools
;;;;                                               default-inputp)))
;;;;
;;;;       (defun spacemacs/helm-buffers-smart-do-search-region-or-symbol ()
;;;;         "Search in opened buffers using `dotspacemacs-search-tools' with
;;;; default input.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'."
;;;;         (interactive)
;;;;         (spacemacs/helm-buffers-smart-do-search t))
;;;;
;;;;       ;; Search in project ---------------------------------------------------
;;;;
;;;;       (defun spacemacs/helm-project-do-ag ()
;;;;         "Search in current project with `ag'."
;;;;         (interactive)
;;;;         (let ((dir (projectile-project-root)))
;;;;           (if dir
;;;;               (helm-do-ag dir)
;;;;             (message "error: Not in a project."))))
;;;;
;;;;       (defun spacemacs/helm-project-do-ag-region-or-symbol ()
;;;;         "Search in current project with `ag' using a default input."
;;;;         (interactive)
;;;;         (let ((dir (projectile-project-root)))
;;;;           (if dir
;;;;               (spacemacs//helm-do-ag-region-or-symbol 'helm-do-ag dir)
;;;;             (message "error: Not in a project."))))
;;;;
;;;;       (defun spacemacs/helm-project-do-ack ()
;;;;         "Search in current project with `ack'."
;;;;         (interactive)
;;;;         (let ((dir (projectile-project-root)))
;;;;           (if dir
;;;;               (spacemacs/helm-files-do-ack dir)
;;;;             (message "error: Not in a project."))))
;;;;
;;;;       (defun spacemacs/helm-project-do-ack-region-or-symbol ()
;;;;         "Search in current project with `ack' using a default input."
;;;;         (interactive)
;;;;         (let ((dir (projectile-project-root)))
;;;;           (if dir
;;;;               (spacemacs//helm-do-ag-region-or-symbol
;;;;                'spacemacs/helm-files-do-ack dir)
;;;;             (message "error: Not in a project."))))
;;;;
;;;;       (defun spacemacs/helm-project-do-pt ()
;;;;         "Search in current project with `pt'."
;;;;         (interactive)
;;;;         (let ((dir (projectile-project-root)))
;;;;           (if dir
;;;;               (spacemacs/helm-files-do-pt dir)
;;;;             (message "error: Not in a project."))))
;;;;
;;;;       (defun spacemacs/helm-project-do-pt-region-or-symbol ()
;;;;         "Search in current project with `pt' using a default input."
;;;;         (interactive)
;;;;         (let ((dir (projectile-project-root)))
;;;;           (if dir
;;;;               (spacemacs//helm-do-ag-region-or-symbol
;;;;                'spacemacs/helm-files-do-pt dir)
;;;;             (message "error: Not in a project."))))
;;;;
;;;;       (defun spacemacs/helm-project-smart-do-search (&optional default-inputp)
;;;;         "Search in current project using `dotspacemacs-search-tools'.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'
;;;; If DEFAULT-INPUTP is non nil then the current region or symbol at point
;;;; are used as default input."
;;;;         (interactive)
;;;;         (let ((projectile-require-project-root nil))
;;;;           (call-interactively
;;;;            (spacemacs//helm-do-search-find-tool "helm-project-do"
;;;;                                                 dotspacemacs-search-tools
;;;;                                                 default-inputp))))
;;;;
;;;;       (defun spacemacs/helm-project-smart-do-search-region-or-symbol ()
;;;;         "Search in current project using `dotspacemacs-search-tools' with
;;;;  default input.
;;;; Search for a search tool in the order provided by `dotspacemacs-search-tools'."
;;;;         (interactive)
;;;;         (spacemacs/helm-project-smart-do-search t))
;;;;
;;;;       ;; This overrides the default C-s action in helm-projectile-switch-project
;;;;       ;; to search using ag/pt/whatever instead of just grep
;;;;       (with-eval-after-load 'helm-projectile
;;;;         (defun spacemacs/helm-project-smart-do-search-in-dir (dir)
;;;;           (interactive)
;;;;           (let ((default-directory dir))
;;;;             (spacemacs/helm-project-smart-do-search)))
;;;;         (define-key helm-projectile-projects-map
;;;;           (kbd "C-s")
;;;;           (lambda ()
;;;;             (interactive)
;;;;             (helm-exit-and-execute-action
;;;;              'spacemacs/helm-project-smart-do-search-in-dir))))
;;;;
;;;;       ;; evilify the helm-grep buffer
;;;;       (evilified-state-evilify helm-grep-mode helm-grep-mode-map
;;;;         (kbd "RET") 'helm-grep-mode-jump-other-window
;;;;         (kbd "q") 'quit-window)
;;;;
;;;;       (spacemacs/set-leader-keys
;;;;         "sb"  'spacemacs/helm-buffers-smart-do-search
;;;;         "sB"  'spacemacs/helm-buffers-smart-do-search-region-or-symbol
;;;;         "sab" 'helm-do-ag-buffers
;;;;         "saB" 'spacemacs/helm-buffers-do-ag-region-or-symbol
;;;;         "skb" 'spacemacs/helm-buffers-do-ack
;;;;         "skB" 'spacemacs/helm-buffers-do-ack-region-or-symbol
;;;;         "stb" 'spacemacs/helm-buffers-do-pt
;;;;         "stB" 'spacemacs/helm-buffers-do-pt-region-or-symbol
;;;;         ;; current file scope
;;;;         "ss"  'spacemacs/helm-file-smart-do-search
;;;;         "sS"  'spacemacs/helm-file-smart-do-search-region-or-symbol
;;;;         "saa" 'helm-ag-this-file
;;;;         "saA" 'spacemacs/helm-file-do-ag-region-or-symbol
;;;;         ;; files scope
;;;;         "sf"  'spacemacs/helm-files-smart-do-search
;;;;         "sF"  'spacemacs/helm-files-smart-do-search-region-or-symbol
;;;;         "saf" 'helm-do-ag
;;;;         "skf" 'spacemacs/helm-files-do-ack
;;;;         "skF" 'spacemacs/helm-files-do-ack-region-or-symbol
;;;;         "stf" 'spacemacs/helm-files-do-pt
;;;;         "stF" 'spacemacs/helm-files-do-pt-region-or-symbol
;;;;         ;; current project scope
;;;;         "/"   'spacemacs/helm-project-smart-do-search
;;;;         "*"   'spacemacs/helm-project-smart-do-search-region-or-symbol
;;;;         "sp"  'spacemacs/helm-project-smart-do-search
;;;;         "sP"  'spacemacs/helm-project-smart-do-search-region-or-symbol
;;;;         "sap" 'spacemacs/helm-project-do-ag
;;;;         "saP" 'spacemacs/helm-project-do-ag-region-or-symbol
;;;;         "skp" 'spacemacs/helm-project-do-ack
;;;;         "skP" 'spacemacs/helm-project-do-ack-region-or-symbol
;;;;         "stp" 'spacemacs/helm-project-do-pt
;;;;         "stP" 'spacemacs/helm-project-do-pt-region-or-symbol))
;;;;     :config
;;;;     (progn
;;;;       (advice-add 'helm-ag--save-results :after 'spacemacs//gne-init-helm-ag)
;;;;       (evil-define-key 'normal helm-ag-map "SPC" spacemacs-default-map)
;;;;       (evilified-state-evilify helm-ag-mode helm-ag-mode-map
;;;;         (kbd "RET") 'helm-ag-mode-jump-other-window
;;;;         (kbd "gr") 'helm-ag--update-save-results
;;;;         (kbd "q") 'quit-window))))


;; (defun fri3nds-misc/init-peep-dired ()
;;   ;;preview files in dired
;;   (use-package peep-dired
;;     :defer t
;;     :commands (peep-dired-next-file
;;                peep-dired-prev-file)
;;     :bind (:map dired-mode-map
;;                 ("P" . peep-dired))))


(defun fri3nds-misc/post-init-smartparens ()
  (use-package smartparens
    :defer t
    :init
    ;; (progn
    ;;   (global-set-key (kbd "C-(") 'wrap-sexp-with-new-round-parens))
    :config
    (progn
      (setq sp-highlight-pair-overlay nil)

      (evil-define-key 'normal sp-keymap
        (kbd ")>") 'sp-forward-slurp-sexp
        (kbd ")<") 'sp-forward-barf-sexp
        (kbd "(>") 'sp-backward-barf-sexp
        (kbd "(<") 'sp-backward-slurp-sexp))))

;; (defun fri3nds-misc/init-tiny ()
;;   (use-package tiny
;;     :defer t
;;     :init
;;     (spacemacs/set-leader-keys "oe" 'tiny-expand)))

;;;; (defun fri3nds-misc/post-init-helm ()
;;;;   (with-eval-after-load 'helm
;;;;     (progn
;;;;       ;; limit max number of matches displayed for speed
;;;;       (setq helm-candidate-number-limit 100)
;;;;       ;; ignore boring files like .o and .a
;;;;       (setq helm-ff-skip-boring-files t)
;;;;       ;; replace locate with spotlight on Mac
;;;;       (setq helm-locate-command "mdfind -name %s %s")
;;;;       (push "\\.emlx$" helm-boring-file-regexp-list)
;;;;       )
;;;;     ))

;;;; (defun fri3nds-misc/init-helm-github-stars ()
;;;;   (use-package helm-github-stars
;;;;     :commands (helm-github-stars)
;;;;     :init
;;;;     (setq helm-github-stars-username "fri3nds")))




;; (defun fri3nds-misc/post-init-fcitx ()
;;   (fcitx-aggressive-setup))

;; (defun fri3nds-misc/post-init-command-log ()
;;   (with-eval-after-load 'global-command-log-mode
;;     (setq clm/log-command-exceptions* (append clm/log-command-exceptions*
;;                                               '(evil-next-visual-line
;;                                                 evil-previous-visual-line)))))



;; (defun fri3nds-misc/init-litable ()
;;   (use-package litable
;;     :init
;;     :defer t))

;; (defun fri3nds-misc/init-osx-dictionary ()
;;   (use-package osx-dictionary
;;     :init
;;     (progn
;;       (evilified-state-evilify osx-dictionary-mode osx-dictionary-mode-map)
;;       (setq osx-dictionary-use-chinese-text-segmentation t)
;;       (global-set-key (kbd "C-c d") 'osx-dictionary-search-pointer)
;;       )))


;; (defun fri3nds-misc/init-4clojure ()
;;   (use-package 4clojure
;;     :init
;;     (progn
;;       (spacemacs/declare-prefix "o4" "4clojure")
;;       (spacemacs/set-leader-keys "o4q" '4clojure-open-question)
;;       (spacemacs/set-leader-keys "o4n" '4clojure-next-question)
;;       (spacemacs/set-leader-keys "o4p" '4clojure-previous-question)
;;       (spacemacs/set-leader-keys "o4c" '4clojure-check-answers)
;;       )))


;; (defun fri3nds-misc/post-init-avy ()
;;   (progn
;;     (global-set-key (kbd "C-s-'") 'avy-goto-char-2)
;;     (global-set-key (kbd "M-'") 'avy-goto-char-2)))

(defun fri3nds-misc/post-init-ace-window ()
  (global-set-key (kbd "C-x C-o") #'ace-window))

;; (defun fri3nds-misc/init-discover-my-major ()
;;   (use-package discover-my-major
;;     :defer t
;;     :init
;;     (progn
;;       (spacemacs/set-leader-keys (kbd "mhm") 'discover-my-major)
;;       (evilified-state-evilify makey-key-mode makey-key-mode-get-key-map)
;;       )))


;; (defun fri3nds-misc/post-init-elfeed ()
;;   (use-package elfeed
;;     :init
;;     (global-set-key (kbd "C-x w") 'elfeed)
;;     :defer t
;;     :config
;;     (progn

;;       (setq elfeed-feeds
;;             '("http://nullprogram.com/feed/"
;;               "http://z.caudate.me/rss/"
;;               "http://irreal.org/blog/?feed=rss2"
;;               "http://feeds.feedburner.com/LostInTheTriangles"
;;               "http://tonybai.com/feed/"
;;               "http://planet.emacsen.org/atom.xml"
;;               "http://feeds.feedburner.com/emacsblog"
;;               "http://blog.binchen.org/rss.xml"
;;               "http://oremacs.com/atom.xml"
;;               "http://blog.gemserk.com/feed/"
;;               "http://www.masteringemacs.org/feed/"
;;               "http://t-machine.org/index.php/feed/"
;;               "http://gameenginebook.blogspot.com/feeds/posts/default"
;;               "http://feeds.feedburner.com/ruanyifeng"
;;               "http://coolshell.cn/feed"
;;               "http://blog.devtang.com/atom.xml"
;;               "http://emacsist.com/rss"
;;               "http://puntoblogspot.blogspot.com/feeds/2507074905876002529/comments/default"
;;               "http://angelic-sedition.github.io/atom.xml"))

;;       ;; (evilify elfeed-search-mode elfeed-search-mode-map)
;;       (evilified-state-evilify-map elfeed-search-mode-map
;;         :mode elfeed-search-mode
;;         :bindings
;;         "G" 'elfeed-update
;;         "g" 'elfeed-search-update--force)

;;       (defun zilong/elfeed-mark-all-as-read ()
;;         (interactive)
;;         (mark-whole-buffer)
;;         (elfeed-search-untag-all-unread))

;;       (define-key elfeed-search-mode-map (kbd "R") 'zilong/elfeed-mark-all-as-read)

;;       (defadvice elfeed-show-yank (after elfeed-show-yank-to-kill-ring activate compile)
;;         "Insert the yanked text from x-selection to kill ring"
;;         (kill-new (x-get-selection)))

;;       (ad-activate 'elfeed-show-yank))))

(defun fri3nds-misc/post-init-evil ()
  (progn
    (setcdr evil-insert-state-map nil)
    (define-key evil-insert-state-map [escape] 'evil-normal-state)

    ;; disable highlight when use swiper or evil ex search, this option won't effect evil-ex-search-next command
    (setq-default evil-ex-search-persistent-highlight nil)

    (push "TAGS" spacemacs-useless-buffers-regexp)

    ;; ;; change evil initial mode state
    ;; (loop for (mode . state) in
    ;;       '((shell-mode . normal))
    ;;       do (evil-set-initial-state mode state))

    ;;mimic "nzz" behaviou in vim
    (defadvice evil-search-next (after advice-for-evil-search-next activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

    (defadvice evil-search-previous (after advice-for-evil-search-previous activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

    (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

    (defun my-evil-yank ()
      (interactive)
      (save-excursion
        (call-interactively 'evil-yank))
      (backward-char))

    (define-key evil-visual-state-map (kbd "y") 'my-evil-yank)

    (define-key evil-normal-state-map
      (kbd "Y") 'fri3nds/yank-to-end-of-line)

    (define-key evil-normal-state-map
      (kbd "K") 'fri3nds/yank-begin-to-end-of-line)
    ;; rebind g,k to gj and gk
    ;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    ;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

    (define-key evil-normal-state-map (kbd "[ SPC") (lambda () (interactive) (evil-insert-newline-above) (forward-line)))
    (define-key evil-normal-state-map (kbd "] SPC") (lambda () (interactive) (evil-insert-newline-below) (forward-line -1)))


    (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
    (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
    (define-key evil-normal-state-map (kbd "M-y") 'counsel-yank-pop)

    ;; (define-key evil-insert-state-map "\C-e" 'end-of-line)
    ;; (define-key evil-insert-state-map "\C-n" 'next-line)
    ;; (define-key evil-insert-state-map "\C-k" 'kill-line)
    (define-key evil-emacs-state-map (kbd "s-f") 'forward-word)
    (define-key evil-insert-state-map (kbd "s-f") 'forward-word)
    (define-key evil-emacs-state-map (kbd "s-b") 'backward-word)
    (define-key evil-insert-state-map (kbd "s-b") 'backward-word)

    (spacemacs/set-leader-keys "bi" 'ibuffer)
    (define-key evil-ex-completion-map "\C-a" 'move-beginning-of-line)
    (define-key evil-ex-completion-map "\C-b" 'backward-char)
    (define-key evil-ex-completion-map "\C-k" 'kill-line)
    ;; (define-key minibuffer-local-map (kbd "C-w") 'evil-delete-backward-word)

    (define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
    ;; (define-key evil-visual-state-map (kbd "x") 'er/expand-region)
    ;; (define-key evil-visual-state-map (kbd "X") 'er/contract-region)
    ;; (define-key evil-visual-state-map (kbd "C-r") 'fri3nds/evil-quick-replace)
    (define-key evil-visual-state-map (kbd "mn") 'mc/mark-next-like-this)
    (define-key evil-visual-state-map (kbd "mp") 'mc/mark-previous-like-this)
    (define-key evil-visual-state-map (kbd "ma") 'mc/mark-all-like-this)
    (define-key evil-visual-state-map (kbd "mf") 'mc/mark-all-like-this-in-defun)


    ;; in spacemacs, we always use evilify miscro state
    (evil-add-hjkl-bindings package-menu-mode-map 'emacs)
    ;; Don't move back the cursor one position when exiting insert mode
    ;; (setq evil-move-cursor-back nil)

    ;; (define-key evil-emacs-state-map (kbd "C-w h") 'evil-window-left)
    ;; (define-key evil-emacs-state-map (kbd "C-w") 'evil-delete-backward-word)
    ;; (define-key evil-emacs-state-map (kbd "C-w j") 'evil-window-down)
    ;; (define-key evil-emacs-state-map (kbd "C-w k") 'evil-window-up)
    ;; (define-key evil-emacs-state-map (kbd "C-w l") 'evil-window-right)

    ;; for emacs shell mode
    ;; (define-key evil-emacs-state-map (kbd "s-b") 'ido-switch-buffer)
    ;; (define-key evil-emacs-state-map (kbd "s-f") 'ido-find-file)
    ;; (evil-define-key 'emacs term-raw-map (kbd "C-w")
    ;;   'evil-delete-backward-word)


    (setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
          evil-emacs-state-tag    (propertize "[E]" 'face '((:background "SkyBlue2" :foreground "black")))
          evil-insert-state-tag   (propertize "[I]" 'face '((:background "chartreuse3") :foreground "white"))
          evil-motion-state-tag   (propertize "[M]" 'face '((:background "plum3") :foreground "white"))
          evil-visual-state-tag   (propertize "[V]" 'face '((:background "gray" :foreground "black")))
          evil-operator-state-tag (propertize "[O]" 'face '((:background "purple"))))
    (setq evil-insert-state-cursor '("chartreuse3" bar))
    (define-key evil-insert-state-map (kbd "C-z") 'evil-emacs-state)
    ;; This will break visual column edit
    ;; enable hybrid editing style
    ;; (defadvice evil-insert-state (around fri3nds/holy-mode activate)
    ;;   "Preparing the holy water flasks."
    ;;   (evil-emacs-state))
    ;; disable c-[ temporally
    ;; (define-key input-decode-map [?\C-\[] (kbd "<C-[>"))
    ;; (bind-keys ("<C-[>" . evil-normal-state))
    ;; (setq evil-emacs-state-cursor '("chartreuse3" (bar . 2)))
    ;; (define-key evil-emacs-state-map [escape] 'evil-normal-state)
    ))

;; (defun fri3nds-misc/init-visual-regexp ()
;;   (use-package visual-regexp
;;     :commands (vr/replace vr/query-replace)))

;; (defun fri3nds-misc/init-visual-regexp-steroids ()
;;   (use-package visual-regexp-steroids
;;     :commands (vr/select-replace vr/select-query-replace)
;;     :init
;;     (progn
;;       (define-key global-map (kbd "C-c r") 'vr/replace)
;;       (define-key global-map (kbd "C-c q") 'vr/query-replace))))

;; (defun fri3nds-misc/init-multiple-cursors ()
;;   (use-package multiple-cursors
;;     :init
;;     (progn

;;       (bind-key* "C-s-l" 'mc/edit-lines)
;;       (bind-key* "C-s-f" 'mc/mark-all-dwim)
;;       (bind-key* "C-s-." 'mc/mark-next-like-this)
;;       (bind-key* "C-s-," 'mc/mark-previous-like-this)
;;       (bind-key* "s->" 'mc/unmark-next-like-this)
;;       (bind-key* "s-<" 'mc/unmark-previous-like-this)
;;       (bind-key* "C-c C-s-." 'mc/mark-all-like-this)

;;       ;; http://endlessparentheses.com/multiple-cursors-keybinds.html?source=rss
;;       (define-prefix-command 'endless/mc-map)
;;       ;; C-x m is usually `compose-mail'. Bind it to something
;;       ;; else if you use this command.
;;       (define-key ctl-x-map "m" 'endless/mc-map)
;; ;;; Really really nice!
;;       (define-key endless/mc-map "i" #'mc/insert-numbers)
;;       (define-key endless/mc-map "h" #'mc-hide-unmatched-lines-mode)
;;       (define-key endless/mc-map "a" #'mc/mark-all-like-this)

;; ;;; Occasionally useful
;;       (define-key endless/mc-map "d" #'mc/mark-all-symbols-like-this-in-defun)
;;       (define-key endless/mc-map "s" #'mc/sort-regions)
;;       (define-key endless/mc-map "l" #'mc/edit-lines)
;;       (define-key endless/mc-map "\C-a" #'mc/edit-beginnings-of-lines)
;;       (define-key endless/mc-map "\C-e" #'mc/edit-ends-of-lines)
;;       )
;;     :config
;;     (setq mc/cmds-to-run-once
;;           '(
;;             counsel-M-x
;;             fri3nds/my-mc-mark-next-like-this))
;;     (setq mc/cmds-to-run-for-all
;;           '(
;;             electric-newline-and-maybe-indent
;;             hungry-delete-backward
;;             spacemacs/backward-kill-word-or-region
;;             spacemacs/smart-move-beginning-of-line
;;             evil-substitute
;;             lispy-move-beginning-of-line
;;             lispy-move-end-of-line
;;             lispy-space
;;             lispy-delete-backward
;;             evil-exit-visual-state
;;             evil-backward-char
;;             evil-delete-char
;;             evil-escape-emacs-state
;;             evil-escape-insert-state
;;             mwim-beginning-of-code-or-line
;;             mwim-end-of-line-or-code
;;             evil-exit-emacs-state
;;             evil-previous-visual-line
;;             evil-next-visual-line
;;             evil-forward-char
;;             evil-insert
;;             evil-next-line
;;             evil-normal-state
;;             evil-previous-line
;;             evil-append
;;             evil-append-line
;;             forward-sentence
;;             kill-sentence
;;             org-self-insert-command
;;             sp-backward-delete-char
;;             sp-delete-char
;;             sp-remove-active-pair-overlay
;;             orgtbl-hijacker-command-109))
;;     ))

;; (defun fri3nds-misc/post-init-persp-mode ()
;;   (setq persp-kill-foreign-buffer-action 'kill)
;;   (setq persp-lighter nil)
;;   (when (fboundp 'spacemacs|define-custom-layout)
;;     (spacemacs|define-custom-layout "@Cocos2D-X"
;;       :binding "c"
;;       :body
;;       (find-file "~/cocos2d-x/cocos/ui/UIWidget.cpp")
;;       (split-window-right)
;;       (find-file "~/cocos2d-x/cocos/cocos2d.cpp"))))

(defun fri3nds-misc/post-init-chinese-wbim ()
  (progn
    (bind-key* ";" 'chinese-wbim-insert-ascii)
    (setq chinese-wbim-punc-translate-p nil)
    (spacemacs/declare-prefix "ot" "Toggle")
    (spacemacs/set-leader-keys
      "otp" 'chinese-wbim-punc-translate-toggle)
    (setq chinese-wbim-wb-use-gbk t)
    (add-hook 'chinese-wbim-wb-load-hook
              (lambda ()
                (let ((map (chinese-wbim-mode-map)))
                  (define-key map "-" 'chinese-wbim-previous-page)
                  (define-key map "=" 'chinese-wbim-next-page))))
    ))


(defun fri3nds-misc/post-init-evil-escape ()
  (setq evil-escape-delay 0.1))

;; (defun fri3nds-misc/init-find-file-in-project ()
;;   (use-package find-file-in-project
;;     :defer t
;;     :config
;;     (progn
;;       ;; If you use other VCS (subversion, for example), enable the following option
;;       ;;(setq ffip-project-file ".svn")
;;       ;; in MacOS X, the search file command is CMD+p
;;       ;; for this project, I'm only interested certain types of files
;;       (setq-default ffip-patterns '("*.html" "*.js" "*.css" "*.java" "*.xml" "*.cpp" "*.h" "*.c" "*.mm" "*.m" "*.el"))
;;       ;; if the full path of current file is under SUBPROJECT1 or SUBPROJECT2
;;       ;; OR if I'm reading my personal issue track document,
;;       (defadvice find-file-in-project (before my-find-file-in-project activate compile)
;;         (when (ffip-current-full-filename-match-pattern-p "\\(/fireball\\)")
;;           ;; set the root directory into "~/projs/PROJECT_DIR"
;;           (setq-local ffip-project-root "~/Github/fireball")
;;           ;; well, I'm not interested in concatenated BIG js file or file in dist/
;;           (setq-local ffip-find-options "-not -size +64k -not -iwholename '*/bin/*'")
;;           ;; do NOT search files in below directories, the default value is better.
;;           (dolist (item '("*/docs/html/*" "*.meta" "*/cocos2d-x/*" "*.asset" "*/visual-tests/res/*"))
;;             (push item  ffip-prune-patterns)))
;;         (when (ffip-current-full-filename-match-pattern-p "\\(/cocos2d-x\\)")
;;           ;; set the root directory into "~/projs/PROJECT_DIR"
;;           (setq-local ffip-project-root "~/cocos2d-x")
;;           ;; well, I'm not interested in concatenated BIG js file or file in dist/
;;           (setq-local ffip-find-options "-not -size +64k -not -iwholename '*/bin/*'")
;;           ;; do NOT search files in below directories, the default value is better.
;;           ;; (setq-default ffip-prune-patterns '(".git" ".hg" "*.svn" "node_modules" "bower_components" "obj"))
;;           ))
;;       (ad-activate 'find-file-in-project))))




(defun fri3nds-misc/post-init-projectile ()
  (progn
    (with-eval-after-load 'projectile
      (progn
        (setq projectile-completion-system 'ivy)
        (add-to-list 'projectile-other-file-alist '("html" "js"))
        (add-to-list 'projectile-other-file-alist '("js" "html"))))

    (defvar my-simple-todo-regex "\\(FIXME\\|TODO\\|BUG\\)")

    (defun my-simple-todo ()
      "When in a project, create a `multi-occur' buffer matching the
  regex in `my-simple-todo-regex' across all buffers in the
  current project. Otherwise do `occur' in the current file."
      (interactive)
      (if (projectile-project-p)
          (multi-occur (projectile-project-buffers) my-simple-todo-regex)
        (occur my-simple-todo-regex)))

    (spacemacs/set-leader-keys "kt" 'my-simple-todo)))



;; (defun fri3nds-misc/post-init-prodigy ()
;;   (progn
;;     (prodigy-define-tag
;;       :name 'jekyll
;;       :env '(("LANG" "en_US.UTF-8")
;;              ("LC_ALL" "en_US.UTF-8")))
;;     ;; define service
;;     (prodigy-define-service
;;       :name "Preview cocos2d-x web"
;;       :command "python"
;;       :args '("-m" "SimpleHTTPServer" "6001")
;;       :cwd "~/cocos2d-x/web"
;;       :tags '(work)
;;       :kill-signal 'sigkill
;;       :kill-process-buffer-on-stop t)

;;     (prodigy-define-service
;;       :name "Preview creator engine"
;;       :command "python"
;;       :args '("-m" "SimpleHTTPServer" "6004")
;;       :cwd "~/Github/fireball/engine"
;;       :tags '(work)
;;       :kill-signal 'sigkill
;;       :kill-process-buffer-on-stop t)

;;     (prodigy-define-service
;;       :name "Hexo Server"
;;       :command "hexo"
;;       :args '("server")
;;       :cwd blog-admin-dir
;;       :tags '(hexo server)
;;       :kill-signal 'sigkill
;;       :kill-process-buffer-on-stop t)

;;     (prodigy-define-service
;;       :name "Hexo Deploy"
;;       :command "hexo"
;;       :args '("deploy" "--generate")
;;       :cwd blog-admin-dir
;;       :tags '(hexo deploy)
;;       :kill-signal 'sigkill
;;       :kill-process-buffer-on-stop t)

;;     (prodigy-define-service
;;       :name "Debug Fireball"
;;       :command "npm"
;;       :args '("start" "--" "--nologin" "/Users/guanghui/Github/example-cases")
;;       :cwd "~/Github/fireball/"
;;       :tags '(work)
;;       :kill-signal 'sigkill
;;       :kill-process-buffer-on-stop t)

;;     (prodigy-define-service
;;       :name "Org wiki preview"
;;       :command "python"
;;       :args '("-m" "SimpleHTTPServer" "8088")
;;       :cwd "~/org-notes/public_html"
;;       :tags '(org-mode)
;;       :init (lambda () (browse-url "http://localhost:8088"))
;;       :kill-signal 'sigkill
;;       :kill-process-buffer-on-stop t)

;;     ;; add watch for prodigy-view-mode buffer change event
;;     (add-hook 'prodigy-view-mode-hook
;;               #'(lambda() (set (make-local-variable 'after-change-functions) #'refresh-chrome-current-tab)))

;;     ))

(defun fri3nds-misc/init-moz-controller ()
  (use-package moz-controller
    :init
    (progn
      (moz-controller-global-mode t)
      (spacemacs|hide-lighter moz-controller-mode))))


(defun fri3nds-misc/init-ag ()
  (use-package ag
    :init))

;; (defun fri3nds-misc/post-init-erc ()
;;   (progn
;;     (add-hook 'erc-text-matched-hook 'my-erc-hook)
;;     (spaceline-toggle-erc-track-off)))

;; (defun fri3nds-misc/init-wrap-region ()
;;   (use-package wrap-region
;;     :init
;;     (progn
;;       (wrap-region-global-mode t)
;;       (wrap-region-add-wrappers
;;        '(("$" "$")
;;          ("{-" "-}" "#")
;;          ("/" "/" nil ruby-mode)
;;          ("/* " " */" "#" (java-mode javascript-mode css-mode js2-mode))
;;          ("`" "`" nil (markdown-mode ruby-mode))))
;;       (add-to-list 'wrap-region-except-modes 'dired-mode)
;;       (add-to-list 'wrap-region-except-modes 'web-mode)
;;       )
;;     :defer t
;;     :config
;;     (spacemacs|hide-lighter wrap-region-mode)))



(defun fri3nds-misc/init-keyfreq ()
  (use-package keyfreq
    :init
    (progn
      (keyfreq-mode t)
      (keyfreq-autosave-mode 1))))


(defun fri3nds-misc/post-init-swiper ()
  "Initialize my package"
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)


    (evilified-state-evilify ivy-occur-mode ivy-occur-mode-map)

    (use-package ivy
      :defer t
      :config
      (progn
        (spacemacs|hide-lighter ivy-mode)

        ;; (ivy-set-actions
        ;;  t
        ;;  '(("f" my-find-file-in-git-repo "find files")
        ;;    ;; ("!" my-open-file-in-external-app "Open file in external app")
        ;;    ;; ("I" ivy-insert-action "insert")
        ;;    ;; ("C" ivy-kill-new-action "copy")
        ;;    ;; ("S" ivy-ff-checksum-action "Checksum")
        ;;    ))

        ;; (spacemacs/set-leader-keys "fad" 'counsel-goto-recent-directory)
        ;; (spacemacs/set-leader-keys "faf" 'counsel-find-file-recent-directory)

        (setq ivy-initial-inputs-alist nil)
        (setq ivy-wrap t)
        (setq confirm-nonexistent-file-or-buffer t)

        ;; (when (not (configuration-layer/layer-usedp 'helm))
        ;;   (spacemacs/set-leader-keys "sp" 'counsel-git-grep)
        ;;   (spacemacs/set-leader-keys "sP" 'spacemacs/counsel-git-grep-region-or-symbol))
        (define-key ivy-minibuffer-map (kbd "C-c o") 'ivy-occur)
        ;; (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-call)
        ;; (define-key ivy-minibuffer-map (kbd "C-s-m") 'ivy-partial-or-done)
        ;; (define-key ivy-minibuffer-map (kbd "C-c s") 'ivy-ff-checksum)
        ;; (define-key ivy-minibuffer-map (kbd "s-o") 'ivy-dispatching-done-hydra)
        ;; (define-key ivy-minibuffer-map (kbd "C-c C-e") 'spacemacs//counsel-edit)
        ;; (define-key ivy-minibuffer-map (kbd "<f3>") 'ivy-occur)
        ;; (define-key ivy-minibuffer-map (kbd "C-s-j") 'ivy-immediate-done)
        (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
        (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)))

    ;; (define-key global-map (kbd "C-s") 'my-swiper-search)

    ))


(defun fri3nds-misc/post-init-magit ()
  (progn
    (with-eval-after-load 'magit
      (progn
        (add-to-list 'magit-no-confirm 'stage-all-changes)
        (define-key magit-log-mode-map (kbd "W") 'magit-copy-section-value)
        ;; (define-key magit-status-mode-map (kbd "s-1") 'magit-jump-to-unstaged)
        ;; (define-key magit-status-mode-map (kbd "s-2") 'magit-jump-to-untracked)
        ;; (define-key magit-status-mode-map (kbd "s-3") 'magit-jump-to-staged)
        ;; (define-key magit-status-mode-map (kbd "s-4") 'magit-jump-to-stashes)
        (setq magit-completing-read-function 'magit-builtin-completing-read)

        (magit-define-popup-switch 'magit-push-popup ?u
          "Set upstream" "--set-upstream")
        ))

    ;; prefer two way ediff
    (setq magit-ediff-dwim-show-on-hunks t)
    ;; (setq magit-repository-directories '("~/cocos2d-x/"))
    (setq magit-push-always-verify nil)

    ;; (eval-after-load 'magit
    ;;   '(define-key magit-mode-map (kbd "C-c g")
    ;;      #'fri3nds/magit-visit-pull-request))
    (setq magit-process-popup-time 10)))

;; (defun fri3nds-misc/post-init-git-messenger ()
;;   (use-package git-messenger
;;     :defer t
;;     :config
;;     (progn
;;       (define-key git-messenger-map (kbd "f") 'zilong/github-browse-commit))))

(defun fri3nds-misc/post-init-markdown-mode ()
  (progn
    (add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))

    (with-eval-after-load 'markdown-mode
      (progn
        ;;     ;; (when (configuration-layer/package-usedp 'company)
        ;;     ;;   (spacemacs|add-company-hook markdown-mode))

        ;;     (spacemacs/set-leader-keys-for-major-mode 'gfm-mode-map
        ;;       "p" 'fri3nds/markdown-to-html)
        ;;     (spacemacs/set-leader-keys-for-major-mode 'markdown-mode
        ;;       "p" 'fri3nds/markdown-to-html)

        (evil-define-key 'normal markdown-mode-map (kbd "TAB") 'markdown-cycle)
        ))
    ))
