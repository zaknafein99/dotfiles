(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
;;	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'gruvbox-theme)
  (package-refresh-contents)
  (package-install 'gruvbox-theme))
;;;;;;;;;
(org-babel-load-file (expand-file-name "~/my-dot-files/emacs.org"))
;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(display-time-mode t)
 '(font-use-system-font t)
 '(gruvbox-theme-comment-italic t)
 '(package-selected-packages
   (quote
    (fzf haskell-mode gruvbox-theme aggressive-indent transmission evil-leader markdown-mode auctex rainbow-mode rainbow org-bullets beacon gruvbox-theme which-key use-package undo-tree solarized-theme neotree magit linum-relative js2-mode highlight-numbers highlight-escape-sequences goto-chg avy ample-theme)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:background "#292e34" :foreground "#2aa1ae" :slant italic))))
 '(hl-line ((t (:background "#212026")))))
