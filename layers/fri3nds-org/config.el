;;; config.el --- fri3nds Layer packages File for Spacemacs
;;
;; Copyright (c) 2014-2016 fri3nds
;;
;; Author: fri3nds <guanghui8827@gmail.com>
;; URL: https://github.com/fri3nds/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun fri3nds/org-ispell ()
  "Configure `ispell-skip-region-alist' for `org-mode'."
  (make-local-variable 'ispell-skip-region-alist)
  (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
  (add-to-list 'ispell-skip-region-alist '("~" "~"))
  (add-to-list 'ispell-skip-region-alist '("=" "="))
  (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC")))

(add-hook 'org-mode-hook #'fri3nds/org-ispell)
