;;; keybindings.el --- fri3nds Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 fri3nds
;;
;; This file is not part of GNU Emacs.
;;; License: GPLv3


(global-set-key [(shift return)] 'fri3nds/smart-open-line)
(global-set-key (kbd "C-c a") 'org-agenda)
;; (define-key global-map (kbd "<f9>") 'org-capture)

;; (global-set-key (kbd "C-.") 'company-files)



;; (global-set-key (kbd "C-.") 'company-capf)
;; (bind-key* "C-c /" 'company-files)

;; some easy functions for navigate functions
;;C-M-a beginning-of-defun
;;C-M-e end-of-defun
;;C-M-h mark-defun

;; (spacemacs|add-toggle toggle-shadowsocks-proxy-mode
;;   :status shadowsocks-proxy-mode
;;   :on (global-shadowsocks-proxy-mode)
;;   :off (global-shadowsocks-proxy-mode -1)
;;   :documentation "Toggle shadowsocks proxy mode."
;;   :evil-leader "ots")

;; (bind-key* "M-s o" 'occur-dwim)
(bind-key* "C-=" 'er/expand-region)
;; (bind-key* "M--" 'fri3nds/goto-match-paren)
;; (bind-key* "C-c k" 'which-key-show-top-level)
;; (bind-key* "s-y" 'aya-expand)
;; (bind-key* "C-l" 'recenter)


;; Utility functions
(defun bb/define-key (keymap &rest bindings)
  (declare (indent 1))
  (while bindings
    (define-key keymap (pop bindings) (pop bindings))))

(define-key evil-normal-state-map (kbd "-") nil)

(bb/define-key evil-normal-state-map
  "+" 'evil-numbers/inc-at-pt
  "-" 'evil-numbers/dec-at-pt
  "\\" 'evil-repeat-find-char-reverse
  (kbd "DEL") 'evil-repeat-find-char-reverse
  "[s" (lambda (n) (interactive "p") (dotimes (c n nil) (insert " ")))
  "]s" (lambda (n) (interactive "p")
         (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))

(with-eval-after-load 'company
  (progn
    ;; (bb/define-key company-active-map
    ;;   (kbd "C-w") 'evil-delete-backward-word)

    (bb/define-key company-active-map
      (kbd "s-w") 'company-show-location)))



;;Must set key to nil to prevent error: Key sequence b m s starts with non-prefix key b m

(spacemacs/set-leader-keys "od" 'occur-dwim)
(spacemacs/set-leader-keys "ox" 'org-open-at-point-global)

(spacemacs/set-leader-keys "rh" 'helm-resume)


;; deal with BOM
;; (spacemacs/set-leader-keys "fl" 'find-file-literally-at-point)
;; (spacemacs/set-leader-keys "ri" 'ivy-resume)
;; (spacemacs/set-leader-keys "fh" 'ffap-hexl-mode)
;; (spacemacs/set-leader-keys "fd" 'projectile-find-file-dwim-other-window)
;; (spacemacs/set-leader-keys "nl" 'spacemacs/evil-search-clear-highlight)
;; (spacemacs/set-leader-keys "ob" 'popwin:display-last-buffer)
;; (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)



(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))


;; (defun fri3nds/org-screenshot ()
;;   "Take a screenshot into a time stamped unique-named file in the same directory as the org-buffer and insert a link to this file."
;;   (interactive)
;;                                         ;(org-display-inline-images)
;;   (let ((bf (or (buffer-file-name) (substring
;;                                     list-buffers-directory
;;                                     0
;;                                     (last-index-of "/" list-buffers-directory)))))
;;     (setq filename
;;           (concat
;;            (make-temp-name
;;             (concat "~/Pictures/Screenshots/"
;;                     (substring bf
;;                                (+ 1 (last-index-of "/" bf)))
;;                     "_imgs_"
;;                     (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))

;;     (unless (file-exists-p (file-name-directory filename))
;;       (message "111111111111")
;;       (make-directory (file-name-directory filename)))
;;                                         ; take screenshot

;;     (if (eq system-type 'darwin)
;;         (call-process "screencapture" nil nil nil "-i" filename))
;;     (if (eq system-type 'gnu/linux)
;;         (call-process "import" nil nil nil filename))
;;                                         ; insert into file if correctly taken
;;     (if (file-exists-p filename)
;;         (insert (concat "[[./" filename "]]"))
;;       )
;;     )
;;   )


(defun fri3nds-change-theme ()
  (interactive)
  (spacemacs/load-theme 'solarized-gruvbox-light t))
;; (spacemacs/load-theme 'solarized-light))

(defun fri3nds-change-theme-manoj ()
  (interactive)
  (spacemacs/load-theme 'spacemacs-light))


(defun fri3nds-reset-theme ()
  (interactive)
  (spacemacs/load-theme 'solarized-dark))

(defadvice next-buffer (after avoid-messages-buffer-in-next-buffer)
  "Advice around `next-buffer' to avoid going into the *Messages* buffer."
  (when (or
         (string= "*Messages*" (buffer-name))
         (string= "*Help*" (buffer-name))
         (string= "*Compile-Log*" (buffer-name))
         (string= "*spacemacs*" (buffer-name))
         (string= "*ibuffer*" (buffer-name)))
    (next-buffer)))

;; activate the advice
(ad-activate 'next-buffer)

(defun kill-other-buffers (&optional arg)
  "Kill all other buffers.
If the universal prefix argument is used then will the windows too."
  (interactive "P")
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (when (equal '(4) arg) (delete-other-windows))
  (message (format "Killing all buffers except -- \"%s\" "
                   (buffer-name))))


(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
        (revert-buffer t t) t)))
  ;; (neo-buffer-refresh)
  ;; (neotree-project-dir)
  (message "Refreshed open files.") )



(defun just-get-buffer-file-the-name ()
  (interactive)
  (let ((bf (or (buffer-file-name) (substring
                                    list-buffers-directory
                                    0
                                    (last-index-of "/" list-buffers-directory)))))
    (message bf)
    (if bf
        ;; (copy-string-to-clipboard (file-name-sans-extension
        ;;                             (substring bf
        ;;                               (+ 1 (last-index-of "/" bf)))))
        (copy-string-to-clipboard (substring bf
                                             (+ 1 (last-index-of "/" bf))))
      (message "buffer-file-name not exist"))))



(defun fri3nds/projectile-root-copy-path ()
  (interactive)
  (let ((allbf (fri3nds/showcopy-buffer-filename))
        (rebf (spacemacs/projectile-copy-file-path)))
    (copy-string-to-clipboard (replace-regexp-in-string rebf "" allbf))))



(defun fri3nds-insert-lines ()
  (interactive)
  (require 'cl)
  (let ((num (cl-parse-integer (my-prompt-input))))
    (dotimes (i num) (insert (format "%d\n" (+ 1 i))))))


(defun fri3nds-insert-lines-with-number ()
  (interactive)
  (require 'cl)
  (let ((sym (my-prompt-input)))
    (dotimes (i (cl-parse-integer sym)) (insert (format "%d. %d\n" (1+ i) (1+ i))))))


(defun fri3nds/copy-current-line-position ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'"
  (interactive)
  (let ((path-with-line-number
         (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos)))))
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))


(defun fri3nds/copy-current-line ()
  "Copy current line in file to clipboard "
  (interactive)
  (interactive)
  (save-excursion
    (back-to-indentation)
    (kill-ring-save
     (point)
     (line-end-position)))
  (message "1 line copied"))

;; (defun fri3nds/delete-line-before ()
;;   (interactive)
;;   (kill-line 0))

;; (defun fri3nds/delete-line-after ()
;;   (interactive)
;;   (kill-line))


(defun fri3nds/clear-this-line ()
  (interactive)
  (kill-whole-line)
  (newline-and-indent)
  (previous-line))



(defun fri3nds-git-tree ()
  (interactive)
  (require 'hierarchy)
  (let ((files (split-string
                (shell-command-to-string "git ls-files -z")
                (string 0) t))
        (hierarchy (hierarchy-new)))
    ;; Fill the hierarchy
    (hierarchy-add-trees
     hierarchy
     ;; Set . as the root since tree-widget.el requires only one root
     (mapcar (lambda (f) (concat "./" f)) files)
     (lambda (f)
       "Return parent directory of F."
       (if (directory-name-p f)
           (file-name-directory (directory-file-name f))
         (file-name-directory f))))
    ;; Draw the hierarchy
    (switch-to-buffer
     (hierarchy-tree-display
      hierarchy
      (lambda (f _)
        "Insert basename of F."
        (insert
         (if (directory-name-p f)
             (file-name-nondirectory (directory-file-name f))
           (file-name-nondirectory f))))))
    ;; Unfold
    (goto-char (point-min))
    (while (progn (widget-button-press (point))
                  (widget-forward 1)
                  (/= (point) (point-min))))))



;; https://github.com/syl20bnr/spacemacs/issues/7749
(defun spacemacs/ivy-persp-switch-project (arg)
  (interactive "P")
  (ivy-read "Switch to Project Perspective: "
            (if (projectile-project-p)
                (cons (abbreviate-file-name (projectile-project-root))
                      (projectile-relevant-known-projects))
              projectile-known-projects)
            :action (lambda (project)
                      (let ((persp-reset-windows-on-nil-window-conf t))
                        (persp-switch project)
                        (let ((projectile-completion-system 'ivy)
                              (old-default-directory default-directory))
                          (projectile-switch-project-by-name project)
                          (setq default-directory old-default-directory))))))


;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'soothe t)
;; (load-theme 'alect-black-alt t)


(defun fri3nds-neotree-toggle ()
  "Toggle and add the current project to treemacs if not already added."
  (interactive)
  (let ((path (projectile-project-root)))
    (if (null path)
        (neotree-find)
      (neotree-show))))



(defun fri3nds/treemacs-find-file ()
  "Toggle and add the current project to treemacs if not already added."
  (interactive)
  (let ((path (projectile-project-root))
        (name (projectile-project-name)))

    (if (null path)
        (neotree-find)
      (if (eq (treemacs-current-visibility) 'visible)
          (treemacs-find-file)))))


;; http://wenshanren.org/?p=327
;; thanks to the author
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "R" "sass" "screen" "sql" "awk"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))


(defun toggle-string-case (str)
  (let ((upper-str (upcase str)))
    (if (string= upper-str str)
        (downcase str)
      upper-str)))


(defun upper-first-char-of-word-at-point ()
  (interactive)
  (let ((str (thing-at-point 'word))
        (bounds (bounds-of-thing-at-point 'word)))
    (when (and str (> (length str) 0))
      (let ((first-char (substring str nil 1))
            (rest-str (substring str 1)))
        (delete-region (car bounds) (cdr bounds))
        (insert (concat (toggle-string-case first-char) rest-str))))))



(defun last-index-of (regex str &optional ignore-case)
  (let ((start 0)
        (case-fold-search ignore-case)
        idx)
    (while (string-match regex str start)
      (setq idx (match-beginning 0))
      (setq start (match-end 0)))
    idx))

(defun copy-string-to-clipboard (str)
  (when str
    (progn
      (kill-new str)
      (message "Copied buffer file name '%s' to the clipboard." str))))

(defcustom use-chinese-word-segmentation nil
  "If Non-nil, support Chinese word segmentation(中文分词).
  See URL `https://github.com/xuchunyang/chinese-word-at-point.el' for more info."
  :type 'boolean)

(defun my-region-or-word ()
  "Return word in region or word at point."
  (if (use-region-p)
      (buffer-substring-no-properties (region-beginning)
                                      (region-end))
    (thing-at-point (if use-chinese-word-segmentation
                        'chinese-or-other-word
                      'word) t)))

(defun my-prompt-input ()
  "Prompt input object for translate."
  (let ((current-word (my-region-or-word)))
    (message current-word)
    (read-string (format "Word (%s): "
                         (or current-word ""))
                 nil nil
                 current-word)))

(defun search-google-symbol ()
  "google搜索当前选中或者停留的字符"
  (interactive)
  (let ((sym (my-prompt-input)))
    (engine/search-google sym)))


(defun fri3nds/open-note-file ()
  (interactive)
  (find-file "~/org/notes.org"))


(defun fri3nds/open-snippets ()
  (interactive)
  (find-file "~/Dropbox/Note/README.org"))


(defun fri3nds/open-tools ()
  (interactive)
  (find-file "~/Dropbox/Note/tool.md"))


(defun fri3nds/open-todo-file ()
  (interactive)
  (find-file "~/org/TODO.org"))


(defun fri3nds/open-sync-todo-file ()
  (interactive)
  (find-file "~/Dropbox/org/tuya-work.org"))



(defun fri3nds/open-template-file ()
  (interactive)
  (find-file "~/scratch.org"))

(defun fri3nds/open-clojure-file ()
  (interactive)
  ;; (find-file "/Users/fri3nd/tools/script/src/script/core.clj"))
  (find-file "~/tools/script/src/script/huskar.clj"))


(defun fri3nds/showcopy-buffer-filename ()
  "Show and copy the full path to the current file in the minibuffer."
  (interactive)
  ;; list-buffers-directory is the variable set in dired buffers
  (let ((file-name (or (buffer-file-name) list-buffers-directory)))
    (if file-name
        (message (kill-new file-name))
      (error "Buffer not visiting a file"))))


(defun fri3nds/open-password-file ()
  (interactive)
  (find-file "~/workspace/.tuya_password.md.cpt"))


(defun fri3nds/neotree-keep-size (fn &rest args)
  "Reset neotree width after open, if user adjusted it's size."
  (let ((w (window-width)))
    (funcall fn)
    (neo-global--set-window-width w)))


;; insert date and time
(defun fri3nds/now ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%Y-%m-%d %H:%M %s %a %W" (current-time))))
;; (insert (format-time-string "%Y-%m-%d %H:%M:%S %s" (current-time))))
;; (insert (format-time-string "<%F %a %H:%S>")))

(defun fri3nds/today ()
  "Insert string for today's date nicely formatted in American style,
e.g. Sunday, September 17, 2000."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%A, %B %e, %Y")))


(defun fri3nds/kill-all-other-project-buffers (&optional kill-special)
  "Kill buffers that do not belong to a `projectile' project.
  With prefix argument (`C-u'), also kill the special buffers."

  (interactive "P")
  (require 'projectile)
  (let ((bufs (buffer-list))
        (buffers (projectile-project-buffers))
        res (list))

    (dolist (a bufs)
      (if (not (member a buffers))
          (setq res (cons a res))))

    (dolist (a res)
      (kill-buffer a)
      (message (format "buffer filename -- \"%s\" is killed"
                       (buffer-name a))))))


(defvar spacemacs--killed-buffer-list nil
  "List of recently killed buffers.")

(defun spacemacs//add-buffer-to-killed-list ()
  "If buffer is associated with a file name, add that file
to the `killed-buffer-list' when killing the buffer."
  (when buffer-file-name
    (push buffer-file-name spacemacs--killed-buffer-list)))


(add-hook 'kill-buffer-hook #'spacemacs//add-buffer-to-killed-list)

(defun fri3nds/reopen-killed-buffer ()
  "Reopen the most recently killed file buffer, if one exists."
  (interactive)
  (when spacemacs--killed-buffer-list
    (find-file (pop spacemacs--killed-buffer-list))))

;; (advice-add 'neotree-enter :around 'fri3nds/neotree-keep-size)

(defun fri3nds/format-js-file ()
  (interactive)
  (if (executable-find "prettier")
      ;; (shell-command-to-string "ls -al")
      ;; (message (buffer-file-name))
      (shell-command-to-string (format "prettier --config /Users/fri3nd/.prettierrc --write %s" (buffer-file-name)))
    ))

;; (defvar helm-fzf-source
;;   (helm-build-async-source "fzf"
;;     :candidates-process 'helm-fzf--do-candidate-process
;;     :nohighlight t
;;     :requires-pattern 2
;;     :candidate-number-limit 9999))

;; (defun helm-fzf--do-candidate-process ()
;;   (let* ((cmd-args `("fzf" "-x" "-f" ,helm-pattern))
;;           (proc (apply #'start-file-process "helm-fzf" nil cmd-args)))
;;     (prog1 proc
;;       (set-process-sentinel
;;         proc
;;         (lambda (process event)
;;           (helm-process-deferred-sentinel-hook
;;             process event (helm-default-directory)))))))

;; (defun helm-fzf ()
;;   (interactive)
;;   (let ((default-directory "~/"))
;; 	  (find-file
;; 	    (concat "~/" (helm :sources '(helm-fzf-source)
;; 						         :buffer "*helm-fzf*")))))


;; (spacemacs/set-leader-keys "aa" 'evil-avy-goto-line)
(spacemacs/set-leader-keys "sa" 'evil-avy-goto-line)
;; (spacemacs/set-leader-keys "aa" 'spacemacs/treemacs-project-toggle)
(spacemacs/set-leader-keys "aa" 'swiper)

;; (spacemacs/set-leader-keys "ag" 'helm-ag)
(spacemacs/set-leader-keys "ag" 'counsel-ag)


(spacemacs/set-leader-keys "ba" 'kill-all-buffers)
(spacemacs/set-leader-keys "bb" 'counsel-find-file)
(spacemacs/set-leader-keys "bc" 'erase-buffer)
(spacemacs/set-leader-keys "be" 'spacemacs/new-empty-buffer)
(spacemacs/set-leader-keys "bf" 'reveal-in-osx-finder)
(spacemacs/set-leader-keys "bm" 'spacemacs/switch-to-messages-buffer)
(spacemacs/set-leader-keys "bn" 'previous-buffer)
(spacemacs/set-leader-keys "bo" 'kill-other-buffers)
(spacemacs/set-leader-keys "bq" 'fri3nds/open-template-file)
(spacemacs/set-leader-keys "bw" 'fri3nds/open-clojure-file)
(spacemacs/set-leader-keys "br" 'revert-all-buffers)
(spacemacs/set-leader-keys "bk" 'projectile-kill-buffers)

;;;;;;
(spacemacs/set-leader-keys "bu" 'fri3nds/reopen-killed-buffer)
(spacemacs/set-leader-keys "by" 'just-get-buffer-file-the-name)
(spacemacs/set-leader-keys "bi" 'spacemacs/projectile-copy-file-path)
(spacemacs/set-leader-keys "bt" 'fri3nds/projectile-root-copy-path)

;; (spacemacs/set-leader-keys "cc" 'fri3nds/treemacs-find-file)
;; (spacemacs/set-leader-keys "cc" 'neotree-project-dir)
(spacemacs/set-leader-keys "cd" 'youdao-dictionary-search-from-input)
(spacemacs/set-leader-keys "ch" 'spacemacs/evil-search-clear-highlight)
(spacemacs/set-leader-keys "ci" 'fri3nds/copy-current-line)

(spacemacs/set-leader-keys "dd" 'dired-jump)
(spacemacs/set-leader-keys "df" 'magit-diff-buffer-file)
;; (spacemacs/set-leader-keys "dh" 'fri3nds/delete-line-before)
;; (spacemacs/set-leader-keys "dk" 'fri3nds/delete-line-after)
(spacemacs/set-leader-keys "dl" 'fri3nds/clear-this-line)
(spacemacs/set-leader-keys "dn" 'diff-hl-next-hunk)
(spacemacs/set-leader-keys "dt" 'magit-diff-working-tree)

;; (spacemacs/set-leader-keys "en" 'git-gutter+-next-hunk)
;; (spacemacs/set-leader-keys "ee" 'git-gutter+-previous-hunk)

;; (spacemacs/set-leader-keys "ff" 'helm-recentf)
(spacemacs/set-leader-keys "ff" 'counsel-recentf)
(spacemacs/set-leader-keys "fd" 'spacemacs/delete-current-buffer-file)
(spacemacs/set-leader-keys "fr" 'spacemacs/rename-current-buffer-file)
(spacemacs/set-leader-keys "fl" 'fri3nds/copy-current-line-position)
(spacemacs/set-leader-keys "fm" 'format-all-buffer)
(spacemacs/set-leader-keys "dm" 'format-all-buffer)
(spacemacs/set-leader-keys "fn" 'fri3nds/now)
(spacemacs/set-leader-keys "gb" 'magit-blame-addition)

(spacemacs/set-leader-keys "fy" 'fri3nds/showcopy-buffer-filename)


(spacemacs/set-leader-keys "ja" 'fri3nds/open-todo-file)
(spacemacs/set-leader-keys "jd" 'fri3nds/open-sync-todo-file)
(spacemacs/set-leader-keys "hh" 'ibuffer)
;; (spacemacs/set-leader-keys "jj" 'helm-buffers-list)
;; (spacemacs/set-leader-keys "jj" 'awesome-tab-ace-jump)
(spacemacs/set-leader-keys "jk" 'awesome-tab-ace-jump)
(spacemacs/set-leader-keys "jj" 'previous-buffer)
;; (spacemacs/set-leader-keys "jj" 'ivy-switch-buffer)
(spacemacs/set-leader-keys "jq" 'fri3nds/open-note-file)
(spacemacs/set-leader-keys "js" 'fri3nds/open-snippets)
(spacemacs/set-leader-keys "jt" 'fri3nds/open-tools)
(spacemacs/set-leader-keys "jz" 'fri3nds/open-password-file)

;; (spacemacs/set-leader-keys "kk" 'projectile-find-file)
(spacemacs/set-leader-keys "kk" 'next-buffer)
(spacemacs/set-leader-keys "ka" 'text-scale-increase)
(spacemacs/set-leader-keys "kd" 'text-scale-decrease)
(spacemacs/set-leader-keys "ko" 'fri3nds/kill-all-other-project-buffers)

;; (spacemacs/set-leader-keys "gg" 'spacemacs/helm-project-do-ag-region-or-symbol)
(spacemacs/set-leader-keys "ga" 'org-table-align)
(spacemacs/set-leader-keys "gg" 'spacemacs/search-project-ag-region-or-symbol)
;; (spacemacs/set-leader-keys "hh" 'previous-buffer)
(spacemacs/set-leader-keys "hi" 'highlight-indent-guides-mode)

;; (spacemacs/set-leader-keys "ii" 'evil-avy-goto-char-in-line)
(spacemacs/set-leader-keys "ii" 'projectile-find-file)
;; (spacemacs/set-leader-keys "il" 'fri3nds-insert-lines)
;; (spacemacs/set-leader-keys "mm" 'helm-show-kill-ring)
(spacemacs/set-leader-keys "ma" 'markdown-table-align)
(spacemacs/set-leader-keys "mu" 'lsp-ui-imenu)
(spacemacs/set-leader-keys "mm" 'counsel-yank-pop)
;; (spacemacs/set-leader-keys "mt" 'toggle-menu-bar-mode-from-frame)
(spacemacs/set-leader-keys "mt" 'spacemacs/toggle-menu-bar-off)
;; (spacemacs/set-leader-keys "nn" 'ivy-switch-buffer)
;; (spacemacs/set-leader-keys "nn" 'next-buffer)
;; (spacemacs/set-leader-keys "nn" 'counsel-find-file)
(spacemacs/set-leader-keys "nn" 'ivy-switch-buffer)
(spacemacs/set-leader-keys "ng" 'search-google-symbol)

(spacemacs/set-leader-keys "oa" 'org-agenda-list)
(spacemacs/set-leader-keys "oo" 'projectile-switch-project)
(spacemacs/set-leader-keys "os" 'outline-show-all)
(spacemacs/set-leader-keys "oc" 'org-overview)
(spacemacs/set-leader-keys "otn" 'org-table-create-with-table.el)
;; (spacemacs/set-leader-keys "ft" 'fri3nds-neotree-toggle)
;; (spacemacs/set-leader-keys "qq" 'fri3nds-neotree-toggle)
;; (spacemacs/set-leader-keys "qq" 'treemacs)
(spacemacs/set-leader-keys "qq" 'spacemacs/treemacs-project-toggle)

(spacemacs/set-leader-keys "si" 'org-insert-src-block)
(spacemacs/set-leader-keys "ss" 'save-buffer)
(spacemacs/set-leader-keys "sm" 'split-window-right-and-focus)
;; (spacemacs/set-leader-keys "sl" 'ivy-resume)
;; (spacemacs/set-leader-keys "sl" 'helm-resume)
(spacemacs/set-leader-keys "sl" 'display-line-numbers-mode)
(spacemacs/set-leader-keys "ss" 'save-buffer)
(spacemacs/set-leader-keys "ta" 'fri3nds-change-theme)
(spacemacs/set-leader-keys "tm" 'fri3nds-change-theme-manoj)
(spacemacs/set-leader-keys "ts" 'counsel-load-theme)
(spacemacs/set-leader-keys "tt" 'fri3nds-reset-theme)
;; (spacemacs/set-leader-keys "tt" 'neotree-toggle)
;; (spacemacs/set-leader-keys "tt" 'spacemacs/linum-relative-toggle)
;; (spacemacs/set-leader-keys "tt" 'spacemacs/linum-relative-toggle)
;; (spacemacs/set-leader-keys "tl" 'linum-mode)
;; (spacemacs/set-leader-keys "tl" 'display-line-numbers-mode)
(spacemacs/set-leader-keys "ty" 'fri3nds/load-yasnippet)

;; (spacemacs/set-leader-keys "uu" 'evilnc-comment-or-uncomment-lines)

(spacemacs/set-leader-keys "wo" 'delete-other-windows)
(spacemacs/set-leader-keys "xx" 'backward-up-list)
(spacemacs/set-leader-keys "xz" 'up-list)

(spacemacs/set-leader-keys "yi" 'yas-insert-snippet)
(spacemacs/set-leader-keys "yy" 'spacemacs/copy-whole-buffer-to-clipboard)
(spacemacs/set-leader-keys "zz" 'evil-avy-goto-char)
(spacemacs/set-leader-keys "on" 'org-forward-heading-same-level)
(spacemacs/set-leader-keys "ob" 'org-backward-heading-same-level)
(spacemacs/set-leader-keys "ou" 'outline-up-heading)
;; (spacemacs/set-leader-keys "zz" 'ibuffer-sidebar-toggle-sidebar)
;; (spacemacs/set-leader-keys "zz" 'fzf)




;; (global-set-key (kbd "s-y") 'redo)

(define-key evil-normal-state-map (kbd "L") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "L") 'move-end-of-line)
;; evil-last-non-blank

;; (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
;; (define-key evil-insert-state-map (kbd "C-a") 'evil-insert-line)

(define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "<tab>") 'next-buffer)
(define-key evil-visual-state-map (kbd "H") 'evil-beginning-of-line)

(define-key evil-normal-state-map (kbd "M") 'spacemacs/evil-search-clear-highlight)
(define-key evil-visual-state-map (kbd "M") 'spacemacs/evil-search-clear-highlight)

(define-key evil-normal-state-map (kbd "zM") 'evil-open-folds)

(global-set-key (kbd "s-y") 'string-inflection-toggle)
(global-set-key (kbd "s-c") 'avy-goto-char)
(global-set-key (kbd "s-u") 'upper-first-char-of-word-at-point)

(global-set-key (kbd "<f4>") 'spacemacs/new-empty-buffer)
(global-set-key (kbd "<f8>") 'dired-jump)
(global-set-key (kbd "<f9>") 'ibuffer)
(global-set-key (kbd "<S-up>") 'shrink-window)
(global-set-key (kbd "<S-down>") 'enlarge-window)
(global-set-key (kbd "<S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<S-right>") 'enlarge-window-horizontally)


(setq org-capture-templates
      ;; '(("t" "Todo" entry (file+headline "~/org/TODO.org" "TUYA WORK")
      '(("t" "Todo" entry (file "~/Dropbox/org/tuya-work.org")
         "* TODO %?\n %U\n %i\n %a\n")
        ;; "* TODO %^{任务名}\n%U\n%a\n")
        ("i" "Idea" entry (file+headline "~/org/notes.org" "Ideas")
         "* %? \n %U")
        ("e" "Tweak" entry (file+headline "~/org/notes.org" "Tweaks")
         "* %? \n %U")
        ;; ("l" "Learn" entry (file+headline "~/org/Learning.org" "Learn")

        ("l" "Learn" entry (file "~/org/Learning.org")
         "* %? \n")

        ("w" "Work note" entry (file+headline "~/Dropbox/org/tuya-work.org" "Work")
         "* %? \n")))

;; (add-to-list 'org-capture-templates
;;   '("w" "Work Task" entry
;;      (file+headline "/Users/fri3nd/Dropbox/org/tuya-work.org" "Work")
;;      "* TODO %^{任务名}\n%U\n%a\n"))
