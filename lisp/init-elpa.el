
;;package换成国内源
(setq package-archives
      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(require 'package)
;;有些包签名失败，不检查签名
(setq package-check-signature nil)

;;初始化包
;; (unless (bound-and-true-p package--initialized)
;;   (package-initialize));; You might already have this 
(package-initialize)
;;刷新软件索引
(unless package-archive-contents
  (package-refresh-contents))




;;安装use-package插件管理软件包
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
  
(eval-when-compile (require 'use-package))


(setq ;; use-package-always-ensure t  ;;是否确保安装上插件  默认所有包开启:ensure t
      use-package-always-defer t ;;是否延迟加载,默认所有软件包开启
      ;; use-packate-always-demand nil
      use-package-expand-minimally t
      use-package-enable-imenu-support t
      use-package-verbose t) ;;加载的配置安装过程打印出来
(use-package quelpa
  :ensure t
  :init
;;  (quelpa-self-upgrade)
  ;;:config
  )
(setq quelpa-update-melpa-p nil)
;;(use-package quelpa-use-package
;;  :ensure t)
;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-use-package.git"))
;; (require 'quelpa-use-package )
;; ;;  (quelpa-use-package-activate-advice))
;; ;; 直接 HTTP get 一个 elisp
;;  (use-package dired+
;;    :quelpa (dired+ :fetcher url :url "https://www.emacswiki.org/emacs/download/dired+.el"))
;;(use-package goto-chg :quelpa



(provide 'init-elpa)
