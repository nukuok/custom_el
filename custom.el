(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(package-selected-packages
   (quote
    (ox-qmd toc-org org-plus-contrib ox-textile ox-gfm uptimes regex-tool osx-location dsvn htmlize lua-mode gnuplot flycheck-ledger ledger-mode origami flycheck-clojure cider elein cljsbuild-mode clojure-mode slime-company hippie-expand-slime slime cask-mode flycheck-package highlight-quoted macrostep cl-lib-highlight aggressive-indent immortal-scratch auto-compile ipretty elisp-slime-nav paredit-everywhere paredit terraform-mode docker-compose-mode dockerfile-mode docker yaml-mode toml-mode racer rust-mode sql-indent projectile-rails yard-mode bundler goto-gem yari robe ruby-compilation inf-ruby rspec-mode ruby-hash-syntax flycheck-elm elm-mode hindent intero haskell-mode company-anaconda anaconda-mode pip-requirements restclient httprepl css-eldoc skewer-less less-css-mode scss-mode sass-mode rainbow-mode tagedit tidy org-pomodoro writeroom-mode org-cliplink grab-mac-link org-fstree smarty-mode php-mode add-node-modules-path skewer-mode js-comint prettier-js typescript-mode coffee-mode js2-mode json-mode erlang csv-nav csv-mode markdown-mode textile-mode cmd-to-echo alert magit-gh-pulls github-issues github-clone bug-reference-github yagist git-messenger magit whole-line-or-region whitespace-cleanup-mode wgrep vc-darcs unfill undo-tree symbol-overlay switch-window smex session scratch rainbow-delimiters projectile project-local-variables page-break-lines nlinum multiple-cursors move-dup mmm-mode magit-popup list-unicode-display ivy-historian ibuffer-vc highlight-escape-sequences guide-key gitignore-mode gitconfig-mode git-timemachine git-commit git-blamed fullframe flycheck-color-mode-line expand-region exec-path-from-shell disable-mouse diredfl dired-sort diminish diff-hl default-text-scale darcsum counsel company-quickhelp command-log-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized browse-kill-ring browse-at-remote beacon avy anzu)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-linum-mode t)

(global-set-key (kbd "C-c j")  'windmove-left)
(global-set-key (kbd "C-c k")  'windmove-down)
(global-set-key (kbd "C-c i")    'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c r") 'indent-region)

(defun cs-yank-pop-forward ()
  (interactive)
  (yank-pop -1))
(global-set-key (kbd "M-u") 'cs-yank-pop-forward)

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

(fset 'to-scratch
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 98 42 115 99 114 97 116 99 104 42 return] 0 "%d")) arg)))

(global-set-key (kbd "C-c s") 'to-scratch)

(fset 'remove-space
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\240" 0 "%d")) arg)))

(global-set-key (kbd "C-c SPC") 'remove-space)

(require 'ox-textile)
(require 'ox-qmd)
(require 'toc-org)
(add-hook 'org-mode-hook 'toc-org-enable)
