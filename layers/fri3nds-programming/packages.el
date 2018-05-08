;;; packages.el --- fri3nds Layer packages File for Spacemacs
;;
;; Copyright (c) 2014-2016 fri3nds
;;
;; Author: fri3nds <guanghui8827@gmail.com>
;; URL: https://github.com/fri3nds/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.

(setq fri3nds-programming-packages
      '(
        paredit
        lispy
        ;; cmake-font-lock
        ;; cmake-mode
        ;; flycheck
        ;; nodejs-repl
        ;; (nodejs-repl-eval :location local)
        ;; js2-mode
        ;; js2-refactor
        yasnippet
        ;; js-doc
        ;; (cc-mode :location built-in)
        ;; flycheck-clojure
        ;; etags-select
        (python :location built-in)
        (emacs-lisp :location built-in)
        ;; clojure-mode
        company
        (eldoc :location built-in)
        dumb-jump
        graphviz-dot-mode
        ;; editorconfig
        ))


(defun fri3nds-programming/init-editorconfig ()
  (use-package editorconfig
    :init
    (progn
      (defun conditional-enable-editorconfig ()
        (if (and (fri3nds/git-project-root)
                 (locate-dominating-file default-directory ".editorconfig"))
            (editorconfig-apply)))
      (add-hook 'prog-mode-hook 'conditional-enable-editorconfig))))


