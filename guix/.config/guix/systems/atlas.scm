(define-module (atlas)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "atlas")

 (swap-devices
  (list (swap-space
         (target
          (uuid "d51d2064-elf2-49c7-af8e-a56bcdcdf348")))))
 (file-systems
  (cons* (file-system
          (mount-point "/boot/efi")
          (device
           (uuid "abdd2940-5c77-4624-9849-384063f71e89"
                 'ext4))
          (type "ext4"))
         (file-system
          (mount-point "/home")
          (device
           (uuid "1e651bca-1fa8-42dc-90d4-e6440a9159e6"
                 'ext4))
          (type "ext4"))
         %base-file-systems)))
