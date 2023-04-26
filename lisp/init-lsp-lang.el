;;csharp 插件设置
(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'"
  :interpreter "csharp"
  )

(use-package typescript-mode
  :ensure t
  :config (use-package ts-comint :ensure t)
  :mode "\\.ts\\'"
  :interpreter "typescript")
;; if you use typescript-mode
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;;给server-mode配置快捷键
(global-set-key (kbd "C-c u") 'server-mode)
;;lsp语言引擎
(use-package lsp-mode
  :ensure t
  :init
  ;;延时加载:仅当(lsp)函数被调用时(require)
  ;;在哪些语言启动lsp
  :hook (
 	 ((csharp-mode
	   typescript-mode
	  ) . lsp-deferred))
  
  :commands (lsp lsp-deferred )
  ;;在(require)执行前
   :config
  (add-hook 'before-save-hook 'lsp-format-buffer)
  (setq lsp-auto-configure t;;尝试自动加载
	;;	lsp-auto-guess-root t;;尝试自动猜测项目根目录
	lsp-idle-delay 0.500 ;;多长时间lsp向服务器刷新信息
	lsp-enable-snippet t;;使用lsp提供的代码片段
	;;lsp-prefer-flymale nil ;;不使用flymake
	lsp-diagnostics-provider :flycheck
	
	)
  (add-hook 'lsp-mode-hook
	    (lambda()
	      (define-key evil-normal-state-local-map
		(kbd "gD") 'lsp-find-references)))
  
  )
(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :commands (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
        ;; ([remap xref-find-references] . lsp-ui-peek-find-references)
        ;; ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ("C-c u" . lsp-ui-imenu))
  :hook (lsp-mode . lsp-ui-mode)
  :init
 ;; WORKAROUND
  ;; See: https://github.com/syl20bnr/spacemacs/issues/13355
  (setq lsp-ui-doc--buffer-prefix "*lsp-ui-doc-"
        lsp-ui-doc-winum-ignore t
        ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
        lsp-ui-doc-enable t
        lsp-ui-doc-position 'top
        lsp-ui-doc-alignment 'frame
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-text-scale-level -3



	;;来自lsp-mode
        lsp-enable-symbol-highlighting t
        lsp-lens-enable t
	lsp-lens-place-position 'top-left-corner
        lsp-headerline-breadcrumb-enable t
	)
  :custom-face
 ;; (lsp-ui-sideline-symbol ((t (:foreground "grey" :box (:line-width (1 . -1) :color "grey") :height 0.99))))

  (lsp-ui-sideline-symbol ((t (:foreground "grey" :box (:line-width 1  :color "grey") :height 0.7))))
  :custom 
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-actions-icon nil)
  
  :config
  (setq scroll-margin 0)
  (delight 'lsp-lens-mode nil 'lsp-lens)
  (define-key lsp-ui-mode-map [remap lsp--find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap lsp-find-references] #'lsp-ui-peek-find-references)
  )
 
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)


(provide 'init-lsp-lang)
