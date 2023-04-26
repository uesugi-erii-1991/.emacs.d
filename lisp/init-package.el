
(use-package benchmark-init
 :ensure t
  ;; :config
  ;; ;; To disable collection of benchmark data after init is done.
  ;; (add-hook 'after-init-hook 'benchmark-init/deactivate))
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package restart-emacs
  :ensure t)
;;vim模式
(use-package evil
  :ensure t
  :init (evil-mode)
  )
;;undo重做插件
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree) ;;evil undo 使用undo tree
  )
(use-package delight
  :ensure t)
;;显示内存使用情况
(use-package memory-usage
  :ensure t
  )
;;常用命令显示在前面
(use-package amx
  :ensure t
  :init (amx-mode))

;; (use-package counsel
  ;; :ensure t)
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffer t)
;;  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (
   ;; :map minibuffer-local-map ("C-r" . counsel-minibuffer-history)
			)
  )

(use-package company
  :ensure t
  ;; 等价于 (add-hook 'after-init-hook #'global-company-mode)
  :hook (after-init . global-company-mode)
  :config
  ;; setq 可以像这样连着设置多个变量的值
  (setq company-tooltip-align-annotations t ; 注释贴右侧对齐
        company-tooltip-limit 20            ; 菜单里可选项数量
        company-show-numbers t              ; 显示编号（然后可以用 M-数字 快速选定某一项）
	company-idle-delay 0.1               ; 延时多少秒后弹出
        company-minimum-prefix-length 1     ; 至少几个字符后开始补全
        ))

;;开始界面显示
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook )
;;  :config
 (setq dashboard-banner-log-title "欢迎")
  (setq dashboard-startup-banner nil);;自定义图片
  (setq dashboard-items '((recents . 5);;显示文件数
  			  (bookmarks . 5);;显示最近书签
  			  ;;(projects . 5);显示最近项目
  			  
  			  ))
  )
;;(use-package company :ensure t :mode "company-mode")
;;(use-package company-box :ensure t
;;  :hook (company-mode . company-box-mode))


(use-package which-key
  :ensure t
  :init(which-key-mode))

;;项目管理
(use-package projectile
  :ensure t
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))

;;模版
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet))

(use-package auto-yasnippet
  :ensure t
  :bind
  (("C-c & w" . aya-create)
   ("C-c & y" . aya-expand) )
  :config
  (setq aya-persist-snippets-dir (concat user-emacs-directory "my/snippets")))

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))

(use-package org
  :pin melpa
  :ensure t)
;;; 这个配置一定要配置在 use-package 的初始化之前，否则无法正常安装
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)


(provide 'init-package)



