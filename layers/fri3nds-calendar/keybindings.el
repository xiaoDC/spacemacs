;;; config.el --- Calendar Framework Layer configuration File for Spacemacs
;;
;; Copyright (c) 2017 sineer
;;
;; Author: Jérémie Plante <j@war.io>
;; URL: https://github.com/sineer/spacemacs-calendar-layer
;;
;; This file is not part of GNU Emacs.
;;
;; License: MIT

;; (setq cfw:org-agenda-schedule-args '(:timestamp))

(defun fri3nds/open-calendar ()
  "Reopen the most recently killed file buffer, if one exists."
  (interactive)
  (cfw:open-calendar-buffer))


(defun fri3nds/open-calendar-with-agenda ()
  "Reopen the most recently killed file buffer, if one exists."
  (interactive)
  (require 'calfw-org)
  (cfw:open-org-calendar))

;; (defun fri3nds/sync-calendar ()
;;   (interactive)
;;   (org-icalendar-export-agenda-files)
;;   (shell-command "mv /Users/fri3nds/Dropbox/org/tuya-work.ics /Users/fri3nds/Dropbox/org/home/tuya-work.ics")
;;   (shell-command "vdirsyncer sync"))
;; (setq cfw:org-overwrite-default-keybinding t)


(spacemacs/set-leader-keys "jc" 'fri3nds/open-calendar)
(spacemacs/set-leader-keys "cc" 'fri3nds/open-calendar-with-agenda)

;; Keybindings
;; (spacemacs/declare-prefix "d" "bracket-prefix")
;; (spacemacs/set-leader-keys "rd" 'cfw:open-calendar-buffer)
