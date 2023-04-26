(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const);;常量
(require 'init-kbd);;快捷键
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)
;;语言服务协议,选择一种
;;lsp 可用 c#可用
(require 'init-lsp-lang)

;;(require 'init-eglot)
;;(require 'init-eglot-lang)
;;(require 'init-lsp-bridge-lang)

;;------------
;;(use-package eglot
;;  :commands (eglot eglot-ensure)
;;  :hook ((csharp-mode . eglot-ensure))
;;  :config
;;  (add-to-list 'eglot-server-programs
;;             '(csharp-mode . ("csharp-ls"))))



(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp/unity.el-main")))




(require 'unity)
(add-hook 'after-init-hook #'unity-mode)

(require 'init-IME)

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f1>") 'server-edit)
(global-set-key (kbd "<f2>") 'open-init-file)
