(defconst zilongshanren-org-packages
  '(
    org-bullets
    org-pomodoro
    )
  )

(defun zilongshanren-org/post-init-org-pomodoro ()
  (progn
    (add-hook 'org-pomodoro-finished-hook '(lambda () (zilongshanren/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
    (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (zilongshanren/growl-notification "Short Break" "🐝 Ready to Go?" t)))
    (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (zilongshanren/growl-notification "Long Break" " 💪 Ready to Go?" t)))
    ))

;; (defun zilongshanren-org/post-init-org-bullets ()
;;   ;; 设置org-header的bullet
;;   (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭")))
