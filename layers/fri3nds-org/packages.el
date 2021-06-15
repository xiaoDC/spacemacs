(defconst fri3nds-org-packages
  '(
    ;; org-bullets
    ;; org-pomodoro
    org-fancy-priorities
    )
  )

;; (defun fri3nds-org/post-init-org-pomodoro ()
;;   (progn
;;     (add-hook 'org-pomodoro-finished-hook '(lambda () (fri3nds/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
;;     (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (fri3nds/growl-notification "Short Break" "🐝 Ready to Go?" t)))
;;     (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (fri3nds/growl-notification "Long Break" " 💪 Ready to Go?" t)))
;;     ))

;; (defun fri3nds-org/post-init-org-bullets ()
;;   ;;   ;; 设置org-header的bullet
;;   (progn
;;     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))


(defun fri3nds-org/post-init-org-fancy-priorities ()
  ;; (use-package org-fancy-priorities
  ;;   :ensure t
  ;;   :hook
  ;;   (org-mode . org-fancy-priorities-mode)
  ;;   :config
  ;;   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))
  (progn
    (add-hook 'org-mode-hook (lambda () (org-fancy-priorities-mode 1)))))
