;;; packages.el --- Calendar Framework Layer config for Spacemacs
;;
;; Copyright (c) 2017 sineer
;;
;; Author: Jérémie Plante <j@war.io>
;; URL: https://github.com/sineer/spacemacs-calendar-layer
;;
;; License: MIT

(defconst fri3nds-calendar-packages
  '(
    calfw
    ;; calfw-cal
    ;; calfw-ical
    ;; org-gcal
    calfw-org
    alert
    ;; ishikk
    ))

(defun fri3nds-calendar/init-calfw ()
  "Initialize calfw and add key-bindings"
  (use-package calfw))

;; (defun fri3nds-calendar/init-calfw-cal ()
;;   "Initialize calfw and add key-bindings"
;;   (use-package calfw-cal))


;; (defun fri3nds-calendar/init-calfw-ical ()
;;   "Initialize calfw and add key-bindings"
;;   (use-package calfw-ical))

;; (defun fri3nds-calendar/init-org-gcal ()
;;   "Initialize org-gcal"
;;   (use-package org-gcal
;;     :ensure t
;;     :config
;;     (
;;      setq org-gcal-client-id "oauth 2.0 client ID"
;;      org-gcal-client-secret "client secret"
;;      org-gcal-file-alist '(("chenglong01020@gmail.com" .  "/Users/fri3nd/org/notes.org"))
;;      ))
;;   )

(defun fri3nds-calendar/init-alert ()
  "Initialize alert"
  (use-package alert)
  )


(defun fri3nds-calendar/init-calfw-org ()
  "Initialize alert"
  (use-package calfw-org))


;; (defun fri3nds-calendar/init-ishikk ()
;;   "Initialize ishikk"
;;   (use-package ishikk))
