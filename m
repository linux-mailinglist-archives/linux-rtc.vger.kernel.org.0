Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAE9E1F27
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2019 17:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403857AbfJWPXG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Oct 2019 11:23:06 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56901 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392424AbfJWPXG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Oct 2019 11:23:06 -0400
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E60F5240006;
        Wed, 23 Oct 2019 15:23:01 +0000 (UTC)
Date:   Wed, 23 Oct 2019 17:23:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Stephane Eranian <eranian@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Message-ID: <20191023152301.GQ3125@piout.net>
References: <20191023150311.844123-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023150311.844123-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/10/2019 17:01:58+0200, Arnd Bergmann wrote:
> There are two EFI RTC drivers, the original drivers/char/efirtc.c
> driver and the more modern drivers/rtc/rtc-efi.c.
> 
> Both implement the same interface, but the new one does so
> in a more portable way.
> 
> Move everything over to that one and remove the old one.
> 
> Cc: linux-ia64@vger.kernel.org
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Stephane Eranian <eranian@google.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> This was last discussed in early 2018 in
> https://lore.kernel.org/lkml/CAK8P3a0QZNY+K+V1HG056xCerz=_L2jh5UfZ+2LWkDqkw5Zznw@mail.gmail.com/
> 
> Nobody ever replied there, so let's try this instead.
> If there is any reason to keep the driver after all,
> please let us know.
> ---
>  arch/ia64/configs/bigsur_defconfig    |   3 +-
>  arch/ia64/configs/generic_defconfig   |   3 +-
>  arch/ia64/configs/gensparse_defconfig |   3 +-
>  arch/ia64/configs/tiger_defconfig     |   3 +-
>  arch/ia64/configs/zx1_defconfig       |   3 +-
>  drivers/char/Kconfig                  |   4 -
>  drivers/char/Makefile                 |   1 -
>  drivers/char/efirtc.c                 | 366 --------------------------
>  include/linux/miscdevice.h            |   2 +-
>  9 files changed, 11 insertions(+), 377 deletions(-)
>  delete mode 100644 drivers/char/efirtc.c
> 
> diff --git a/arch/ia64/configs/bigsur_defconfig b/arch/ia64/configs/bigsur_defconfig
> index b630bd7351c4..f3ba813a5b80 100644
> --- a/arch/ia64/configs/bigsur_defconfig
> +++ b/arch/ia64/configs/bigsur_defconfig
> @@ -57,7 +57,8 @@ CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_EXTENDED=y
>  CONFIG_SERIAL_8250_SHARE_IRQ=y
>  # CONFIG_HW_RANDOM is not set
> -CONFIG_EFI_RTC=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_EFI=y
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_AGP=m
> diff --git a/arch/ia64/configs/generic_defconfig b/arch/ia64/configs/generic_defconfig
> index 661d90b3e148..cb267a07c57f 100644
> --- a/arch/ia64/configs/generic_defconfig
> +++ b/arch/ia64/configs/generic_defconfig
> @@ -94,7 +94,8 @@ CONFIG_SERIAL_8250_NR_UARTS=6
>  CONFIG_SERIAL_8250_EXTENDED=y
>  CONFIG_SERIAL_8250_SHARE_IRQ=y
>  # CONFIG_HW_RANDOM is not set
> -CONFIG_EFI_RTC=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_EFI=y
>  CONFIG_RAW_DRIVER=m
>  CONFIG_HPET=y
>  CONFIG_AGP=m
> diff --git a/arch/ia64/configs/gensparse_defconfig b/arch/ia64/configs/gensparse_defconfig
> index 7844e6a956a4..7e25f2f031b6 100644
> --- a/arch/ia64/configs/gensparse_defconfig
> +++ b/arch/ia64/configs/gensparse_defconfig
> @@ -82,7 +82,8 @@ CONFIG_SERIAL_8250_NR_UARTS=6
>  CONFIG_SERIAL_8250_EXTENDED=y
>  CONFIG_SERIAL_8250_SHARE_IRQ=y
>  # CONFIG_HW_RANDOM is not set
> -CONFIG_EFI_RTC=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_EFI=y
>  CONFIG_RAW_DRIVER=m
>  CONFIG_HPET=y
>  CONFIG_AGP=m
> diff --git a/arch/ia64/configs/tiger_defconfig b/arch/ia64/configs/tiger_defconfig
> index 1d6e2a01452b..3f486d5bdc2d 100644
> --- a/arch/ia64/configs/tiger_defconfig
> +++ b/arch/ia64/configs/tiger_defconfig
> @@ -86,7 +86,8 @@ CONFIG_SERIAL_8250_NR_UARTS=6
>  CONFIG_SERIAL_8250_EXTENDED=y
>  CONFIG_SERIAL_8250_SHARE_IRQ=y
>  # CONFIG_HW_RANDOM is not set
> -CONFIG_EFI_RTC=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_EFI=y
>  CONFIG_RAW_DRIVER=m
>  CONFIG_HPET=y
>  CONFIG_AGP=m
> diff --git a/arch/ia64/configs/zx1_defconfig b/arch/ia64/configs/zx1_defconfig
> index 8c92e095f8bb..70788a500448 100644
> --- a/arch/ia64/configs/zx1_defconfig
> +++ b/arch/ia64/configs/zx1_defconfig
> @@ -69,7 +69,8 @@ CONFIG_SERIAL_8250_NR_UARTS=8
>  CONFIG_SERIAL_8250_EXTENDED=y
>  CONFIG_SERIAL_8250_SHARE_IRQ=y
>  # CONFIG_HW_RANDOM is not set
> -CONFIG_EFI_RTC=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_EFI=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_AGP=y
>  CONFIG_AGP_HP_ZX1=y
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index df0fc997dc3e..dabbf3f519c6 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -297,10 +297,6 @@ config JS_RTC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called js-rtc.
>  
> -config EFI_RTC
> -	bool "EFI Real Time Clock Services"
> -	depends on IA64
> -
>  endif # RTC_LIB
>  
>  config DTLK
> diff --git a/drivers/char/Makefile b/drivers/char/Makefile
> index 7c5ea6f9df14..abe3138b1f5a 100644
> --- a/drivers/char/Makefile
> +++ b/drivers/char/Makefile
> @@ -22,7 +22,6 @@ obj-$(CONFIG_APPLICOM)		+= applicom.o
>  obj-$(CONFIG_SONYPI)		+= sonypi.o
>  obj-$(CONFIG_RTC)		+= rtc.o
>  obj-$(CONFIG_HPET)		+= hpet.o
> -obj-$(CONFIG_EFI_RTC)		+= efirtc.o
>  obj-$(CONFIG_XILINX_HWICAP)	+= xilinx_hwicap/
>  obj-$(CONFIG_NVRAM)		+= nvram.o
>  obj-$(CONFIG_TOSHIBA)		+= toshiba.o
> diff --git a/drivers/char/efirtc.c b/drivers/char/efirtc.c
> deleted file mode 100644
> index 4f73064d0c6f..000000000000
> --- a/drivers/char/efirtc.c
> +++ /dev/null
> @@ -1,366 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * EFI Time Services Driver for Linux
> - *
> - * Copyright (C) 1999 Hewlett-Packard Co
> - * Copyright (C) 1999 Stephane Eranian <eranian@hpl.hp.com>
> - *
> - * Based on skeleton from the drivers/char/rtc.c driver by P. Gortmaker
> - *
> - * This code provides an architected & portable interface to the real time
> - * clock by using EFI instead of direct bit fiddling. The functionalities are 
> - * quite different from the rtc.c driver. The only way to talk to the device 
> - * is by using ioctl(). There is a /proc interface which provides the raw 
> - * information.
> - *
> - * Please note that we have kept the API as close as possible to the
> - * legacy RTC. The standard /sbin/hwclock program should work normally 
> - * when used to get/set the time.
> - *
> - * NOTES:
> - *	- Locking is required for safe execution of EFI calls with regards
> - *	  to interrupts and SMP.
> - *
> - * TODO (December 1999):
> - * 	- provide the API to set/get the WakeUp Alarm (different from the
> - *	  rtc.c alarm).
> - *	- SMP testing
> - * 	- Add module support
> - */
> -
> -#include <linux/types.h>
> -#include <linux/errno.h>
> -#include <linux/miscdevice.h>
> -#include <linux/init.h>
> -#include <linux/rtc.h>
> -#include <linux/proc_fs.h>
> -#include <linux/seq_file.h>
> -#include <linux/efi.h>
> -#include <linux/uaccess.h>
> -
> -
> -#define EFI_RTC_VERSION		"0.4"
> -
> -#define EFI_ISDST (EFI_TIME_ADJUST_DAYLIGHT|EFI_TIME_IN_DAYLIGHT)
> -/*
> - * EFI Epoch is 1/1/1998
> - */
> -#define EFI_RTC_EPOCH		1998
> -
> -static DEFINE_SPINLOCK(efi_rtc_lock);
> -
> -static long efi_rtc_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg);
> -
> -#define is_leap(year) \
> -          ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))
> -
> -static const unsigned short int __mon_yday[2][13] =
> -{
> -	/* Normal years.  */
> -	{ 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 },
> -	/* Leap years.  */  
> -	{ 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366 }
> -};
> -
> -/*
> - * returns day of the year [0-365]
> - */
> -static inline int
> -compute_yday(efi_time_t *eft)
> -{
> -	/* efi_time_t.month is in the [1-12] so, we need -1 */
> -	return  __mon_yday[is_leap(eft->year)][eft->month-1]+ eft->day -1;
> -}
> -/*
> - * returns day of the week [0-6] 0=Sunday
> - *
> - * Don't try to provide a year that's before 1998, please !
> - */
> -static int
> -compute_wday(efi_time_t *eft)
> -{
> -	int y;
> -	int ndays = 0;
> -
> -	if ( eft->year < 1998 ) {
> -		printk(KERN_ERR "efirtc: EFI year < 1998, invalid date\n");
> -		return -1;
> -	}
> -
> -	for(y=EFI_RTC_EPOCH; y < eft->year; y++ ) {
> -		ndays += 365 + (is_leap(y) ? 1 : 0);
> -	}
> -	ndays += compute_yday(eft);
> -
> -	/*
> -	 * 4=1/1/1998 was a Thursday
> -	 */
> -	return (ndays + 4) % 7;
> -}
> -
> -static void
> -convert_to_efi_time(struct rtc_time *wtime, efi_time_t *eft)
> -{
> -
> -	eft->year	= wtime->tm_year + 1900;
> -	eft->month	= wtime->tm_mon + 1; 
> -	eft->day	= wtime->tm_mday;
> -	eft->hour	= wtime->tm_hour;
> -	eft->minute	= wtime->tm_min;
> -	eft->second 	= wtime->tm_sec;
> -	eft->nanosecond = 0; 
> -	eft->daylight	= wtime->tm_isdst ? EFI_ISDST: 0;
> -	eft->timezone	= EFI_UNSPECIFIED_TIMEZONE;
> -}
> -
> -static void
> -convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
> -{
> -	memset(wtime, 0, sizeof(*wtime));
> -	wtime->tm_sec  = eft->second;
> -	wtime->tm_min  = eft->minute;
> -	wtime->tm_hour = eft->hour;
> -	wtime->tm_mday = eft->day;
> -	wtime->tm_mon  = eft->month - 1;
> -	wtime->tm_year = eft->year - 1900;
> -
> -	/* day of the week [0-6], Sunday=0 */
> -	wtime->tm_wday = compute_wday(eft);
> -
> -	/* day in the year [1-365]*/
> -	wtime->tm_yday = compute_yday(eft);
> -
> -
> -	switch (eft->daylight & EFI_ISDST) {
> -		case EFI_ISDST:
> -			wtime->tm_isdst = 1;
> -			break;
> -		case EFI_TIME_ADJUST_DAYLIGHT:
> -			wtime->tm_isdst = 0;
> -			break;
> -		default:
> -			wtime->tm_isdst = -1;
> -	}
> -}
> -
> -static long efi_rtc_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg)
> -{
> -
> -	efi_status_t	status;
> -	unsigned long	flags;
> -	efi_time_t	eft;
> -	efi_time_cap_t	cap;
> -	struct rtc_time	wtime;
> -	struct rtc_wkalrm __user *ewp;
> -	unsigned char	enabled, pending;
> -
> -	switch (cmd) {
> -		case RTC_UIE_ON:
> -		case RTC_UIE_OFF:
> -		case RTC_PIE_ON:
> -		case RTC_PIE_OFF:
> -		case RTC_AIE_ON:
> -		case RTC_AIE_OFF:
> -		case RTC_ALM_SET:
> -		case RTC_ALM_READ:
> -		case RTC_IRQP_READ:
> -		case RTC_IRQP_SET:
> -		case RTC_EPOCH_READ:
> -		case RTC_EPOCH_SET:
> -			return -EINVAL;
> -
> -		case RTC_RD_TIME:
> -			spin_lock_irqsave(&efi_rtc_lock, flags);
> -
> -			status = efi.get_time(&eft, &cap);
> -
> -			spin_unlock_irqrestore(&efi_rtc_lock,flags);
> -
> -			if (status != EFI_SUCCESS) {
> -				/* should never happen */
> -				printk(KERN_ERR "efitime: can't read time\n");
> -				return -EINVAL;
> -			}
> -
> -			convert_from_efi_time(&eft, &wtime);
> -
> - 			return copy_to_user((void __user *)arg, &wtime,
> -					    sizeof (struct rtc_time)) ? - EFAULT : 0;
> -
> -		case RTC_SET_TIME:
> -
> -			if (!capable(CAP_SYS_TIME)) return -EACCES;
> -
> -			if (copy_from_user(&wtime, (struct rtc_time __user *)arg,
> -					   sizeof(struct rtc_time)) )
> -				return -EFAULT;
> -
> -			convert_to_efi_time(&wtime, &eft);
> -
> -			spin_lock_irqsave(&efi_rtc_lock, flags);
> -
> -			status = efi.set_time(&eft);
> -
> -			spin_unlock_irqrestore(&efi_rtc_lock,flags);
> -
> -			return status == EFI_SUCCESS ? 0 : -EINVAL;
> -
> -		case RTC_WKALM_SET:
> -
> -			if (!capable(CAP_SYS_TIME)) return -EACCES;
> -
> -			ewp = (struct rtc_wkalrm __user *)arg;
> -
> -			if (  get_user(enabled, &ewp->enabled)
> -			   || copy_from_user(&wtime, &ewp->time, sizeof(struct rtc_time)) )
> -				return -EFAULT;
> -
> -			convert_to_efi_time(&wtime, &eft);
> -
> -			spin_lock_irqsave(&efi_rtc_lock, flags);
> -			/*
> -			 * XXX Fixme:
> -			 * As of EFI 0.92 with the firmware I have on my
> -			 * machine this call does not seem to work quite
> -			 * right
> -			 */
> -			status = efi.set_wakeup_time((efi_bool_t)enabled, &eft);
> -
> -			spin_unlock_irqrestore(&efi_rtc_lock,flags);
> -
> -			return status == EFI_SUCCESS ? 0 : -EINVAL;
> -
> -		case RTC_WKALM_RD:
> -
> -			spin_lock_irqsave(&efi_rtc_lock, flags);
> -
> -			status = efi.get_wakeup_time((efi_bool_t *)&enabled, (efi_bool_t *)&pending, &eft);
> -
> -			spin_unlock_irqrestore(&efi_rtc_lock,flags);
> -
> -			if (status != EFI_SUCCESS) return -EINVAL;
> -
> -			ewp = (struct rtc_wkalrm __user *)arg;
> -
> -			if (  put_user(enabled, &ewp->enabled)
> -			   || put_user(pending, &ewp->pending)) return -EFAULT;
> -
> -			convert_from_efi_time(&eft, &wtime);
> -
> -			return copy_to_user(&ewp->time, &wtime,
> -					    sizeof(struct rtc_time)) ? -EFAULT : 0;
> -	}
> -	return -ENOTTY;
> -}
> -
> -/*
> - *	The various file operations we support.
> - */
> -
> -static const struct file_operations efi_rtc_fops = {
> -	.owner		= THIS_MODULE,
> -	.unlocked_ioctl	= efi_rtc_ioctl,
> -	.llseek		= no_llseek,
> -};
> -
> -static struct miscdevice efi_rtc_dev= {
> -	EFI_RTC_MINOR,
> -	"efirtc",
> -	&efi_rtc_fops
> -};
> -
> -/*
> - *	We export RAW EFI information to /proc/driver/efirtc
> - */
> -static int efi_rtc_proc_show(struct seq_file *m, void *v)
> -{
> -	efi_time_t 	eft, alm;
> -	efi_time_cap_t	cap;
> -	efi_bool_t	enabled, pending;	
> -	unsigned long	flags;
> -
> -	memset(&eft, 0, sizeof(eft));
> -	memset(&alm, 0, sizeof(alm));
> -	memset(&cap, 0, sizeof(cap));
> -
> -	spin_lock_irqsave(&efi_rtc_lock, flags);
> -
> -	efi.get_time(&eft, &cap);
> -	efi.get_wakeup_time(&enabled, &pending, &alm);
> -
> -	spin_unlock_irqrestore(&efi_rtc_lock,flags);
> -
> -	seq_printf(m,
> -		   "Time           : %u:%u:%u.%09u\n"
> -		   "Date           : %u-%u-%u\n"
> -		   "Daylight       : %u\n",
> -		   eft.hour, eft.minute, eft.second, eft.nanosecond, 
> -		   eft.year, eft.month, eft.day,
> -		   eft.daylight);
> -
> -	if (eft.timezone == EFI_UNSPECIFIED_TIMEZONE)
> -		seq_puts(m, "Timezone       : unspecified\n");
> -	else
> -		/* XXX fixme: convert to string? */
> -		seq_printf(m, "Timezone       : %u\n", eft.timezone);
> -		
> -
> -	seq_printf(m,
> -		   "Alarm Time     : %u:%u:%u.%09u\n"
> -		   "Alarm Date     : %u-%u-%u\n"
> -		   "Alarm Daylight : %u\n"
> -		   "Enabled        : %s\n"
> -		   "Pending        : %s\n",
> -		   alm.hour, alm.minute, alm.second, alm.nanosecond, 
> -		   alm.year, alm.month, alm.day, 
> -		   alm.daylight,
> -		   enabled == 1 ? "yes" : "no",
> -		   pending == 1 ? "yes" : "no");
> -
> -	if (eft.timezone == EFI_UNSPECIFIED_TIMEZONE)
> -		seq_puts(m, "Timezone       : unspecified\n");
> -	else
> -		/* XXX fixme: convert to string? */
> -		seq_printf(m, "Timezone       : %u\n", alm.timezone);
> -
> -	/*
> -	 * now prints the capabilities
> -	 */
> -	seq_printf(m,
> -		   "Resolution     : %u\n"
> -		   "Accuracy       : %u\n"
> -		   "SetstoZero     : %u\n",
> -		   cap.resolution, cap.accuracy, cap.sets_to_zero);
> -
> -	return 0;
> -}
> -static int __init 
> -efi_rtc_init(void)
> -{
> -	int ret;
> -	struct proc_dir_entry *dir;
> -
> -	printk(KERN_INFO "EFI Time Services Driver v%s\n", EFI_RTC_VERSION);
> -
> -	ret = misc_register(&efi_rtc_dev);
> -	if (ret) {
> -		printk(KERN_ERR "efirtc: can't misc_register on minor=%d\n",
> -				EFI_RTC_MINOR);
> -		return ret;
> -	}
> -
> -	dir = proc_create_single("driver/efirtc", 0, NULL, efi_rtc_proc_show);
> -	if (dir == NULL) {
> -		printk(KERN_ERR "efirtc: can't create /proc/driver/efirtc.\n");
> -		misc_deregister(&efi_rtc_dev);
> -		return -1;
> -	}
> -	return 0;
> -}
> -device_initcall(efi_rtc_init);
> -
> -/*
> -MODULE_LICENSE("GPL");
> -*/
> diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
> index 3247a3dc7934..4ab05916046c 100644
> --- a/include/linux/miscdevice.h
> +++ b/include/linux/miscdevice.h
> @@ -25,7 +25,7 @@
>  #define TEMP_MINOR		131	/* Temperature Sensor */
>  #define APM_MINOR_DEV		134
>  #define RTC_MINOR		135
> -#define EFI_RTC_MINOR		136	/* EFI Time services */
> +/*#define EFI_RTC_MINOR		136	was EFI Time services */
>  #define VHCI_MINOR		137
>  #define SUN_OPENPROM_MINOR	139
>  #define DMAPI_MINOR		140	/* unused */
> -- 
> 2.20.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
