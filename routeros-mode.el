;;; routeros-mode.el --- Major mode for editing RouterOS configuration files
;;
;; Author: Your Name <you@example.com>
;; Version: 1.0
;; Keywords: router, configuration
;; License: GPL-3.0-or-later

(defvar routeros-mode-hook nil
  "Hook called by `routeros-mode'.")

(defvar routeros-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for RouterOS configuration major mode.")

;; Font locking definitions
(defvar routeros-command-face 'routeros-command-face "Face for RouterOS commands")
(defvar routeros-ipaddr-face 'routeros-ipaddr-face "Face for IP addresses")

(defface routeros-ipaddr-face
  '((t (:foreground "lightblue")))
  "Face for IP addresses.")

(defface routeros-command-face
  '((t (:foreground "cyan")))
  "Face for RouterOS commands.")

(defconst routeros-font-lock-keywords
  (list
   '("\\<\\(interface\\|ip\\|route\\|add\\|set\\|remove\\|comment\\)\\>" . routeros-command-face)
   '("\\<\\([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+\\)\\>" . routeros-ipaddr-face))
  "Font locking definitions for RouterOS mode.")

;; Indentation definitions
(defun routeros-indent-line ()
  "Indent current line as RouterOS configuration line."
  (let ((indent-level 0))
    (beginning-of-line)
    (when (looking-at "^\\s-*\\(\\(interface\\|ip\\|route\\|add\\|set\\|remove\\)\\)\\s-*")
      (setq indent-level 2))
    (indent-line-to indent-level)))

;; Custom syntax table
(defvar routeros-mode-syntax-table (make-syntax-table)
  "Syntax table for RouterOS mode.")

(modify-syntax-entry ?_ "w" routeros-mode-syntax-table)
(modify-syntax-entry ?- "w" routeros-mode-syntax-table)
(modify-syntax-entry ?! "<" routeros-mode-syntax-table)
(modify-syntax-entry ?\n ">" routeros-mode-syntax-table)

;; Entry point
(defun routeros-mode ()
  "Major mode for editing RouterOS configuration files."
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table routeros-mode-syntax-table)
  (use-local-map routeros-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(routeros-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'routeros-indent-line)
  (set (make-local-variable 'comment-start) "#")
  (setq major-mode 'routeros-mode
        mode-name "RouterOS Config")
  (run-hooks routeros-mode-hook))

(add-to-list 'auto-mode-alist '("\\.rsc\\'" . routeros-mode))

(provide 'routeros-mode)

;;; routeros-mode.el ends here