(defun fri3nds-programming/post-init-graphviz-dot-mode ()
  (with-eval-after-load 'graphviz-dot-mode
      (require 'company-keywords)
      (push '(graphviz-dot-mode  "digraph" "node" "shape" "subgraph" "label" "edge" "bgcolor" "style" "record") company-keywords-alist)))


(defun fri3nds-programming/post-init-dumb-jump ()
  (setq dumb-jump-selector 'ivy)
  (defun my-dumb-jump ()
    (interactive)
    (evil-set-jump)
    (dumb-jump-go))
  (global-set-key (kbd "C-s-g") 'my-dumb-jump))


(defun fri3nds-programming/post-init-emacs-lisp ()
    (remove-hook 'emacs-lisp-mode-hook 'auto-compile-mode))


(defun fri3nds-programming/post-init-python ()
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; if you use pyton3, then you could comment the following line
  (setq python-shell-interpreter "python"))


;; nodejs-repl is much better now.
;; (defun fri3nds-programming/init-js-comint ()
;;   (use-package js-comint
;;     :init
;;     (progn
;;       ;; http://stackoverflow.com/questions/13862471/using-node-js-with-js-comint-in-emacs
;;       (setq inferior-js-mode-hook
;;             (lambda ()
;;               ;; We like nice colors
;;               (ansi-color-for-comint-mode-on)
;;               ;; Deal with some prompt nonsense
;;               (add-to-list
;;                'comint-preoutput-filter-functions
;;                (lambda (output)
;;                  (replace-regexp-in-string "\033\\[[0-9]+[GKJ]" "" output)))))
;;       (setq inferior-js-program-command "node"))))


(defun fri3nds-programming/post-init-yasnippet ()
  (progn
    (set-face-background 'secondary-selection "gray")
    (setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))
    (mapc #'(lambda (hook) (remove-hook hook 'spacemacs/load-yasnippet)) '(prog-mode-hook
                                                                      org-mode-hook
                                                                      markdown-mode-hook))

    (spacemacs/add-to-hooks 'fri3nds/load-yasnippet '(prog-mode-hook
                                                            markdown-mode-hook
                                                            org-mode-hook))))



;; (defun fri3nds-programming/init-nodejs-repl ()
;;   (use-package nodejs-repl
;;     :init
;;     :defer t))


(defun fri3nds-programming/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'ielm-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'inferior-emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
      ;; (add-hook 'spacemacs-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'scheme-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'cider-repl-mode-hook (lambda () (lispy-mode 1)))
      )
    :config
    (progn
      (push '(cider-repl-mode . ("[`'~@]+" "#" "#\\?@?")) lispy-parens-preceding-syntax-alist)

      (spacemacs|hide-lighter lispy-mode)
      (define-key lispy-mode-map (kbd "s-j") 'lispy-splice)
      (define-key lispy-mode-map (kbd "s-k") 'paredit-splice-sexp-killing-backward)

      (with-eval-after-load 'cider-repl
        (define-key cider-repl-mode-map (kbd "C-s-j") 'cider-repl-newline-and-indent))

      (add-hook
       'minibuffer-setup-hook
       'conditionally-enable-lispy)
      (define-key lispy-mode-map (kbd "s-m") 'lispy-mark-symbol)
      (define-key lispy-mode-map (kbd "s-1") 'lispy-describe-inline)
      (define-key lispy-mode-map (kbd "s-2") 'lispy-arglist-inline))))


;; (defun fri3nds-programming/init-cmake-font-lock ()
;;   (use-package cmake-font-lock
;;     :defer t))



(defun fri3nds-programming/post-init-eldoc ()
  (setq eldoc-idle-delay 0.1))


(defun fri3nds-programming/post-init-tagedit ()
  (add-hook 'web-mode-hook (lambda () (tagedit-mode 1))))

;; For each extension, define a function fri3nds/init-<extension-name>
;;
(defun fri3nds-programming/init-doxymacs ()
  "Initialize doxymacs"
  (use-package doxymacs
    :init
    (add-hook 'c-mode-common-hook 'doxymacs-mode)
    :config
    (progn
      (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
      (spacemacs|hide-lighter doxymacs-mode))))

;; https://atlanis.net/blog/posts/nodejs-repl-eval.html
;; (defun fri3nds-programming/init-nodejs-repl-eval ()
;;   (use-package nodejs-repl-eval
;;     :commands (nodejs-repl-eval-buffer nodejs-repl-eval-dwim nodejs-repl-eval-function)
;;     :init
;;     (progn
;;       (spacemacs/declare-prefix-for-mode 'js2-mode
;;                                          "ms" "REPL")
;;       (spacemacs/set-leader-keys-for-major-mode 'js2-mode
;;         "sb" 'nodejs-repl-eval-buffer
;;         "sf" 'nodejs-repl-eval-function
;;         "sd" 'nodejs-repl-eval-dwim))
;;     :defer t
;;     ))



(;; defun fri3nds-programming/post-init-cc-mode ()
 ;;  (progn
 ;;    (setq company-backends-c-mode-common '((company-dabbrev-code :with company-keywords company-gtags company-etags)
 ;;                                           company-files company-dabbrev))
 ;;    (spacemacs/set-leader-keys-for-major-mode 'c++-mode
 ;;      "gd" 'etags-select-find-tag-at-point)



 ;;    ;; http://stackoverflow.com/questions/23553881/emacs-indenting-of-c11-lambda-functions-cc-mode
 ;;    (defadvice c-lineup-arglist (around my activate)
 ;;      "Improve indentation of continued C++11 lambda function opened as argument."
 ;;      (setq ad-return-value
 ;;            (if (and (equal major-mode 'c++-mode)
 ;;                     (ignore-errors
 ;;                       (save-excursion
 ;;                         (goto-char (c-langelem-pos langelem))
 ;;                         ;; Detect "[...](" or "[...]{". preceded by "," or "(",
 ;;                         ;;   and with unclosed brace.
 ;;                         (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
 ;;                0                       ; no additional indent
 ;;              ad-do-it)))               ; default behavior


 ;;    (setq c-default-style "linux") ;; set style to "linux"
 ;;    (setq c-basic-offset 4)
 ;;    (c-set-offset 'substatement-open 0)
 ;;    (with-eval-after-load 'c++-mode
 ;;      (define-key c++-mode-map (kbd "s-.") 'company-ycmd)))

  )

(defun fri3nds-programming/post-init-ycmd ()
  (progn
    (setq ycmd-tag-files 'auto)
    (setq ycmd-request-message-level -1)
    (set-variable 'ycmd-server-command `("python" ,(expand-file-name "~/Github/ycmd/ycmd/__main__.py")))
    (setq company-backends-c-mode-common '((company-c-headers
                                            company-dabbrev-code
                                            company-keywords
                                            company-gtags :with company-yasnippet)
                                           company-files company-dabbrev ))

    ;; (fri3nds|toggle-company-backends company-ycmd)
    (eval-after-load 'ycmd
      '(spacemacs|hide-lighter ycmd-mode))

    ))



;; when many project has the need to use tags, I will give etags-table and etags-update a try
;; (defun fri3nds-programming/init-etags-select ()
;;   (use-package etags-select
;;     :init
;;     (progn
;;       (define-key evil-normal-state-map (kbd "gf")
;;         (lambda () (interactive) (find-tag (find-tag-default-as-regexp))))

;;       (define-key evil-normal-state-map (kbd "gb") 'pop-tag-mark)

;;       (define-key evil-normal-state-map (kbd "gn")
;;         (lambda () (interactive) (find-tag last-tag t)))

;;       (define-key evil-normal-state-map (kbd "gf")
;;       (evilified-state-evilify etags-select-mode etags-select-mode-map)
;;       (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
;;         "gd" 'etags-select-find-tag-at-point))))

;; (defun fri3nds-programming/init-gulpjs ()
;;   (use-package gulpjs
;;     :init
;;     (progn
;;       (defun zilong/build-engine ()
;;         (interactive)
;;         (gulpjs-start-task-with-file-name "~/Github/fireball/app.js"))

;;       (spacemacs/set-leader-keys "ags" 'gulpjs-start-task)
;;       (spacemacs/set-leader-keys "agS" 'zilong/build-engine)
;;       (spacemacs/set-leader-keys "agr" 'gulpjs-restart-task))))


(defun fri3nds-programming/init-paredit ()
  (use-package paredit
    :commands (paredit-wrap-round
               paredit-wrap-square
               paredit-wrap-curly
               paredit-splice-sexp-killing-backward)
    :init
    (progn

      (bind-key* "s-(" #'paredit-wrap-round)
      (bind-key* "s-[" #'paredit-wrap-square)
      (bind-key* "s-{" #'paredit-wrap-curly)
      )))


(defun fri3nds-programming/post-init-company ()
  (progn
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.02)

    (when (configuration-layer/package-usedp 'company)
      (spacemacs|add-company-backends :modes shell-script-mode makefile-bsdmake-mode sh-mode nxml-mode conf-unix-mode json-mode graphviz-dot-mode))
    ))
