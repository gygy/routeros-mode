

;;########################################################################
;;** which-key
;;作用: Emacs中的快捷键导师，按下某些键，则显示所有相关的快捷键
;;########################################################################
;;https://github.com/justbur/emacs-which-key.git
;;(add-to-list 'load-path "~/.emacs.d/apps/emacs-which-key")
(require 'which-key)
(which-key-mode)

;; (setq which-key-idle-delay 0.5)

;; 显示方式
(which-key-setup-side-window-bottom)    ; 默认显示在底部
 ;; (which-key-setup-side-window-right)     ; 显示在右边

(which-key-setup-minibuffer)

;; (which-key-setup-side-window-right-bottom) ; 动态使用底部 或 右侧

(setq which-key-popup-type 'side-window)

(setq which-key-compute-remaps t) ;Show correct descriptions for remapped keys

(setq which-key-allow-multiple-replacements t) ;Default = nil

;; 默认配置
(setq which-key-sort-order 'which-key-key-order)
;; 和默认一样，但单个字符按字母顺序排序
;; (setq which-key-sort-order 'which-key-key-order-alpha)
;; 和默认一样，但所有前缀键会被分组放在最后
;; (setq which-key-sort-order 'which-key-prefix-then-key-order)
;; 和默认一样，但首先显示所有来自本地映射的键
;; (setq which-key-sort-order 'which-key-local-then-key-order)
;; 根据键的描述（忽略大小写）进行排序
;; (setq which-key-sort-order 'which-key-description-order)


;; (setq which-key-popup-type 'frame)

;; 为快捷键添加注释或替换原来的函数名


;; (which-key-add-key-based-replacements
;;   "C-x 8"   "unicode"
;;   "C-x a"   "abbrev/expand"
;;   "C-x r"   "rectangle/register/bookmark"
;;   "C-x v"   "version control"
;;   "C-c /"   "engine-mode-map"
;;   "C-c C-v" "org-babel"
;;   "C-x 8 0" "ZWS")


;; default
(setq which-key-sort-order 'which-key-key-order)




;;...........................................................
;;***
;;...........................................................
;; Highlight certain commands
(defface modi/which-key-highlight-2-face
  '((t . (:inherit which-key-command-description-face :foreground "indian red")))
  "Another face for highlighting commands in `which-key'.")

(defface modi/which-key-highlight-3-face
  '((t . (:inherit which-key-command-description-face :foreground "DarkOrange3")))
  "Another face for highlighting commands in `which-key'.")

(setq which-key-highlighted-command-list
      '(("\\`hydra-" . which-key-group-description-face)
        ;; Highlight using the `modi/which-key-highlight-2-face'
        ("\\`modi/" . modi/which-key-highlight-2-face)
        ;; Highlight using the `modi/which-key-highlight-3-face'
        
        ("\\`my-" . modi/which-key-highlight-3-face)
        
        ("\\`counsel-" . modi/which-key-highlight-3-face)
        ;; Highlight using the default `which-key-highlighted-command-face'
        "\\`describe-"
        "\\(rectangle-\\)\\|\\(-rectangle\\)"
        "\\`org-"))

;;########################################################################
;;** general
;;作用: Emacs中的快捷键导师，按下某些键，则显示所有相关的快捷键
;;########################################################################
(require 'general)
;; (general-override-mode 1)
;; (general-create-definer tyrant-def-1
;;   :states '(normal visual insert motion emacs)
;;   :prefix "SPC"
;;   :non-normal-prefix "C-SPC")

;; (tyrant-def-1
;;  ""     nil
;;  "c"   (general-simulate-key "C-c")
;;  "h"   (general-simulate-key "C-h")
;;  "u"   (general-simulate-key "C-u")
;;  "x"   (general-simulate-key "C-x")

;;  ;; Package manager
;;  "lp"  'list-packages

;;  ;; Quit operations
;;  "q"	'(:ignore t :which-key "quit emacs")   
;;  "qq"  'kill-emacs
;;  "qz"  'delete-frame

;;  ;; Buffer operations
;;  "b"   '(:ignore t :which-key "buffer")  
;;  "bb"  'mode-line-other-buffer
;;  "bd"  'kill-this-buffer 
;;  "bD"  'vb/close-all-buffers
;;  "b]"  'next-buffer
;;  "b["  'previous-buffer 
;;  "bq"  'kill-buffer-and-window
;;  "bR"  'rename-filand-buffer
;;  "br"  'revert-buffer 
;;  )     

(provide 'init-which-key) 
;;;;; my-test.el ends here
           