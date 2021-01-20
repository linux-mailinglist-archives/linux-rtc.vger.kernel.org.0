Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC2B2FDCEC
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Jan 2021 00:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbhATV1j convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 20 Jan 2021 16:27:39 -0500
Received: from mail-ej1-f53.google.com ([209.85.218.53]:44882 "EHLO
        mail-ej1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbhATVUz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 20 Jan 2021 16:20:55 -0500
Received: by mail-ej1-f53.google.com with SMTP id w1so35493658ejf.11;
        Wed, 20 Jan 2021 13:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dnu2p3mZHWXCGNRh76zM3Siqs3hhwg+Fa2Cwzks/Mao=;
        b=iw119R1mzNXkekKYQDUfFJxsIRN2AI2NPqsJrzWCa42OORw3tzsnBH44LIo8Ws5QIo
         Erz1dJK1kwumimX6gaT7FQqYqjfOe/mwZQ32xUH9/JgZdUQm4lkgj+kchelMv+GVp7ES
         /dfNQ1cGkRWBr3+CR8j23m8wryPzXPELu9VvW2Y5O5IWp9aBABpL2P4pGQ8CzQt6axw3
         xcGP766sLo/GeBzpZvps97ewEKM1tBXhQ8oxQh0mkejd5QzIa+MDwwqIubw0Lc/+oOYq
         Bh9XjpSDkXGhzwNoB6d2AjZrLoZ6sds+UtN4bBSpMmJjLhy/CwkRrm8jhYdXXOJndi1z
         AlKA==
X-Gm-Message-State: AOAM530Q1no/bIVjvSXnzOL/EeRFiKQI67tGJGyWHTa7pHDXQ3ZItbJv
        GRJTVfPotiOGZciwNgtGeeVw4XOORsAKeKxH6hE=
X-Google-Smtp-Source: ABdhPJza8NREUSeYaA94uOm2lYyX/Lpvtda3fbB00xiBVOT387SH9TqZcp1n0zXKaneRTNkXkBRQ2ovInIIpEqGsdU8=
X-Received: by 2002:a17:906:b2d5:: with SMTP id cf21mr7356493ejb.387.1611177611367;
 Wed, 20 Jan 2021 13:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20210120154158.1860736-1-arnd@kernel.org> <20210120154158.1860736-2-arnd@kernel.org>
In-Reply-To: <20210120154158.1860736-2-arnd@kernel.org>
From:   Barry Song <baohua@kernel.org>
Date:   Thu, 21 Jan 2021 10:20:00 +1300
Message-ID: <CAGsJ_4yva8XOJ4MFdhRz=qYsAotrJkopJUU1EQL03b3-R0KPUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rtc: remove sirfsoc driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> 于2021年1月21日周四 上午4:42写道：
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
>
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Barry Song <baohua@kernel.org>

> ---
>  .../bindings/rtc/sirf,prima2-sysrtc.txt       |  13 -
>  drivers/rtc/Kconfig                           |   7 -
>  drivers/rtc/Makefile                          |   1 -
>  drivers/rtc/rtc-sirfsoc.c                     | 446 ------------------
>  include/linux/rtc/sirfsoc_rtciobrg.h          |  21 -
>  5 files changed, 488 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
>  delete mode 100644 drivers/rtc/rtc-sirfsoc.c
>  delete mode 100644 include/linux/rtc/sirfsoc_rtciobrg.h
>
> diff --git a/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
> deleted file mode 100644
> index 58885b55da21..000000000000
> --- a/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SiRFSoC Real Time Clock
> -
> -Required properties:
> -- compatible: must be "sirf,prima2-sysrtc"
> -- reg: address range of rtc register set.
> -- interrupts: rtc alarm interrupts.
> -
> -Example:
> -       rtc@2000 {
> -               compatible = "sirf,prima2-sysrtc";
> -               reg = <0x2000 0x1000>;
> -               interrupts = <52 53 54>;
> -       };
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 6123f9f4fbc9..8fb9aa55ace1 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1799,13 +1799,6 @@ config RTC_DRV_IMX_SC
>            If you say yes here you get support for the NXP i.MX System
>            Controller RTC module.
>
> -config RTC_DRV_SIRFSOC
> -       tristate "SiRFSOC RTC"
> -       depends on ARCH_SIRF
> -       help
> -         Say "yes" here to support the real time clock on SiRF SOC chips.
> -         This driver can also be built as a module called rtc-sirfsoc.
> -
>  config RTC_DRV_ST_LPC
>         tristate "STMicroelectronics LPC RTC"
>         depends on ARCH_STI
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index bb8f319b09fb..1f00896db507 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -154,7 +154,6 @@ obj-$(CONFIG_RTC_DRV_SA1100)        += rtc-sa1100.o
>  obj-$(CONFIG_RTC_DRV_SC27XX)   += rtc-sc27xx.o
>  obj-$(CONFIG_RTC_DRV_SD3078)   += rtc-sd3078.o
>  obj-$(CONFIG_RTC_DRV_SH)       += rtc-sh.o
> -obj-$(CONFIG_RTC_DRV_SIRFSOC)  += rtc-sirfsoc.o
>  obj-$(CONFIG_RTC_DRV_SNVS)     += rtc-snvs.o
>  obj-$(CONFIG_RTC_DRV_SPEAR)    += rtc-spear.o
>  obj-$(CONFIG_RTC_DRV_STARFIRE) += rtc-starfire.o
> diff --git a/drivers/rtc/rtc-sirfsoc.c b/drivers/rtc/rtc-sirfsoc.c
> deleted file mode 100644
> index 03a6cca23201..000000000000
> --- a/drivers/rtc/rtc-sirfsoc.c
> +++ /dev/null
> @@ -1,446 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * SiRFSoC Real Time Clock interface for Linux
> - *
> - * Copyright (c) 2013 Cambridge Silicon Radio Limited, a CSR plc group company.
> - */
> -
> -#include <linux/module.h>
> -#include <linux/err.h>
> -#include <linux/rtc.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
> -#include <linux/of.h>
> -#include <linux/regmap.h>
> -#include <linux/rtc/sirfsoc_rtciobrg.h>
> -
> -
> -#define RTC_CN                 0x00
> -#define RTC_ALARM0             0x04
> -#define RTC_ALARM1             0x18
> -#define RTC_STATUS             0x08
> -#define RTC_SW_VALUE            0x40
> -#define SIRFSOC_RTC_AL1E       (1<<6)
> -#define SIRFSOC_RTC_AL1                (1<<4)
> -#define SIRFSOC_RTC_HZE                (1<<3)
> -#define SIRFSOC_RTC_AL0E       (1<<2)
> -#define SIRFSOC_RTC_HZ         (1<<1)
> -#define SIRFSOC_RTC_AL0                (1<<0)
> -#define RTC_DIV                        0x0c
> -#define RTC_DEEP_CTRL          0x14
> -#define RTC_CLOCK_SWITCH       0x1c
> -#define SIRFSOC_RTC_CLK                0x03    /* others are reserved */
> -
> -/* Refer to RTC DIV switch */
> -#define RTC_HZ                 16
> -
> -/* This macro is also defined in arch/arm/plat-sirfsoc/cpu.c */
> -#define RTC_SHIFT              4
> -
> -#define INTR_SYSRTC_CN         0x48
> -
> -struct sirfsoc_rtc_drv {
> -       struct rtc_device       *rtc;
> -       u32                     rtc_base;
> -       u32                     irq;
> -       unsigned                irq_wake;
> -       /* Overflow for every 8 years extra time */
> -       u32                     overflow_rtc;
> -       spinlock_t              lock;
> -       struct regmap *regmap;
> -#ifdef CONFIG_PM
> -       u32             saved_counter;
> -       u32             saved_overflow_rtc;
> -#endif
> -};
> -
> -static u32 sirfsoc_rtc_readl(struct sirfsoc_rtc_drv *rtcdrv, u32 offset)
> -{
> -       u32 val;
> -
> -       regmap_read(rtcdrv->regmap, rtcdrv->rtc_base + offset, &val);
> -       return val;
> -}
> -
> -static void sirfsoc_rtc_writel(struct sirfsoc_rtc_drv *rtcdrv,
> -                              u32 offset, u32 val)
> -{
> -       regmap_write(rtcdrv->regmap, rtcdrv->rtc_base + offset, val);
> -}
> -
> -static int sirfsoc_rtc_read_alarm(struct device *dev,
> -               struct rtc_wkalrm *alrm)
> -{
> -       unsigned long rtc_alarm, rtc_count;
> -       struct sirfsoc_rtc_drv *rtcdrv;
> -
> -       rtcdrv = dev_get_drvdata(dev);
> -
> -       spin_lock_irq(&rtcdrv->lock);
> -
> -       rtc_count = sirfsoc_rtc_readl(rtcdrv, RTC_CN);
> -
> -       rtc_alarm = sirfsoc_rtc_readl(rtcdrv, RTC_ALARM0);
> -       memset(alrm, 0, sizeof(struct rtc_wkalrm));
> -
> -       /*
> -        * assume alarm interval not beyond one round counter overflow_rtc:
> -        * 0->0xffffffff
> -        */
> -       /* if alarm is in next overflow cycle */
> -       if (rtc_count > rtc_alarm)
> -               rtc_time64_to_tm((rtcdrv->overflow_rtc + 1)
> -                                << (BITS_PER_LONG - RTC_SHIFT)
> -                                | rtc_alarm >> RTC_SHIFT, &alrm->time);
> -       else
> -               rtc_time64_to_tm(rtcdrv->overflow_rtc
> -                                << (BITS_PER_LONG - RTC_SHIFT)
> -                                | rtc_alarm >> RTC_SHIFT, &alrm->time);
> -       if (sirfsoc_rtc_readl(rtcdrv, RTC_STATUS) & SIRFSOC_RTC_AL0E)
> -               alrm->enabled = 1;
> -
> -       spin_unlock_irq(&rtcdrv->lock);
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_rtc_set_alarm(struct device *dev,
> -               struct rtc_wkalrm *alrm)
> -{
> -       unsigned long rtc_status_reg, rtc_alarm;
> -       struct sirfsoc_rtc_drv *rtcdrv;
> -       rtcdrv = dev_get_drvdata(dev);
> -
> -       if (alrm->enabled) {
> -               rtc_alarm = rtc_tm_to_time64(&alrm->time);
> -
> -               spin_lock_irq(&rtcdrv->lock);
> -
> -               rtc_status_reg = sirfsoc_rtc_readl(rtcdrv, RTC_STATUS);
> -               if (rtc_status_reg & SIRFSOC_RTC_AL0E) {
> -                       /*
> -                        * An ongoing alarm in progress - ingore it and not
> -                        * to return EBUSY
> -                        */
> -                       dev_info(dev, "An old alarm was set, will be replaced by a new one\n");
> -               }
> -
> -               sirfsoc_rtc_writel(rtcdrv, RTC_ALARM0, rtc_alarm << RTC_SHIFT);
> -               rtc_status_reg &= ~0x07; /* mask out the lower status bits */
> -               /*
> -                * This bit RTC_AL sets it as a wake-up source for Sleep Mode
> -                * Writing 1 into this bit will clear it
> -                */
> -               rtc_status_reg |= SIRFSOC_RTC_AL0;
> -               /* enable the RTC alarm interrupt */
> -               rtc_status_reg |= SIRFSOC_RTC_AL0E;
> -               sirfsoc_rtc_writel(rtcdrv, RTC_STATUS, rtc_status_reg);
> -
> -               spin_unlock_irq(&rtcdrv->lock);
> -       } else {
> -               /*
> -                * if this function was called with enabled=0
> -                * then it could mean that the application is
> -                * trying to cancel an ongoing alarm
> -                */
> -               spin_lock_irq(&rtcdrv->lock);
> -
> -               rtc_status_reg = sirfsoc_rtc_readl(rtcdrv, RTC_STATUS);
> -               if (rtc_status_reg & SIRFSOC_RTC_AL0E) {
> -                       /* clear the RTC status register's alarm bit */
> -                       rtc_status_reg &= ~0x07;
> -                       /* write 1 into SIRFSOC_RTC_AL0 to force a clear */
> -                       rtc_status_reg |= (SIRFSOC_RTC_AL0);
> -                       /* Clear the Alarm enable bit */
> -                       rtc_status_reg &= ~(SIRFSOC_RTC_AL0E);
> -
> -                       sirfsoc_rtc_writel(rtcdrv, RTC_STATUS,
> -                                          rtc_status_reg);
> -               }
> -
> -               spin_unlock_irq(&rtcdrv->lock);
> -       }
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_rtc_read_time(struct device *dev,
> -               struct rtc_time *tm)
> -{
> -       unsigned long tmp_rtc = 0;
> -       struct sirfsoc_rtc_drv *rtcdrv;
> -       rtcdrv = dev_get_drvdata(dev);
> -       /*
> -        * This patch is taken from WinCE - Need to validate this for
> -        * correctness. To work around sirfsoc RTC counter double sync logic
> -        * fail, read several times to make sure get stable value.
> -        */
> -       do {
> -               tmp_rtc = sirfsoc_rtc_readl(rtcdrv, RTC_CN);
> -               cpu_relax();
> -       } while (tmp_rtc != sirfsoc_rtc_readl(rtcdrv, RTC_CN));
> -
> -       rtc_time64_to_tm(rtcdrv->overflow_rtc << (BITS_PER_LONG - RTC_SHIFT)
> -                        | tmp_rtc >> RTC_SHIFT, tm);
> -       return 0;
> -}
> -
> -static int sirfsoc_rtc_set_time(struct device *dev,
> -               struct rtc_time *tm)
> -{
> -       unsigned long rtc_time;
> -       struct sirfsoc_rtc_drv *rtcdrv;
> -       rtcdrv = dev_get_drvdata(dev);
> -
> -       rtc_time = rtc_tm_to_time64(tm);
> -
> -       rtcdrv->overflow_rtc = rtc_time >> (BITS_PER_LONG - RTC_SHIFT);
> -
> -       sirfsoc_rtc_writel(rtcdrv, RTC_SW_VALUE, rtcdrv->overflow_rtc);
> -       sirfsoc_rtc_writel(rtcdrv, RTC_CN, rtc_time << RTC_SHIFT);
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_rtc_alarm_irq_enable(struct device *dev,
> -               unsigned int enabled)
> -{
> -       unsigned long rtc_status_reg = 0x0;
> -       struct sirfsoc_rtc_drv *rtcdrv;
> -
> -       rtcdrv = dev_get_drvdata(dev);
> -
> -       spin_lock_irq(&rtcdrv->lock);
> -
> -       rtc_status_reg = sirfsoc_rtc_readl(rtcdrv, RTC_STATUS);
> -       if (enabled)
> -               rtc_status_reg |= SIRFSOC_RTC_AL0E;
> -       else
> -               rtc_status_reg &= ~SIRFSOC_RTC_AL0E;
> -
> -       sirfsoc_rtc_writel(rtcdrv, RTC_STATUS, rtc_status_reg);
> -
> -       spin_unlock_irq(&rtcdrv->lock);
> -
> -       return 0;
> -
> -}
> -
> -static const struct rtc_class_ops sirfsoc_rtc_ops = {
> -       .read_time = sirfsoc_rtc_read_time,
> -       .set_time = sirfsoc_rtc_set_time,
> -       .read_alarm = sirfsoc_rtc_read_alarm,
> -       .set_alarm = sirfsoc_rtc_set_alarm,
> -       .alarm_irq_enable = sirfsoc_rtc_alarm_irq_enable
> -};
> -
> -static irqreturn_t sirfsoc_rtc_irq_handler(int irq, void *pdata)
> -{
> -       struct sirfsoc_rtc_drv *rtcdrv = pdata;
> -       unsigned long rtc_status_reg = 0x0;
> -       unsigned long events = 0x0;
> -
> -       spin_lock(&rtcdrv->lock);
> -
> -       rtc_status_reg = sirfsoc_rtc_readl(rtcdrv, RTC_STATUS);
> -       /* this bit will be set ONLY if an alarm was active
> -        * and it expired NOW
> -        * So this is being used as an ASSERT
> -        */
> -       if (rtc_status_reg & SIRFSOC_RTC_AL0) {
> -               /*
> -                * clear the RTC status register's alarm bit
> -                * mask out the lower status bits
> -                */
> -               rtc_status_reg &= ~0x07;
> -               /* write 1 into SIRFSOC_RTC_AL0 to ACK the alarm interrupt */
> -               rtc_status_reg |= (SIRFSOC_RTC_AL0);
> -               /* Clear the Alarm enable bit */
> -               rtc_status_reg &= ~(SIRFSOC_RTC_AL0E);
> -       }
> -
> -       sirfsoc_rtc_writel(rtcdrv, RTC_STATUS, rtc_status_reg);
> -
> -       spin_unlock(&rtcdrv->lock);
> -
> -       /* this should wake up any apps polling/waiting on the read
> -        * after setting the alarm
> -        */
> -       events |= RTC_IRQF | RTC_AF;
> -       rtc_update_irq(rtcdrv->rtc, 1, events);
> -
> -       return IRQ_HANDLED;
> -}
> -
> -static const struct of_device_id sirfsoc_rtc_of_match[] = {
> -       { .compatible = "sirf,prima2-sysrtc"},
> -       {},
> -};
> -
> -static const struct regmap_config sysrtc_regmap_config = {
> -       .reg_bits = 32,
> -       .val_bits = 32,
> -       .fast_io = true,
> -};
> -
> -MODULE_DEVICE_TABLE(of, sirfsoc_rtc_of_match);
> -
> -static int sirfsoc_rtc_probe(struct platform_device *pdev)
> -{
> -       int err;
> -       unsigned long rtc_div;
> -       struct sirfsoc_rtc_drv *rtcdrv;
> -       struct device_node *np = pdev->dev.of_node;
> -
> -       rtcdrv = devm_kzalloc(&pdev->dev,
> -               sizeof(struct sirfsoc_rtc_drv), GFP_KERNEL);
> -       if (rtcdrv == NULL)
> -               return -ENOMEM;
> -
> -       spin_lock_init(&rtcdrv->lock);
> -
> -       err = of_property_read_u32(np, "reg", &rtcdrv->rtc_base);
> -       if (err) {
> -               dev_err(&pdev->dev, "unable to find base address of rtc node in dtb\n");
> -               return err;
> -       }
> -
> -       platform_set_drvdata(pdev, rtcdrv);
> -
> -       /* Register rtc alarm as a wakeup source */
> -       device_init_wakeup(&pdev->dev, 1);
> -
> -       rtcdrv->regmap = devm_regmap_init_iobg(&pdev->dev,
> -                       &sysrtc_regmap_config);
> -       if (IS_ERR(rtcdrv->regmap)) {
> -               err = PTR_ERR(rtcdrv->regmap);
> -               dev_err(&pdev->dev, "Failed to allocate register map: %d\n",
> -                       err);
> -               return err;
> -       }
> -
> -       /*
> -        * Set SYS_RTC counter in RTC_HZ HZ Units
> -        * We are using 32K RTC crystal (32768 / RTC_HZ / 2) -1
> -        * If 16HZ, therefore RTC_DIV = 1023;
> -        */
> -       rtc_div = ((32768 / RTC_HZ) / 2) - 1;
> -       sirfsoc_rtc_writel(rtcdrv, RTC_DIV, rtc_div);
> -
> -       /* 0x3 -> RTC_CLK */
> -       sirfsoc_rtc_writel(rtcdrv, RTC_CLOCK_SWITCH, SIRFSOC_RTC_CLK);
> -
> -       /* reset SYS RTC ALARM0 */
> -       sirfsoc_rtc_writel(rtcdrv, RTC_ALARM0, 0x0);
> -
> -       /* reset SYS RTC ALARM1 */
> -       sirfsoc_rtc_writel(rtcdrv, RTC_ALARM1, 0x0);
> -
> -       /* Restore RTC Overflow From Register After Command Reboot */
> -       rtcdrv->overflow_rtc =
> -               sirfsoc_rtc_readl(rtcdrv, RTC_SW_VALUE);
> -
> -       rtcdrv->rtc = devm_rtc_allocate_device(&pdev->dev);
> -       if (IS_ERR(rtcdrv->rtc))
> -               return PTR_ERR(rtcdrv->rtc);
> -
> -       rtcdrv->rtc->ops = &sirfsoc_rtc_ops;
> -       rtcdrv->rtc->range_max = (1ULL << 60) - 1;
> -
> -       rtcdrv->irq = platform_get_irq(pdev, 0);
> -       err = devm_request_irq(&pdev->dev, rtcdrv->irq, sirfsoc_rtc_irq_handler,
> -                              IRQF_SHARED, pdev->name, rtcdrv);
> -       if (err) {
> -               dev_err(&pdev->dev, "Unable to register for the SiRF SOC RTC IRQ\n");
> -               return err;
> -       }
> -
> -       return devm_rtc_register_device(rtcdrv->rtc);
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int sirfsoc_rtc_suspend(struct device *dev)
> -{
> -       struct sirfsoc_rtc_drv *rtcdrv = dev_get_drvdata(dev);
> -       rtcdrv->overflow_rtc =
> -               sirfsoc_rtc_readl(rtcdrv, RTC_SW_VALUE);
> -
> -       rtcdrv->saved_counter =
> -               sirfsoc_rtc_readl(rtcdrv, RTC_CN);
> -       rtcdrv->saved_overflow_rtc = rtcdrv->overflow_rtc;
> -       if (device_may_wakeup(dev) && !enable_irq_wake(rtcdrv->irq))
> -               rtcdrv->irq_wake = 1;
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_rtc_resume(struct device *dev)
> -{
> -       u32 tmp;
> -       struct sirfsoc_rtc_drv *rtcdrv = dev_get_drvdata(dev);
> -
> -       /*
> -        * if resume from snapshot and the rtc power is lost,
> -        * restroe the rtc settings
> -        */
> -       if (SIRFSOC_RTC_CLK != sirfsoc_rtc_readl(rtcdrv, RTC_CLOCK_SWITCH)) {
> -               u32 rtc_div;
> -               /* 0x3 -> RTC_CLK */
> -               sirfsoc_rtc_writel(rtcdrv, RTC_CLOCK_SWITCH, SIRFSOC_RTC_CLK);
> -               /*
> -                * Set SYS_RTC counter in RTC_HZ HZ Units
> -                * We are using 32K RTC crystal (32768 / RTC_HZ / 2) -1
> -                * If 16HZ, therefore RTC_DIV = 1023;
> -                */
> -               rtc_div = ((32768 / RTC_HZ) / 2) - 1;
> -
> -               sirfsoc_rtc_writel(rtcdrv, RTC_DIV, rtc_div);
> -
> -               /* reset SYS RTC ALARM0 */
> -               sirfsoc_rtc_writel(rtcdrv, RTC_ALARM0, 0x0);
> -
> -               /* reset SYS RTC ALARM1 */
> -               sirfsoc_rtc_writel(rtcdrv, RTC_ALARM1, 0x0);
> -       }
> -       rtcdrv->overflow_rtc = rtcdrv->saved_overflow_rtc;
> -
> -       /*
> -        * if current counter is small than previous,
> -        * it means overflow in sleep
> -        */
> -       tmp = sirfsoc_rtc_readl(rtcdrv, RTC_CN);
> -       if (tmp <= rtcdrv->saved_counter)
> -               rtcdrv->overflow_rtc++;
> -       /*
> -        *PWRC Value Be Changed When Suspend, Restore Overflow
> -        * In Memory To Register
> -        */
> -       sirfsoc_rtc_writel(rtcdrv, RTC_SW_VALUE, rtcdrv->overflow_rtc);
> -
> -       if (device_may_wakeup(dev) && rtcdrv->irq_wake) {
> -               disable_irq_wake(rtcdrv->irq);
> -               rtcdrv->irq_wake = 0;
> -       }
> -
> -       return 0;
> -}
> -#endif
> -
> -static SIMPLE_DEV_PM_OPS(sirfsoc_rtc_pm_ops,
> -               sirfsoc_rtc_suspend, sirfsoc_rtc_resume);
> -
> -static struct platform_driver sirfsoc_rtc_driver = {
> -       .driver = {
> -               .name = "sirfsoc-rtc",
> -               .pm = &sirfsoc_rtc_pm_ops,
> -               .of_match_table = sirfsoc_rtc_of_match,
> -       },
> -       .probe = sirfsoc_rtc_probe,
> -};
> -module_platform_driver(sirfsoc_rtc_driver);
> -
> -MODULE_DESCRIPTION("SiRF SoC rtc driver");
> -MODULE_AUTHOR("Xianglong Du <Xianglong.Du@csr.com>");
> -MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:sirfsoc-rtc");
> diff --git a/include/linux/rtc/sirfsoc_rtciobrg.h b/include/linux/rtc/sirfsoc_rtciobrg.h
> deleted file mode 100644
> index b31f2856733d..000000000000
> --- a/include/linux/rtc/sirfsoc_rtciobrg.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * RTC I/O Bridge interfaces for CSR SiRFprimaII
> - * ARM access the registers of SYSRTC, GPSRTC and PWRC through this module
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group company.
> - */
> -#ifndef _SIRFSOC_RTC_IOBRG_H_
> -#define _SIRFSOC_RTC_IOBRG_H_
> -
> -struct regmap_config;
> -
> -extern void sirfsoc_rtc_iobrg_besyncing(void);
> -
> -extern u32 sirfsoc_rtc_iobrg_readl(u32 addr);
> -
> -extern void sirfsoc_rtc_iobrg_writel(u32 val, u32 addr);
> -struct regmap *devm_regmap_init_iobg(struct device *dev,
> -                                   const struct regmap_config *config);
> -
> -#endif
> --
> 2.29.2
>
