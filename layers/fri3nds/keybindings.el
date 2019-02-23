;;; keybindings.el --- fri3nds Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 fri3nds
;;
;; This file is not part of GNU Emacs.
;;; License: GPLv3


(global-set-key [(shift return)] 'fri3nds/smart-open-line)
(global-set-key (kbd "C-c a") 'org-agenda)
;; (define-key global-map (kbd "<f9>") 'org-capture)

(global-set-key (kbd "C-.") 'company-files)



;; (global-set-key (kbd "C-.") 'company-capf)
;; (bind-key* "C-c /" 'company-files)

;; some easy functions for navigate functions
;;C-M-a beginning-of-defun
;;C-M-e end-of-defun
;;C-M-h mark-defun

(spacemacs|add-toggle toggle-shadowsocks-proxy-mode
  :status shadowsocks-proxy-mode
  :on (global-shadowsocks-proxy-mode)
  :off (global-shadowsocks-proxy-mode -1)
  :documentation "Toggle shadowsocks proxy mode."
  :evil-leader "ots")

;; (bind-key* "M-s o" 'occur-dwim)
(bind-key* "C-=" 'er/expand-region)
(bind-key* "M--" 'fri3nds/goto-match-paren)
(bind-key* "C-c k" 'which-key-show-top-level)
(bind-key* "s-y" 'aya-expand)
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
  (interactive)
  (if (neo-global--window-exists-p)
    (neotree-hide)
    (neotree-find-project-root)))



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

;; 已经有了 SPC b K
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (if (neo-global--window-exists-p)
    (neotree-find (buffer-file-name))
    (neotree-find-project-root)
    ))



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
  (find-file "/Users/fri3nds/org/notes.org"))


(defun fri3nds/open-snippets ()
  (interactive)
  (find-file "/Users/fri3nds/Dropbox/Note/README.org"))


(defun fri3nds/open-tools ()
  (interactive)
  (find-file "/Users/fri3nds/Dropbox/Note/tool.md"))


(defun fri3nds/open-todo-file ()
  (interactive)
  (find-file "/Users/fri3nds/org/TODO.org"))


(defun fri3nds/open-sync-todo-file ()
  (interactive)
  (find-file "/Users/fri3nds/Dropbox/org/tuya-work.org"))


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
  (find-file "/Users/fri3nds/workspace/.tuya_password.md"))


(defun fri3nds/neotree-keep-size (fn &rest args)
  "Reset neotree width after open, if user adjusted it's size."
  (let ((w (window-width)))
    (funcall fn)
    (neo-global--set-window-width w)))





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

(advice-add 'neotree-enter :around 'fri3nds/neotree-keep-size)


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


(spacemacs/set-leader-keys "aa" 'evil-avy-goto-line)
(spacemacs/set-leader-keys "as" 'evil-avy-goto-char)
(spacemacs/set-leader-keys "ag" 'helm-ag)

(spacemacs/set-leader-keys "ba" 'kill-all-buffers)
(spacemacs/set-leader-keys "bb" 'helm-find-files)
(spacemacs/set-leader-keys "bc" 'erase-buffer)
(spacemacs/set-leader-keys "be" 'spacemacs/new-empty-buffer)
(spacemacs/set-leader-keys "bf" 'reveal-in-osx-finder)
(spacemacs/set-leader-keys "bm" 'spacemacs/switch-to-messages-buffer)
(spacemacs/set-leader-keys "bo" 'kill-other-buffers)
(spacemacs/set-leader-keys "br" 'revert-all-buffers)

;;;;;;
(spacemacs/set-leader-keys "bu" 'fri3nds/reopen-killed-buffer)
(spacemacs/set-leader-keys "by" 'just-get-buffer-file-the-name)

(spacemacs/set-leader-keys "cc" 'neotree-project-dir)
(spacemacs/set-leader-keys "cd" 'youdao-dictionary-search-from-input)
(spacemacs/set-leader-keys "ch" 'spacemacs/evil-search-clear-highlight)

(spacemacs/set-leader-keys "dd" 'dired-jump)
(spacemacs/set-leader-keys "df" 'magit-diff-buffer-file)
;; (spacemacs/set-leader-keys "dh" 'fri3nds/delete-line-before)
;; (spacemacs/set-leader-keys "dk" 'fri3nds/delete-line-after)
(spacemacs/set-leader-keys "dl" 'fri3nds/clear-this-line)
(spacemacs/set-leader-keys "dn" 'diff-hl-next-hunk)
(spacemacs/set-leader-keys "dt" 'magit-diff-working-tree)

;; (spacemacs/set-leader-keys "en" 'git-gutter+-next-hunk)
;; (spacemacs/set-leader-keys "ee" 'git-gutter+-previous-hunk)

(spacemacs/set-leader-keys "ff" 'helm-recentf)
(spacemacs/set-leader-keys "fd" 'spacemacs/delete-current-buffer-file)
(spacemacs/set-leader-keys "fr" 'spacemacs/rename-current-buffer-file)
(spacemacs/set-leader-keys "gb" 'magit-blame-addition)

(spacemacs/set-leader-keys "fy" 'fri3nds/showcopy-buffer-filename)


(spacemacs/set-leader-keys "ja" 'fri3nds/open-todo-file)
(spacemacs/set-leader-keys "jd" 'fri3nds/open-sync-todo-file)
(spacemacs/set-leader-keys "jh" 'ibuffer)
(spacemacs/set-leader-keys "jj" 'helm-buffers-list)
(spacemacs/set-leader-keys "jq" 'fri3nds/open-note-file)
(spacemacs/set-leader-keys "js" 'fri3nds/open-snippets)
(spacemacs/set-leader-keys "jt" 'fri3nds/open-tools)
(spacemacs/set-leader-keys "jz" 'fri3nds/open-password-file)

(spacemacs/set-leader-keys "kk" 'projectile-find-file)
(spacemacs/set-leader-keys "ka" 'text-scale-increase)
(spacemacs/set-leader-keys "kd" 'text-scale-decrease)

(spacemacs/set-leader-keys "gg" 'spacemacs/helm-project-do-ag-region-or-symbol)
(spacemacs/set-leader-keys "hh" 'previous-buffer)
(spacemacs/set-leader-keys "hi" 'highlight-indent-guides-mode)

(spacemacs/set-leader-keys "ii" 'evil-avy-goto-char-in-line)
;; (spacemacs/set-leader-keys "il" 'fri3nds-insert-lines)
(spacemacs/set-leader-keys "mm" 'helm-show-kill-ring)
(spacemacs/set-leader-keys "nn" 'next-buffer)
(spacemacs/set-leader-keys "ng" 'search-google-symbol)

(spacemacs/set-leader-keys "oc" 'org-capture)
(spacemacs/set-leader-keys "oo" 'projectile-switch-project)
(spacemacs/set-leader-keys "qq" 'fri3nds-neotree-toggle)
(spacemacs/set-leader-keys "si" 'org-insert-src-block)
(spacemacs/set-leader-keys "sl" 'helm-resume)
(spacemacs/set-leader-keys "ts" 'counsel-load-theme)
;; (spacemacs/set-leader-keys "tt" 'neotree-toggle)
(spacemacs/set-leader-keys "tt" 'spacemacs/linum-relative-toggle)
;; (spacemacs/set-leader-keys "tl" 'linum-mode)
(spacemacs/set-leader-keys "tl" 'display-line-numbers-mode)
(spacemacs/set-leader-keys "ty" 'fri3nds/load-yasnippet)

;; (spacemacs/set-leader-keys "uu" 'evilnc-comment-or-uncomment-lines)

(spacemacs/set-leader-keys "wo" 'delete-other-windows)
(spacemacs/set-leader-keys "xx" 'backward-up-list)
(spacemacs/set-leader-keys "xz" 'up-list)

(spacemacs/set-leader-keys "yi" 'yas-insert-snippet)
(spacemacs/set-leader-keys "yy" 'spacemacs/copy-whole-buffer-to-clipboard)
(spacemacs/set-leader-keys "zz" 'fzf)




(global-set-key (kbd "s-y") 'redo)

(define-key evil-normal-state-map (kbd "L") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "L") 'move-end-of-line)
;; evil-last-non-blank

;; (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
;; (define-key evil-insert-state-map (kbd "C-a") 'evil-insert-line)

(define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "<tab>") 'next-buffer)
(define-key evil-visual-state-map (kbd "H") 'evil-beginning-of-line)

(define-key evil-normal-state-map (kbd "M") 'evil-search-clear-highlight)
(define-key evil-visual-state-map (kbd "M") 'evil-search-clear-highlight)

(define-key evil-normal-state-map (kbd "zM") 'evil-open-folds)

(global-set-key (kbd "s-i") 'string-inflection-toggle)
(global-set-key (kbd "s-j") 'avy-goto-char)
(global-set-key (kbd "s-u") 'upper-first-char-of-word-at-point)

(global-set-key (kbd "<S-up>") 'shrink-window)
(global-set-key (kbd "<S-down>") 'enlarge-window)
(global-set-key (kbd "<S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<S-right>") 'enlarge-window-horizontally)



(setq org-capture-templates nil)

(add-to-list 'org-capture-templates '("t" "Tasks"))

(add-to-list 'org-capture-templates
  '("w" "Work Task" entry
     (file+headline "/Users/fri3nds/Dropbox/org/tuya-work.org" "Work")
     "* TODO %^{任务名}\n%U\n%a\n"))
