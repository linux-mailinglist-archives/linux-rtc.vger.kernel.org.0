Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF2B71573AA
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2020 12:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJLs1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 Feb 2020 06:48:27 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39458 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgBJLs1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 Feb 2020 06:48:27 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so10219326wme.4
        for <linux-rtc@vger.kernel.org>; Mon, 10 Feb 2020 03:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1aQqSSjewIOk+NSQDYZdBuMf/MgfILJe523/C8XJcy8=;
        b=FaZcVpT5JDHcbUCWe+ralMxFLwrZvkzrej68mEa1ypXrQBM08yXsExEj1fzIr+Ddq0
         /mCpv9nLEwmfxxtAPis0PuMAJAsun0WHWQ/UjZvJukQmj4idIQ5QrGpC2m/oCnp5ekRt
         RMSIdIofZYVa7bnSKRFMuGsiLFDWSxcekBzTUbXJQF8c4cZIlXF6DGqHRyAbZRZ4k6ps
         R0zCvMErCqMI9GPaQ0dCKcg/KA5LCCN27O/pVE7am24L0i8KjWByplOrt5w4H/mL+/3f
         1b80zYLcG1FaS3R8hD30XXkeo0KEtQwLErR26kO9xMP38IEV/BK0kvAPRNf//7GK6kkj
         G/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1aQqSSjewIOk+NSQDYZdBuMf/MgfILJe523/C8XJcy8=;
        b=ggwFJR50jrPeT4smPi3Mf+kKsIpiX5PAGJXlQbw6NE5w9vfPYLh5P4kMD8fi+1skhP
         OWPb3vx36fkqM2Ns4VoTswzKR8Hy/B53dtRJ6VSb8JltaHtMQ9ebdFkr3fcXhiDdpgUW
         qyyQL8+C+nz0J6N6rB5l5OvK2mpmWiv1BZVWGBiAaLEP4NKkuSE9ZBabG1dMAv4+wJw7
         W5KwfvNQJkcmF3R9W+vccXe4CpiAqv6jrCX7OzpE14pvbvL7DnYYj4sRZgFfyTxA84Gr
         zrQyt+l5+27Ud/IhS1tCxBNh1d9Nr6BYO2ObiA9vyW+5hS4Wyl3+sz31X4u/iYTtet4h
         qn/w==
X-Gm-Message-State: APjAAAXdJe07bTpzakEZ8/K3iwKuFIHxsjc2m9pkmo7ehR969vttrECe
        x3GiRIZr0YolnCoqcKgwEtsc+Pu3xQDoyaX0UQbOEA==
X-Google-Smtp-Source: APXvYqyi6XtrJMXk9ZlugaSIfF0G093AdaIblomhIXPduCLz03AchNEqASxw/DZcOJfykRMfgdT69usn7374kSRrGGk=
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr14757971wmj.41.1581335305184;
 Mon, 10 Feb 2020 03:48:25 -0800 (PST)
MIME-Version: 1.0
References: <1576155618-7933-1-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1576155618-7933-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Mon, 10 Feb 2020 12:48:14 +0100
Message-ID: <CAHTX3dKSq1oTzkoRv3wK3rhkc1r0rOiQhFKmgsYbtG_uvOfAJg@mail.gmail.com>
Subject: Re: [PATCH] rtc: zynqmp: Clear alarm interrupt status before
 interrupt enable
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

=C4=8Dt 12. 12. 2019 v 14:01 odes=C3=ADlatel Srinivas Neeli
<srinivas.neeli@xilinx.com> napsal:
>
> Fix multiple occurring interrupts for alarm interrupt. RTC module doesn't
> clear the alarm interrupt status bit immediately after the interrupt is
> triggered.This is due to the sticky nature of the alarm interrupt status
> register. The alarm interrupt status register can be cleared only after
> the second counter outruns the set alarm value. To fix multiple spurious
> interrupts, disable alarm interrupt in the handler and clear the status
> bit before enabling the alarm interrupt.
>
> Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 5786866c09e9..d311e3ef1f21 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -38,6 +38,8 @@
>
>  #define RTC_CALIB_DEF          0x198233
>  #define RTC_CALIB_MASK         0x1FFFFF
> +#define RTC_ALRM_MASK          BIT(1)
> +#define RTC_MSEC               1000
>
>  struct xlnx_rtc_dev {
>         struct rtc_device       *rtc;
> @@ -124,11 +126,28 @@ static int xlnx_rtc_alarm_irq_enable(struct device =
*dev, u32 enabled)
>  {
>         struct xlnx_rtc_dev *xrtcdev =3D dev_get_drvdata(dev);
>

here shouldn't be empty line.

> -       if (enabled)
> +       unsigned int status;
> +       ulong timeout;
> +
> +       timeout =3D jiffies + msecs_to_jiffies(RTC_MSEC);
> +
> +       if (enabled) {
> +               while (1) {
> +                       status =3D readl(xrtcdev->reg_base + RTC_INT_STS)=
;
> +                       if (!((status & RTC_ALRM_MASK) =3D=3D RTC_ALRM_MA=
SK))
> +                               break;
> +
> +                       if (time_after_eq(jiffies, timeout)) {
> +                               dev_err(dev, "Time out occur, while clear=
ing alarm status bit\n");
> +                               return -ETIMEDOUT;
> +                       }
> +                       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_=
STS);
> +               }
> +
>                 writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
> -       else
> +       } else {
>                 writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
> -
> +       }

And here it was good to have empty line.

>         return 0;
>  }
>
> @@ -183,8 +202,8 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *=
id)
>         if (!(status & (RTC_INT_SEC | RTC_INT_ALRM)))
>                 return IRQ_NONE;
>
> -       /* Clear RTC_INT_ALRM interrupt only */
> -       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
> +       /* Disable RTC_INT_ALRM interrupt only */
> +       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
>
>         if (status & RTC_INT_ALRM)
>                 rtc_update_irq(xrtcdev->rtc, 1, RTC_IRQF | RTC_AF);
> --
> 2.7.4

Other then these two above things look good.

Alexandre: Any issue with this patch?

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
