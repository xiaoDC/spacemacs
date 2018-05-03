;;; packages.el --- zilong-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2014-2016 fri3nds
;;
;; Author: guanghui <guanghui8827@gmail.com>
;; URL: https://github.com/fri3nds/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst fri3nds-ui-packages
  '(
    (zilong-mode-line :location built-in)
    diminish
    popwin
    (whitespace :location built-in)
    ;; hl-anything performance is very slow...
    ;; hl-anything
    ;; if you wnat to use spaceline, please comment out zilong-mode-line
    ;; spaceline
    ;; beacon
    ;; evil-vimish-fold
    )
  )

(defun fri3nds-ui/init-zilong-mode-line ()
  (defun fri3nds/display-mode-indent-width ()
    (let ((mode-indent-level
            (catch 'break
              (dolist (test spacemacs--indent-variable-alist)
                (let ((mode (car test))
                       (val (cdr test)))
                  (when (or (and (symbolp mode) (derived-mode-p mode))
                          (and (listp mode) (apply 'derived-mode-p mode))
                          (eq 't mode))
                    (when (not (listp val))
                      (setq val (list val)))
                    (dolist (v val)
                      (cond
                        ((integerp v) (throw 'break v))
                        ((and (symbolp v) (boundp v))
                          (throw 'break (symbol-value v))))))))
              (throw 'break (default-value 'evil-shift-width)))))
      (concat "TS:" (int-to-string (or mode-indent-level 0)))))


  )

(defun fri3nds-ui/post-init-diminish ()
  (progn
    (with-eval-after-load 'whitespace
      (diminish 'whitespace-mode))
    (with-eval-after-load 'smartparens
      (diminish 'smartparens-mode))
    ;; (with-eval-after-load 'which-key
    ;;   (diminish 'which-key-mode))
    (with-eval-after-load 'hungry-delete
      (diminish 'hungry-delete-mode))))


(defun fri3nds-ui/post-init-spaceline ()
  (use-package spaceline-config
    :config
    (progn
      (defvar spaceline-org-clock-format-function
        'org-clock-get-clock-string
        "The function called by the `org-clock' segment to determine what to show.")

      (spaceline-define-segment org-clock
                                "Show information about the current org clock task.  Configure
`spaceline-org-clock-format-function' to configure. Requires a currently running
org clock.

This segment overrides the modeline functionality of `org-mode-line-string'."
                                (when (and (fboundp 'org-clocking-p)
                                           (org-clocking-p))
                                  (substring-no-properties (funcall spaceline-org-clock-format-function)))
                                :global-override org-mode-line-string)

      (spaceline-compile
        'zilong
        ;; Left side of the mode line (all the important stuff)
        '(((persp-name
             workspace-number
             window-number
             )
            :separator "|"
            :face highlight-face)
           ((buffer-modified buffer-size input-method))
           anzu
           '(buffer-id remote-host buffer-encoding-abbrev)
           ((point-position line-column buffer-position selection-info)
             :separator " | ")
           major-mode
           process
           ;; (flycheck-error flycheck-warning flycheck-info)
           ;; (python-pyvenv :fallback python-pyenv)
           ;; ((minor-modes :separator spaceline-minor-modes-separator) :when active)
           ;; (org-pomodoro :when active)
           ;; (org-clock :when active)
           ;; nyan-cat
           )
        ;; Right segment (the unimportant stuff)
        '((version-control :when active)
           battery))

      (setq-default mode-line-format '("%e" (:eval (spaceline-ml-zilong))))
      )))

(defun fri3nds-ui/init-beacon ()
  (use-package beacon
    :init
    (progn
      (spacemacs|add-toggle beacon
        :status beacon-mode
        :on (beacon-mode)
        :off (beacon-mode -1)
        :documentation "Enable point highlighting after scrolling"
        :evil-leader "otb")

      (spacemacs/toggle-beacon-on))
    :config (spacemacs|hide-lighter beacon-mode)))

(defun fri3nds-ui/init-evil-vimish-fold ()
  (use-package evil-vimish-fold
    :init
    (vimish-fold-global-mode 1)
    :config
    (progn
      (define-key evil-normal-state-map (kbd "zf") 'vimish-fold)
      (define-key evil-visual-state-map (kbd "zf") 'vimish-fold)
      (define-key evil-normal-state-map (kbd "zd") 'vimish-fold-delete)
      (define-key evil-normal-state-map (kbd "za") 'vimish-fold-toggle))))

(defun fri3nds-ui/post-init-hl-anything ()
  (progn
    (defun my-inhibit-globalized-hl-highlight-mode ()
      "Counter-act a globalized hl-highlight-mode."
      (set (make-local-variable 'hl-highlight-mode) nil))

    (add-hook 'org-agenda-mode-hook 'my-inhibit-globalized-hl-highlight-mode)
    (hl-highlight-mode -1)
    (spacemacs|add-toggle toggle-hl-anything
      :status hl-highlight-mode
      :on (hl-highlight-mode)
      :off (hl-highlight-mode -1)
      :documentation "Toggle highlight anything mode."
      :evil-leader "ths")))

(defun fri3nds-ui/post-init-pangu-spacing ()
  (progn
    ;; add toggle options
    (spacemacs|add-toggle toggle-pangu-spaceing
      :status pangu-spacing-mode
      :on (global-pangu-spacing-mode)
      :off (global-pangu-spacing-mode -1)
      :documentation "Toggle pangu spacing mode"
      :evil-leader "ots")
    (add-hook 'markdown-mode-hook
              #'(lambda ()
                 (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))))

(defun fri3nds-ui/post-init-popwin ()
  (progn
    (delete "*Async Shell Command*" popwin:special-display-config)))

(defun fri3nds-ui/post-init-whitespace ()
  (progn
    ;; ;; http://emacsredux.com/blog/2013/05/31/highlight-lines-that-exceed-a-certain-length-limit/
    (setq whitespace-line-column fill-column) ;; limit line length
    ;;https://www.reddit.com/r/emacs/comments/2keh6u/show_tabs_and_trailing_whitespaces_only/
    (setq whitespace-display-mappings
          ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
          '(
            (space-mark 32 [183] [46])           ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
            (newline-mark 10 [182 10])           ; 10 LINE FEED
            (tab-mark 9 [187 9] [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
            ))
    (setq whitespace-style '(face tabs trailing tab-mark ))
    ;; (setq whitespace-style '(face lines-tail))
    ;; show tab;  use untabify to convert tab to whitespace
    (setq spacemacs-show-trailing-whitespace nil)

    (setq-default tab-width 4)
    ;; set-buffer-file-coding-system -> utf8 to convert dos to utf8
    ;; (setq inhibit-eol-conversion t)
    ;; (add-hook 'prog-mode-hook 'whitespace-mode)

    ;; (global-whitespace-mode +1)

    (with-eval-after-load 'whitespace
      (progn
        (set-face-attribute 'whitespace-tab nil
                            :background "#Adff2f"
                            :foreground "#00a8a8"
                            :weight 'bold)
        (set-face-attribute 'whitespace-trailing nil
                            :background "#e4eeff"
                            :foreground "#183bc8"
                            :weight 'normal)))

    (diminish 'whitespace-mode)))
