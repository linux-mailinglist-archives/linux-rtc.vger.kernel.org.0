Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFD236D6F3
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 14:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhD1MFH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 08:05:07 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:33731 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhD1MFG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 08:05:06 -0400
Received: by mail-vs1-f54.google.com with SMTP id k19so18611374vsg.0;
        Wed, 28 Apr 2021 05:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYpXbCN/n2rLYtoJCeNPXNvnWc+idIwFwnXqbrKrrQU=;
        b=qWqFUZNb5GVv/6JCgVi5kIgOfJamZqUTFMT+zR8y7+6Evy6AAiFW/8S+WYdfFYBmEX
         jutSdecWF/m2qNYqmnsiULPhvlABCYxEiW5wsAYhAL+X1ajYetgWL0v43RAyfpAi/0Uh
         9kaFWouOphVda7AhUHtxTS5dgZjBgR/jr5DPO1sWbxnAIR2WfVfSHPfdQcozd828UjH0
         wOEgAlHLWHC4VnZ9wwd6NGujqnFHshxO6jHX9sw0ckg7uwxdbxuYK7UTo4yXhxrVxjwM
         A0N7JfrJRScSdrxmvU2Xm9RAwC2Od4SQ58HCoFNfHeoXO9t6FHVitll/ma5ziGMggRi8
         97vw==
X-Gm-Message-State: AOAM5311Eg9dH3XWNJN1ZgnvxazR51+Ipr+eT5HUXO0OLPw0I2Zr+xjT
        E3+V1UUHc6NCCTEgpLKMqKEdbTOvOCxgsd1Xdw0=
X-Google-Smtp-Source: ABdhPJzsRK5pozkOUPqOF/u4JFLUiegN1NgREh+FRTcDlh4XLD2PV8SU/Na72m7GTAyw30oQAD0Aq0GzamJJYHWV6OQ=
X-Received: by 2002:a67:cd84:: with SMTP id r4mr13360663vsl.40.1619611459978;
 Wed, 28 Apr 2021 05:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221430.3735147-1-laurent@vivier.eu> <20210323221430.3735147-3-laurent@vivier.eu>
In-Reply-To: <20210323221430.3735147-3-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Apr 2021 14:04:08 +0200
Message-ID: <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Laurent,

On Tue, Mar 23, 2021 at 11:14 PM Laurent Vivier <laurent@vivier.eu> wrote:
> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
>
> It is based on android goldfish devices.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Thanks for your patch!

> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -145,6 +145,23 @@ config SUN3
>
>           If you don't want to compile a kernel exclusively for a Sun 3, say N.
>
> +config VIRT
> +       bool "Virtual M68k Machine support"
> +       depends on MMU
> +       select MMU_MOTOROLA if MMU
> +       select M68040
> +       select LEGACY_TIMER_TICK

Can we avoid selecting this for a new platform?

> +       select VIRTIO_MENU

VIRTIO_MENU defaults to y (should it?), so this can be dropped.

> +       select VIRTIO_MMIO
> +       select GOLDFISH
> +       select TTY
> +       select GOLDFISH_TTY
> +       select RTC_CLASS
> +       select RTC_DRV_GOLDFISH

Please sort the selects.

> +       help
> +         This options enable a pure virtual machine based on m68k,
> +         VIRTIO MMIO devices and GOLDFISH interfaces (TTY, RTC, PIC)
> +
>  config PILOT
>         bool
>
> diff --git a/arch/m68k/configs/virt_defconfig b/arch/m68k/configs/virt_defconfig
> new file mode 100644
> index 000000000000..51842acd5434
> --- /dev/null
> +++ b/arch/m68k/configs/virt_defconfig
> @@ -0,0 +1,93 @@

This is not a minimal config, please run "make savedefconfig"
and replace by the generated defconfig.

Please also add CONFIG_LOCALVERSION="-virt", for consistency with the
other configs.

> --- a/arch/m68k/include/asm/irq.h
> +++ b/arch/m68k/include/asm/irq.h
> @@ -12,7 +12,8 @@
>   */
>  #if defined(CONFIG_COLDFIRE)
>  #define NR_IRQS 256
> -#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
> +#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || \
> +      defined(CONFIG_SUN3X) || defined(CONFIG_VIRT)
>  #define NR_IRQS 200

Is this related to NUM_VIRT_SOURCES?

