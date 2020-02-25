(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(global-linum-mode t)
(desktop-save-mode t)

(defun move-to-tmp-txt ()
  (interactive)
  (find-file "/tmp/test.txt"))

(defun start-explorer-here ()
  (interactive)
  (shell-command "start ."))

(defun open-init-el ()
  (interactive)
  (find-file "c:/Users/yangyang.huang/AppData/Roaming/.emacs.d/init.el"))

(defun utf8-declaration ()
  (interactive)
  (insert "# -*- coding: utf-8 -*-"))

(defun insert-org-header ()
  (interactive)
  (beginning-of-buffer)
  (insert
   "#+TITLE: \n"
   "#+OPTIONS: ^:nil\n"
   "#+HTML_HEAD: <style type=\"text/css\"> .src {background-color: #000000; color: #ffffff;}</style>\n"
   "#+HTML_HEAD: <style type=\"text/css\"> table, th, td {border: 3px solid black; border-collapse: collapse; }</style>\n"
   "\n"
   )
  (beginning-of-buffer)
  (move-end-of-line)
  )

(defun update-schedule ()
  (interactive)
  (shell-command
   (concat 
    "python c:/Users/yangyang.huang/Desktop/test/gantt_chart/excel-gantt-chart/org_to_gantt.py"
    " "
    ;; "\"C:/Users/yangyang.huang/Desktop/test/gantt_chart/excel-gantt-chart/test_calendar.org\""
    (buffer-file-name)
    " "
    ;; "\"C:/Users/yangyang.huang/OneDrive - Accenture/Microsoft Teams チャット ファイル/個人生保.xlsx\""
    "C:/Users/yangyang.huang/Desktop/モデル評価_20191113.xlsx"
    )))

(defun current-buffer-name ()
  (interactive)
  (kill-new (car (last (split-string (buffer-file-name) "/"))))
  )

(defun do-nothing ()
  (interactive)
  ()
  )

;; (defun indent-region-condition ()
;;   (interactive)
;;   (if (derived-mode-p 'sql-mode)
;;       (sql-indent-buffer)
;;     (indent-region)))

(global-set-key (kbd "C-c h") 'insert-org-header)
(global-set-key (kbd "C-c j")  'windmove-left)
(global-set-key (kbd "C-c k")  'windmove-down)
(global-set-key (kbd "C-c i")    'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c r") 'indent-region)
(global-set-key (kbd "C-c t") 'move-to-tmp-txt)
;; (global-set-key (kbd "C-=") 'set-mark-command)
;; windows start explorer here
(global-set-key (kbd "C-c o") 'start-explorer-here)
(global-set-key (kbd "C-c b") 'current-buffer-name)
(global-set-key (kbd "C-c c") 'open-init-el)
(global-set-key (kbd "C-c d") 'utf8-declaration)

;; (global-set-key [M-kanji] 'dummy)

(defun cs-yank-pop-forward ()
  (interactive)
  (yank-pop -1))
(global-set-key (kbd "M-u") 'cs-yank-pop-forward)

;; Unbind Pesky Sleep Button
;; (global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

(fset 'to-scratch
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 98 42 115 99 114 97 116 99 104 42 return] 0 "%d")) arg)))

(global-set-key (kbd "C-c s") 'to-scratch)

(fset 'remove-space
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\240" 0 "%d")) arg)))

(global-set-key (kbd "C-c SPC") 'remove-space)

(fset 's-sql
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([18 66 69 71 73 78 95 83 82 67 32 115 113 108 6 1 14 67108925 19 69 78 68 95 83 82 67 1 134217847] 0 "%d")) arg)))

(fset 's-sql2
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("BEGIN_SRC sql\0END_SRC\367" 0 "%d")) arg)))


(global-set-key (kbd "C-c q") 's-sql2)

(fset 'select_main
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\276\0__name__ == \"__\367" 0 "%d")) arg)))

(global-set-key (kbd "C-c m") 'select_main)

;; (fset 'la
;;    (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 44 6 2 99 97 115 101 32 119 104 101 110 32 108 105 115 116 97 103 103 40 100 105 115 116 105 110 99 116 32 0 5 134217847 44 32 39 39 41 32 110 111 116 32 108 105 107 101 32 39 37 44 37 39 134217826 134217826 2 2 2 44 5 return 116 104 101 110 32 109 97 120 40 25 41 32 101 110 100 32 97 115 32 111 108 100 95] 0 "%d")) arg)))

