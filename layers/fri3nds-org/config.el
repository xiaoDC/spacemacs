;; (setq org-latex-classes
;;       '(("article"
;;          "
;; \\documentclass[12pt,a4paper]{article}
;; \\usepackage[margin=2cm]{geometry}
;; \\usepackage{fontspec}
;; \\setromanfont{cwTeXMing}

;; \\usepackage{etoolbox}  % Quote 部份的字型設定
;; \\newfontfamily\\quotefont{cwTeXFangSong}
;; \\AtBeginEnvironment{quote}{\\quotefont\\small}

;; \\setmonofont[Scale=0.9]{Courier} % 等寬字型 [FIXME] Courier 中文會爛掉！
;; \\font\\cwSong=''cwTeXFangSong'' at 10pt
;; %\\font\\cwHei=''cwTeXHeiBold'' at 10p %不知為何這套字型一用就爆掉...
;; \\font\\cwYen=''cwTeXYen'' at 10pt
;; \\font\\cwKai=''cwTeXKai'' at 10pt
;; \\font\\cwMing=''cwTeXMing'' at 10pt
;; \\font\\wqyHei=''文泉驛正黑'' at 10pt
;; \\font\\wqyHeiMono=''文泉驛等寬正黑'' at 10pt
;; \\font\\wqyHeiMicro=''文泉驛微米黑'' at 10pt
;; \\XeTeXlinebreaklocale ``zh''
;; \\XeTeXlinebreakskip = 0pt plus 1pt
;; \\linespread{1.36}

;; % [FIXME] ox-latex 的設計不良導致 hypersetup 必須在這裡插入
;; \\usepackage{hyperref}
;; \\hypersetup{
;;   colorlinks=true, %把紅框框移掉改用字體顏色不同來顯示連結
;;   linkcolor=[rgb]{0,0.37,0.53},
;;   citecolor=[rgb]{0,0.47,0.68},
;;   filecolor=[rgb]{0,0.37,0.53},
;;   urlcolor=[rgb]{0,0.37,0.53},
;;   pagebackref=true,
;;   linktoc=all,}
;; "
;;          ("\\section{%s}" . "\\section*{%s}")
;;          ("\\subsection{%s}" . "\\subsection*{%s}")
;;          ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;          ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;          ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;         ))

;; [FIXME]
;; 原本是不要讓 org 插入 hypersetup（因為 org-mode 這部份設計成沒辦法自訂，或許可以去 report 一下？）
;; 改成自行插入，但這樣 pdfcreator 沒辦法根據 Emacs 版本插入，pdfkeyword 也會無效...幹。

;; (setq org-latex-with-hyperref t)

;; 把預設的 fontenc 拿掉
;; 經過測試 XeLaTeX 輸出 PDF 時有 fontenc[T1]的話中文會無法顯示。
;; hyperref 也拿掉，改從 classes 處就插入，原因見上面 org-latex-with-hyperref 的說明。

;; (setq org-latex-default-packages-alist
;;       '(("" "hyperref" nil)
;;         ("AUTO" "inputenc" t)
;;         ("" "fixltx2e" nil)
;;         ("" "graphicx" t)
;;         ("" "longtable" nil)
;;         ("" "float" nil)
;;         ("" "wrapfig" nil)
;;         ("" "rotating" nil)
;;         ("normalem" "ulem" t)
;;         ("" "amsmath" t)
;;         ("" "textcomp" t)
;;         ("" "marvosym" t)
;;         ("" "wasysym" t)
;;         ("" "multicol" t)  ; 這是我另外加的，因為常需要多欄位文件版面。
;;         ("" "amssymb" t)
;;         "\\tolerance=1000"))


;; Use XeLaTeX to export PDF in Org-mode
;; (setq org-latex-pdf-process
;;       '("xelatex -interaction nonstopmode -output-directory %o %f"
;;         "xelatex -interaction nonstopmode -output-directory %o %f"
;;         "xelatex -interaction nonstopmode -output-directory %o %f"))


;; 指定你要用什麼外部 app 來開 pdf 之類的檔案。我是偷懶所以直接用 kde-open，你也可以指定其他的。
;; (setq org-file-apps '((auto-mode . emacs)
;;                       ("\\.mm\\'" . default)
;;                       ("\\.x?html?\\'" . "xdg-open %s")
;;                       ("\\.pdf\\'" . "kde-open %s")
;;                       ("\\.jpg\\'" . "kde-open %s")))

(setq org-default-notes-file "/Users/fri3nds/org/notes.org")

(setq org-agenda-files (list "/Users/fri3nds/Dropbox/org/tuya-work.org"
                             "/Users/fri3nds/org/Learning.org"
                             "/Users/fri3nds/Dropbox/org/interview.org"
                             "/Users/fri3nds/Dropbox/org/meeting.org"
                             "/Users/fri3nds/Dropbox/org/TODO.org"
                             ;; "/Users/fri3nds/org/notes.org"
                             ;; "/Users/fri3nds/org/API.org"
                             ;; "/Users/fri3nds/org/malfunction.org"
                             ))

(setq org-html-checkbox-type 'unicode)

;; (defun sacha/org-html-checkbox (checkbox)
;;   "Format CHECKBOX into HTML."
;;   (case checkbox (on "<span class=\"check\">&#x2611;</span>") ; checkbox (checked)
;;     (off "<span class=\"checkbox\">&#x2610;</span>")
;;     (trans "<code>[-]</code>")
;;     (t "")))

;; (defadvice org-html-checkbox (around sacha activate)
;;   (setq ad-return-value (sacha/org-html-checkbox (ad-get-arg 0))))


;; 优先级范围和默认任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority ?E)
(setq org-default-priority ?E)

(setq org-fancy-priorities-list '("🅰" "🅱" "🅲" "🅳" "🅴"))
;; 优先级醒目外观
;; (setq org-priority-faces '(
;;                            (?A . (:background "red" :foreground "white" :weight bold))
;;                            (?B . (:background "DarkOrange" :foreground "white" :weight bold))
;;                            (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
;;                            (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
;;                            (?E . (:background "SkyBlue" :foreground "black" :weight bold)) ))


(setq org-todo-keywords
      (quote ((sequence "TODO(t!)"  "NEXT(n!)" "IDEA(i!)" "|" "DONE(d!)")
              ;; (sequence "REPEAT(r)"  "WAIT(w!)"  "|"  "PAUSED(p@/!)" "CANCELLED(c@/!)" )
              ;; (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
              )))



;; (setq org-hide-emphasis-markers t)
(setq org-hide-emphasis-markers t
      org-fontify-done-headline t
      ;; org-hide-leading-stars t
      ;; org-pretty-entities t
      org-odd-levels-only t)


;; (font-lock-add-keywords 'org-mode
;;                         '(("^ +\\([-*]\\) "
;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; (setq org-list-demote-modify-bullet
;;       (quote (
;;               ("+" . "-")
;;               ("-" . "+")
;;               ("*" . "-")
;;               ("1." . "-")
;;               ("1)" . "-")
;;               ("A)" . "-")
;;               ("B)" . "-")
;;               ("a)" . "-")
;;               ("b)" . "-")
;;               ("A." . "-")
;;               ("B." . "-")
;;               ("a." . "-")
;;               ("b." . "-"))))
