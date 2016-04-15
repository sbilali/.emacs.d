;; Require Emacs' package functionality
(require 'package)

;; Add the Melpa repository to the list of package sources
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Initialise the package system.
(package-initialize)

(require 'ido)
(ido-mode t)

;; ligne à la 80 colonne
(require 'fill-column-indicator)
(setq-default fill-column 80)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

;; remove icones tool bar
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

;; pour afficher les num de ligne
(global-linum-mode 1)

;; move line
(global-move-dup-mode)

;; pour lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


(setq ispell-dictionary "francais")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-auto-pairing t)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation
(add-hook 'web-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation


(global-flycheck-mode)
(eval-after-load 'flycheck
  '(flycheck-add-mode 'html-tidy 'web-mode))
;;                  (setq emmet-use-css-transform nil)))))
;; key binding des mouvement
;;      r
;;  t      n
;;      s
					;p
;; on libère les touche b     f  

(global-set-key "\C-cu" 'untabify)

(global-set-key "\C-ct" 'delete-trailing-whitespace)

(global-unset-key "\C-t") ;; transpose-chars enlevé
(global-set-key "\C-t" 'backward-char )

(global-unset-key "\M-t") ;; transpore words
(global-set-key "\M-t" 'backward-word)

(global-unset-key "\C-s") ;;i-sarch forward
(global-set-key "\C-s" 'next-line)

(global-unset-key "\C-r") ;;i-search backward-char
(global-set-key "\C-r" 'previous-line)

(global-unset-key "\C-n") ;; next-line
(global-set-key "\C-n" 'forward-char)

(global-unset-key "\C-v") ;; scroll-up-command
(global-set-key "\C-v" 'isearch-forward)

(global-set-key "\M-r" 'scroll-up-command)
(global-set-key "\M-s" 'scroll-down)

(global-set-key "\M-n" 'forward-word)

;; on va utiliser C-b comme C-x o
(global-unset-key "\C-b")
(global-set-key "\C-b" 'other-window)


;; on va utiliser p pour spliter verticalement
(global-set-key "\C-p" 'split-window-right)



;; transpose des lignes
(global-set-key "\C-xt" 'transpose-lines)

;; copy line
(global-set-key "\M-k" "\C-a\C- \C-s\M-w")
(global-unset-key "\C-k")
(global-set-key "\C-k" 'kill-whole-line)

(global-set-key "\C-cs" 'whitespace-mode)


;; met le ~ dans .saves
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd" :family "Inconsolata")))))
