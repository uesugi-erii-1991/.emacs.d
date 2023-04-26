;;更换编码
(prefer-coding-system 'utf-8)
(unless *is-windows*
  (set-selection-coding-system 'utf-8))

;;显示行号
(global-display-line-numbers-mode t)


(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))
;; Set garbage collection threshold to 512M.
;;(setq gc-cons-threshold #x20000000);;设置垃圾回收阀值
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collector has run for %.06fsec"
                                  (k-time (garbage-collect))))))
;;(setq gc-cons-threshold most-positive-fixnum);;设置垃圾回收阀值,提高启动速度
(setq confirm-kill-emacs #'y-or-n-p)

;;关闭开始界面
(setq inhibit-startup-screen t)
;;自动补全括号
(electric-pair-mode t) 
;;编程模式下,光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'show-paren-mode) 
 ;;在mode line上显示括号
(column-number-mode t)
 ;;在另一程序修改文件时emacs及时刷新
(global-auto-revert-mode t) 

;;关闭文件自动备份
(setq make-backup-files nil)
;;编程模式下,可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode)

(provide 'init-startup)