Yes it is:

        m68k_setup_irq_controller(&virt_irq_chip, handle_simple_irq, IRQ_USER,
                                  NUM_VIRT_SOURCES - IRQ_USER);

>  #elif defined(CONFIG_ATARI)
>  #define NR_IRQS 141

> --- a/arch/m68k/include/asm/setup.h
> +++ b/arch/m68k/include/asm/setup.h
> @@ -170,6 +180,20 @@ extern unsigned long m68k_machtype;
>  #  define MACH_TYPE (MACH_SUN3X)
>  #endif
>
> +#if !defined(CONFIG_VIRT)
> +#  define MACH_IS_VIRT (0)
> +#elif defined(CONFIG_AMIGA) || defined(CONFIG_ATARI) || defined(CONFIG_APOLLO) \
> +       || defined(CONFIG_MVME16x) || defined(CONFIG_BVME6000)                 \
> +       || defined(CONFIG_HP300) || defined(CONFIG_Q40)                        \
> +       || defined(CONFIG_SUN3X) || defined(CONFIG_MVME147)                    \
> +       || defined(CONFIG_MAC)

Please move the MAC check between the ATARI and APOLLO checks.

> +#  define MACH_IS_VIRT (m68k_machtype == MACH_VIRT)
> +#else
> +#  define MACH_VIRTONLY

MACH_VIRT_ONLY (albeit unused)

> +#  define MACH_IS_VIRT (1)
> +#  define MACH_TYPE (MACH_VIRT)
> +#endif
> +
>  #ifndef MACH_TYPE
>  #  define MACH_TYPE (m68k_machtype)
>  #endif

> --- /dev/null
> +++ b/arch/m68k/include/asm/virt.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_VIRT_H
> +#define __ASM_VIRT_H
> +
> +#define NUM_VIRT_SOURCES 200
> +
> +struct virt_booter_device_data {
> +       unsigned long mmio;
> +       unsigned long irq;
> +};
> +
> +struct virt_booter_data {
> +       unsigned long qemu_version;
> +       struct virt_booter_device_data pic;
> +       struct virt_booter_device_data rtc;
> +       struct virt_booter_device_data tty;
> +       struct virt_booter_device_data ctrl;
> +       struct virt_booter_device_data virtio;
> +};
> +
> +extern struct virt_booter_data virt_bi_data;
> +
> +extern void __init virt_init_IRQ(void);
> +extern void __init virt_sched_init(void);
> +
> +#endif
> diff --git a/arch/m68k/include/uapi/asm/bootinfo-virt.h b/arch/m68k/include/uapi/asm/bootinfo-virt.h
> new file mode 100644
> index 000000000000..ab17fd9d200d
> --- /dev/null
> +++ b/arch/m68k/include/uapi/asm/bootinfo-virt.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * asm/bootinfo-virt.h -- Virtual-m68k-specific boot information definitions
> + */
> +
> +#ifndef _UAPI_ASM_M68K_BOOTINFO_VIRT_H
> +#define _UAPI_ASM_M68K_BOOTINFO_VIRT_H
> +
> +#define BI_VIRT_QEMU_VERSION   0x8000
> +#define BI_VIRT_GF_PIC_BASE    0x8001
> +#define BI_VIRT_GF_RTC_BASE    0x8002
> +#define BI_VIRT_GF_TTY_BASE    0x8003
> +#define BI_VIRT_VIRTIO_BASE    0x8004
> +#define BI_VIRT_CTRL_BASE       0x8005
> +
> +#define VIRT_BOOTI_VERSION     MK_BI_VERSION(2, 0)
> +
> +#endif /* _UAPI_ASM_M68K_BOOTINFO_MAC_H */
> diff --git a/arch/m68k/include/uapi/asm/bootinfo.h b/arch/m68k/include/uapi/asm/bootinfo.h
> index 38d3140381fa..203d9cbf9630 100644
> --- a/arch/m68k/include/uapi/asm/bootinfo.h
> +++ b/arch/m68k/include/uapi/asm/bootinfo.h
> @@ -83,6 +83,7 @@ struct mem_info {
>  #define MACH_SUN3X             11
>  #define MACH_M54XX             12
>  #define MACH_M5441X            13
> +#define MACH_VIRT              14

All of the above are already in use in qemu, so I have to accept them ;-)

(Do I see a missed opportunity for adding DT support?...)

> --- a/arch/m68k/kernel/head.S
> +++ b/arch/m68k/kernel/head.S

