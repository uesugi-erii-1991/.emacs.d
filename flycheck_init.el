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

(defun cocos-creator ()
  (interactive)
  (let ((default-directory "D:/cocos-dashboard-editors/3.7.1/CocosCreator.exe"))
    (async-shell-command "start ./CocosCreator.exe")
    (shell "*cocos creator*")))

(global-set-key [f8] 'cocos-creator)




;; (defun open-files ()
  ;; "打开命令行传入的两个文件."
  ;; (interactive)
  ;; (find-file (nth 0 command-line-args))
  ;; (split-window-right)
  ;; (find-file-other-window (nth 1 command-line-args)))
  ;; (find-file-other-window (nth 1 command-line-args)))

;; (if (> (length command-line-args) 0)
    ;; (open-files))
(defun open-files ()
  "打开命令行传入的两个文件."
  (interactive)
  (find-file (nth 0 command-line-args))
  (find-file (nth 1 command-line-args)))

(if (> (length command-line-args) 1)
    (open-files))


(if (> (length command-line-args) 0)
    (message "编辑器"))


;; (comint-send-string (get-buffer-process (current-buffer)) "ls\n")
(defun my-output-filter (output)
  (message output))

(add-hook 'comint-output-filter-functions 'my-output-filter)


;; (defun my-message-handler (message)
  ;; (interactive)
  ;; (message "Received message: %s" message))

;; (add-function 'server-switch-hook 'my-message-handler 'before)



(defun my-server-process-filter (proc string)
  (let ((args (split-string string "\0" t)))
    (dolist (arg args)
      (when (string-prefix-p "--version" arg)
        (message "Version 1.0"))
      (when (string-prefix-p "--help" arg)
        (message "Help message"))
      (when (string-prefix-p "--my-arg" arg)
        (message "My argument"))
      ;; Add more argument handling here
      )))


(defun my-server-process-filter (proc string)
  (let ((args (split-string string "\0" t)))
    (when (and (> (length args) 1) (file-exists-p (nth 1 args)))
      (find-file (nth 1 args)))
    (dolist (arg args)
      (when (string-prefix-p "--version" arg)
        (message "Version 1.0"))
      (when (string-prefix-p "--help" arg)
        (message "Help message"))
      (when (string-prefix-p "--my-arg" arg)
        (message "My argument"))
      ;; Add more argument handling here
      )))
(add-hook 'server-switch-hook
          (lambda ()
            (when server-process
              (setq server-process-filter 'my-server-process-filter))))
