(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(size-indication-mode t)
 '(tab-bar-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "outline" :slant normal :weight regular :height 113 :width normal))))
 '(font-lock-builtin-face ((t (:foreground "#8888C6"))))
 '(font-lock-comment-face ((t (:foreground "gray55"))))
 '(font-lock-constant-face ((t (:foreground "#CF8E6D"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "sea green" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "#56a8f5" :weight semi-bold))))
 '(font-lock-keyword-face ((t (:foreground "#CF8E6D" :weight regular))))
 '(font-lock-string-face ((t (:foreground "#64a96f"))))
 '(font-lock-variable-name-face ((t (:foreground "gray95")))))




;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
  
  (use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)
;; you can utilize :map :hook and :config to customize copilot

;; enable completion automatically
(add-hook 'prog-mode-hook 'copilot-mode)

;; enable completion in insert mode
(customize-set-variable 'copilot-enable-predicates '(evil-insert-state-p))

; set keybinds to autocomplete by copilot
(define-key copilot-mode-map (kbd "M-C-<return>") #'copilot-accept-completion)
(define-key copilot-mode-map (kbd "C-<right>") #'copilot-accept-completion-by-word)
(define-key copilot-mode-map (kbd "C-<down>") #'copilot-accept-completion-by-line)
