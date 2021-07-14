;; reformat your json file, it requires python
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "jq" (current-buffer) t)))
;; (shell-command-on-region b e
;;                          "python -mjson.tool" (current-buffer) t)))




;; (add-to-list 'auto-mode-alist (cons (concat "\\." (regexp-opt
;;                                                    '("xml"
;;                                                      "xsd"
;;                                                      "rng"
;;                                                      "xslt"
;;                                                      "xsl")
;;                                                    t) "\\'") 'nxml-mode))
;; (setq nxml-slash-auto-complete-flag t)

;; (setq auto-mode-alist
;;       (append
;;        '(("\\.mak\\'" . makefile-bsdmake-mode))
;;        auto-mode-alist))
