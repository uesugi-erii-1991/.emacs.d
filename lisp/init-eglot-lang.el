(use-package csharp-mode
  :ensure t
  :init
  (add-hook 'csharp-mode-hook #'company-mode
	    ))

(use-package company
  :config 
  (setq company-dabbrev-code-everywhere t 
        company-dabbrev-code-modes t 
        company-dabbrev-code-other-buffers 'all 
        company-dabbrev-downcase nil 
        company-dabbrev-ignore-case t 
        company-dabbrev-other-buffers 'all 
        company-require-match nil 
        company-minimum-prefix-length 2 
        company-show-numbers t 
        company-tooltip-limit 20 
        company-idle-delay 0 
        company-echo-delay 0 
        company-tooltip-offset-display 'scrollbar 
        company-begin-commands '(self-insert-command)) 
  (push '(company-semantic :with company-yasnippet) company-backends) 
  :hook ((after-init . global-company-mode)))


(use-package eglot
  :ensure t
  ;;  :commands (eglot eglot-ensure)
  :hook (
	 (csharp-mode . eglot-ensure)
	 )
  :config
  (setq read-process-output-max (* 1024 1024))
  (push :documentHighlightProvider eglot-ignored-server-capabilities)
  (setq eldoc-echo-area-use-multiline-p nil)
   (add-to-list 'eglot-server-programs
	        '(csharp-mode . ("csharp-ls"))
;;	       '(csharp-mode . ("C:/Users/huyu/.omnisharp/omnisharp-win-x64-net6.0/OmniSharp.exe" "lsp")))
;;	       '(csharp-mode . ("OmniSharp" "lsp"))
  )
					;  (add-to-list 'eglot-server-programs
;	       '(csharp-mode . ("C:/Users/huyu/.omnisharp/omnisharp-win-x64-net6.0/OmniSharp.exe" "lsp")))

  )

;;(use-package lsp-ui
;;  ;; 仅在某软件包被加载后再加载
;;  :after (eglot-mode)
;;  ;; 延时加载
;;  :commands (lsp-ui-mode)
;;  :bind
;;  (:map lsp-ui-mode-map
;;        ;; 查询符号定义：使用 LSP 来查询。通常是 M-.
;;        ([remap xref-find-references] . lsp-ui-peek-find-references)
;;        ;; 查询符号引用：使用 LSP 来查询。通常是 M-?
;;        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;        ;; 该文件里的符号列表：类、方法、变量等。前提是语言服务支持本功能。
;;        ("C-c u" . lsp-ui-imenu))
;;  ;; 当 lsp 被激活时自动激活 lsp-ui
;;  :hook (eglot-mode . lsp-ui-mode)
;;  :init
;;  ;; lsp-ui 有相当细致的功能开关。具体参考：
;;  ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
;;  (setq lsp-enable-symbol-highlighting t
;;        lsp-ui-doc-enable t
;;        lsp-lens-enable t
;;	lsp-ui-sideline-show-diagnostics nil
;;	))




(provide 'init-eglot-lang)