> @@ -3186,6 +3203,13 @@ func_start       serial_putc,%d0/%d1/%a0/%a1
>  3:
>  #endif
>
> +#ifdef CONFIG_VIRT
> +       is_not_virt(L(serial_putc_done))

Please jump to a new label before the #endif, to make it easier to add
new platforms.

> +
> +       movel L(virt_gf_tty_base),%a1
> +       moveb %d0,%a1@(GF_PUT_CHAR)
> +#endif
> +
>  L(serial_putc_done):
>  func_return    serial_putc


> --- a/arch/m68k/mm/kmap.c
> +++ b/arch/m68k/mm/kmap.c

> @@ -293,18 +299,20 @@ EXPORT_SYMBOL(__ioremap);
>   */
>  void iounmap(void __iomem *addr)
>  {
> -#ifdef CONFIG_AMIGA
> -       if ((!MACH_IS_AMIGA) ||
> -           (((unsigned long)addr < 0x40000000) ||
> -            ((unsigned long)addr > 0x60000000)))
> -                       free_io_area((__force void *)addr);
> +#if defined(CONFIG_AMIGA) || defined(CONFIG_VIRT)

Please split in two separate #ifdefs,...

> +       if (MACH_IS_AMIGA &&
> +           ((unsigned long)addr >= 0x40000000) &&
> +           ((unsigned long)addr < 0x60000000))
> +               return;
> +       if (MACH_IS_VIRT && (unsigned long)addr >= 0xff000000)
> +               return;
>  #else

... drop the #else, ...

>  #ifdef CONFIG_COLDFIRE
>         if (cf_internalio(addr))
>                 return;
>  #endif
> -       free_io_area((__force void *)addr);
>  #endif

... and drop this #endif

> +       free_io_area((__force void *)addr);
>  }
>  EXPORT_SYMBOL(iounmap);

> --- /dev/null
> +++ b/arch/m68k/virt/config.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/serial_core.h>
> +
> +#include <asm/bootinfo.h>
> +#include <asm/bootinfo-virt.h>
> +#include <asm/byteorder.h>
> +

Please drop this blank line.

> +#include <asm/machdep.h>
> +#include <asm/virt.h>

> +static void virt_get_model(char *str)
> +{
> +       /* str is 80 characters long */
> +       sprintf(str, "QEMU Virtual M68K Machine (%d.%d.%d)",

Please use %u for unsigned numbers.

> +               (u8)(virt_bi_data.qemu_version >> 24),
> +               (u8)(virt_bi_data.qemu_version >> 16),
> +               (u8)(virt_bi_data.qemu_version >> 8));
> +}
> +
> +extern void show_registers(struct pt_regs *);

This is unused.

