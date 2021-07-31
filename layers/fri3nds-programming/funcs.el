;; "http://stackoverflow.com/questions/2242572/emacs-todo-indicator-at-left-side"


(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))


;; (defun my-toggle-web-indent ()
;;   (interactive)
;;   ;; web development
;;   (if (eq major-mode 'json-mode)
;;       (progn
;;         (setq js-indent-level (if (= js-indent-level 2) 4 2))))

;;   (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
;;       (progn
;;         (setq js-indent-level (if (= js-indent-level 2) 4 2))))

;;   (if (eq major-mode 'web-mode)
;;       (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
;;              (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
;;              (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
;;   (if (eq major-mode 'css-mode)
;;       (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

;;   (setq indent-tabs-mode nil))


(defun fri3nds/load-yasnippet ()
  (interactive)
  (unless yas-global-mode
    (progn
      (yas-global-mode 1)
      (setq my-snippet-dir (expand-file-name "~/.emacssnippets/snippets/"))
      (setq yas-snippet-dirs  my-snippet-dir)
      (yas-load-directory my-snippet-dir)
      (setq yas-wrap-around-region t)))
  (yas-minor-mode 1))


;; (defun conditionally-enable-lispy ()
;;   (when (eq this-command 'eval-expression)
;;     (lispy-mode 1)))