;; (global-set-key (kbd "C-c a") 'la)

;; (require 'ox-textile)
;; (require 'ox-qmd)
;; (require 'toc-org)
;; (add-hook 'org-mode-hook 'toc-org-enable)

(setq flycheck-flake8-maximum-line-length 120)
(setq make-backup-files nil)
(setq auto-save-default nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq python-shell-interpreter "ipython3")
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "DONE" "PENDING")))

(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-hl-line-mode 1)

(require 'undo-tree)
(global-undo-tree-mode t)

(setq exec-path (append exec-path '("C:/Users/yangyang.huang/Downloads/emacs-26.1-x86_64/share/infozip")))

;; (eval-after-load "sql"
;;   '(load-library "~/.emacs.d/sql-indent.el"))

;; https://www.emacswiki.org/emacs/Tramp_on_Windows
;; (when (eq window-system 'w32)
;;   (setq tramp-default-method "plink")
;;   (when (and (not (string-match putty-directory (getenv "PATH")))
;; 	     (file-directory-p putty-directory))
;;     (setenv "PATH" (concat putty-directory ";" (getenv "PATH")))
;;     (add-to-list 'exec-path putty-directory)))

;; Warning (initialization): An error occurred while loading init.el

;; Symbol's value as variable is void: putty-directory

;; To ensure normal operation, you should investigate and remove the
;; cause of the error in your initialization file.  Start Emacs with
;; the ‘--debug-init’ option to view a complete error backtrace.

;; https://emacs.stackovernet.com/ru/q/2521
(defun cd (dir)
     "Make DIR become the current buffer's default directory.
If your environment includes a 'CDPATH' variable, try each one of
that list of directories (separated by occurrences of
'path-separator') when resolving a relative directory name.
The path separator is colon in GNU and GNU-like systems."
     (interactive
      (list
       ;; FIXME: There's a subtle bug in the completion below.  Seems linked
       ;; to a fundamental difficulty of implementing 'predicate' correctly.
       ;; The manifestation is that TAB may list non-directories in the case where
       ;; those files also correspond to valid directories (if your cd-path is (A/
       ;; B/) and you have A/a a file and B/a a directory, then both 'a' and 'a/'
       ;; will be listed as valid completions).
       ;; This is because 'a' (listed because of A/a) is indeed a valid choice
       ;; (which will lead to the use of B/a).
       (minibuffer-with-setup-hook
           (lambda ()
             (setq minibuffer-completion-table
                   (apply-partially #'locate-file-completion-table
                                    cd-path nil))
             (setq minibuffer-completion-predicate
                   (lambda (dir)
                     (locate-file dir cd-path nil
                                  (lambda (f) (and (file-directory-p f) 'dir-ok))))))
         (unless cd-path
           (setq cd-path (or (parse-colon-path (getenv "CDPATH"))
                             (list "./"))))
         (read-directory-name "Change default directory: "
                              default-directory default-directory
                              t))))
     (unless cd-path
       (setq cd-path (or (parse-colon-path (getenv "CDPATH"))
                         (list "./"))))
     (cd-absolute
      (or (locate-file dir (cons default-directory cd-path) nil
                       (lambda (f) (and (file-directory-p f) 'dir-ok)))
          (error "No such directory found via CDPATH environment variable"))))


(defun wsl ()
  (interactive)
  (let ((explicit-shell-file-name "C:/Windows/System32/bash.exe"))
    (shell)))