> +void __init config_virt(void)
> +{
> +       char earlycon[24];
> +
> +       if (!MACH_IS_VIRT)
> +               pr_err("ERROR: no Virtual M68k Machine, but %s called!!\n",
> +                      __func__);

This cannot happen, so please drop.

> diff --git a/arch/m68k/virt/ints.c b/arch/m68k/virt/ints.c
> new file mode 100644
> index 000000000000..aa94cb3b6d96
> --- /dev/null
> +++ b/arch/m68k/virt/ints.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/sched/debug.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/delay.h>
> +
> +#include <asm/virt.h>
> +#include <asm/irq.h>
> +#include <asm/hwtest.h>
> +#include <asm/irq_regs.h>

Please sort includes.

> +static void virt_irq_enable(struct irq_data *data)
> +{
> +       GF_PIC(data->irq).enable = 1 << GF_IRQ(data->irq);
> +}
> +
> +static void virt_irq_disable(struct irq_data *data)
> +{
> +       GF_PIC(data->irq).disable = 1 << GF_IRQ(data->irq);
> +}
> +
> +static unsigned int virt_irq_startup(struct irq_data *data)
> +{
> +       GF_PIC(data->irq).enable = 1 << GF_IRQ(data->irq);

Just call virt_irq_enable()?

> +       return 0;
> +}
> +
> +static void virt_irq_shutdown(struct irq_data *data)
> +{
> +       GF_PIC(data->irq).disable = 1 << GF_IRQ(data->irq);
> +}

This is identical to virt_irq_disable(), so you can just use the latter below.

> +
> +static volatile int in_nmi;

This is used inside virt_nmi_handler() only, so please move it there.
> +
> +irqreturn_t virt_nmi_handler(int irq, void *dev_id)
> +{
> +       if (in_nmi)
> +               return IRQ_HANDLED;
> +       in_nmi = 1;
> +
> +       pr_info("Non-Maskable Interrupt\n");

pr_warn()? Or another pr_*()?

> +       show_registers(get_irq_regs());
> +
> +       in_nmi = 0;
> +       return IRQ_HANDLED;
> +}
> +
> +static struct irq_chip virt_irq_chip = {
> +       .name           = "virt",
> +       .irq_enable     = virt_irq_enable,
> +       .irq_disable    = virt_irq_disable,
> +       .irq_startup    = virt_irq_startup,
> +       .irq_shutdown   = virt_irq_shutdown,

... = virt_irq_disable,

> +};
> +
> +static void goldfish_pic_irq(struct irq_desc *desc)
> +{
> +       u32 irq_pending, irq_bit;
> +       int irq_num;
> +
> +       irq_pending = gf_pic[desc->irq_data.irq - 1].irq_pending;
> +       irq_num = IRQ_USER + (desc->irq_data.irq - 1) * 32;
> +       irq_bit = 1;
> +
> +       do {
> +               if (irq_pending & irq_bit) {
> +                       generic_handle_irq(irq_num);
> +                       irq_pending &= ~irq_bit;
> +               }
> +               ++irq_num;
> +               irq_bit <<= 1;
> +       } while (irq_pending);

This can be simplified by shifting irq_pending instead of irq_bit:

    do {
            if (irq_pending & 1)
                    generic_handle_irq(irq_num);

            ++irq_num;
            irq_pending >>= 1;
    } while (irq_pending);

Unfortunately m68k doesn't have a single-instruction __ffs().

> +}
> +
> +void __init virt_init_IRQ(void)
> +{
> +       int i;
> +
> +       m68k_setup_irq_controller(&virt_irq_chip, handle_simple_irq, IRQ_USER,
> +                                 NUM_VIRT_SOURCES - IRQ_USER);
> +
> +       for (i = 0; i < 6; i++) {

6 = NUM_VIRT_SOURCES / 32?
If yes, what about the last 8 irqs?

> +               irq_set_chained_handler(virt_bi_data.pic.irq + i,
> +                                       goldfish_pic_irq);
> +       }

> --- /dev/null
> +++ b/arch/m68k/virt/platform.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <asm/virt.h>
> +#include <asm/irq.h>
> +
> +static struct platform_device virt_m68k_goldfish_tty = {
> +       .name = "goldfish_tty",
> +       .id = PLATFORM_DEVID_NONE,
> +       .num_resources = 2,
> +       .resource = (struct resource [2]) { },
> +};
> +static struct platform_device virt_m68k_goldfish_rtc = {
> +       .name = "goldfish_rtc",
> +       .id = PLATFORM_DEVID_NONE,
> +       .num_resources = 2,
> +       .resource = (struct resource [2]) { },
> +};
> +
> +#define VIRTIO_BUS_NB  128
> +static struct platform_device virt_m68k_virtio_mmio_device[VIRTIO_BUS_NB];
> +static struct resource virt_m68k_virtio_mmio_resources[VIRTIO_BUS_NB][2];

This consumes more than 40 KiB, even when unused.
While this doesn't matter much for a virtual machine with 3.2 GiB of
RAM, it does matter for running a multi-platform kernel on a real
machine.  Hence please allocate dynamically.

> +
> +static int __init virt_platform_init(void)
> +{
> +       int err;
> +       int i;
> +       extern unsigned long min_low_pfn;

Please use reverse Christmas tree declaration order.

> +
> +       if (!MACH_IS_VIRT)
> +               return -ENODEV;
> +
> +       min_low_pfn = 0;

Why is this needed?

> +
> +       virt_m68k_goldfish_tty.resource[0].flags = IORESOURCE_MEM;
> +       virt_m68k_goldfish_tty.resource[0].start = virt_bi_data.tty.mmio;
> +       virt_m68k_goldfish_tty.resource[0].end   = virt_bi_data.tty.mmio;
> +       virt_m68k_goldfish_tty.resource[1].flags = IORESOURCE_IRQ;
> +       virt_m68k_goldfish_tty.resource[1].start = virt_bi_data.tty.irq;
> +       virt_m68k_goldfish_tty.resource[1].end   = virt_bi_data.tty.irq;
> +
> +       err = platform_device_register(&virt_m68k_goldfish_tty);

You could probably save a little bit of memory by calling
platform_device_register_simple() instead.

> +       if (err)
> +               return err;
> +
> +       virt_m68k_goldfish_rtc.resource[0].flags = IORESOURCE_MEM;
> +       virt_m68k_goldfish_rtc.resource[0].start = virt_bi_data.rtc.mmio + 0x1000;
> +       virt_m68k_goldfish_rtc.resource[0].end   = virt_bi_data.rtc.mmio + 0x1fff;
> +       virt_m68k_goldfish_rtc.resource[1].flags = IORESOURCE_IRQ;
> +       virt_m68k_goldfish_rtc.resource[1].start = virt_bi_data.rtc.irq + 1;
> +       virt_m68k_goldfish_rtc.resource[1].end   = virt_bi_data.rtc.irq + 1;
> +       err = platform_device_register(&virt_m68k_goldfish_rtc);

Likewise.

> --- /dev/null
> +++ b/arch/m68k/virt/timer.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/interrupt.h>
> +#include <linux/ioport.h>
> +#include <linux/clocksource.h>
> +#include <asm/virt.h>
> +
> +struct goldfish_timer {
> +       u32 time_low;
> +       u32 time_high;
> +       u32 alarm_low;
> +       u32 alarm_high;
> +       u32 irq_enabled;
> +       u32 clear_alarm;
> +       u32 alarm_status;
> +       u32 clear_interrupt;
> +};
> +
> +#define gf_timer ((volatile struct goldfish_timer *)virt_bi_data.rtc.mmio)
> +
> +static u64 goldfish_timer_read(struct clocksource *cs)
> +{
> +       u64 ticks;
> +
> +       ticks = gf_timer->time_low;
> +       ticks += (u64)gf_timer->time_high << 32;

Can time_low wrap in between the two reads?

> +
> +       return ticks;
> +}
> +
> +static struct clocksource goldfish_timer = {
> +       .name           = "goldfish_timer",
> +       .rating         = 400,
> +       .read           = goldfish_timer_read,
> +       .mask           = CLOCKSOURCE_MASK(64),
> +       .flags          = 0,
> +       .max_idle_ns    = LONG_MAX,
> +};
> +
> +static irqreturn_t golfish_timer_handler(int irq, void *dev_id)
> +{
> +       unsigned long flags;
> +       u64 now;
> +
> +       local_irq_save(flags);

Do we need this in an interrupt handler?

> +       gf_timer->clear_interrupt = 1;
> +
> +       now = gf_timer->time_low;
> +       now += (u64)gf_timer->time_high << 32;

now = goldfish_timer_read();

> +
> +       legacy_timer_tick(1);
> +
> +       now += NSEC_PER_SEC / HZ;
> +       gf_timer->alarm_high = now >> 32;

upper_32_bits(now)

> +       gf_timer->alarm_low = (u32)now;

lower_32_bits(now)

> +       local_irq_restore(flags);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +void __init virt_sched_init(void)
> +{
> +       u64 now;
> +       static struct resource sched_res;

Please use reverse Christmas tree declaration order.

> +
> +       sched_res.name  = "goldfish_timer";
> +       sched_res.start = virt_bi_data.rtc.mmio;
> +       sched_res.end   = virt_bi_data.rtc.mmio + 0xfff;
> +
> +       if (request_resource(&iomem_resource, &sched_res)) {
> +               pr_err("Cannot allocate goldfish-timer resource\n");
> +               return;
> +       }
> +
> +       if (request_irq(virt_bi_data.rtc.irq, golfish_timer_handler, IRQF_TIMER,
> +                       "timer", NULL)) {
> +               pr_err("Couldn't register timer interrupt\n");
> +               return;
> +       }
> +
> +       now = gf_timer->time_low;
> +       now += (u64)gf_timer->time_high << 32;

now = goldfish_timer_read();

> +       now += NSEC_PER_SEC / HZ;
> +
> +       gf_timer->clear_interrupt = 1;
> +       gf_timer->alarm_high = now >> 32;

upper_32_bits(now)

> +       gf_timer->alarm_low = (u32)now;

lower_32_bits(now)

> +       gf_timer->irq_enabled = 1;
> +
> +       clocksource_register_hz(&goldfish_timer, NSEC_PER_SEC);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
