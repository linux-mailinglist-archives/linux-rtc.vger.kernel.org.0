Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB6185C73
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Aug 2019 10:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731779AbfHHIF6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Aug 2019 04:05:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34339 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731719AbfHHIF6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Aug 2019 04:05:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id n5so115237995otk.1;
        Thu, 08 Aug 2019 01:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TtvrwHBBYi+jmQBqq+h4raD1vCv1LyjklWLsWrx2nck=;
        b=GHgZWqqPvdsaSjThKrEcyB8F2fmAsTD2iRjGLm0O6NzDk2/weU0u4wqkTjViKEv55K
         wy3ToeOL8E9ufD0PCgVEsSpvmFPBL9KJlvRTPogWvH7TjOCRZgsB07joovN7EiQv3yno
         71oRj83ZRF0clOrgvstNvm5rs1WG7mKGWi8i93srTbnfdMa5iqRH8AWW2LQpdIc+mZe7
         3gl+8DISR+UW1g3mmCx3UYr7Ut5hZPHuKMTQLQTV9gQwHqxtT73yCWxoj9HaafpzMJpE
         nnPZ/nxLwQxPF+1ENrwjZ79gFeioWiLRAy4gTq29Ex8OAZh+Q8vGFdNv6fk4AAvMjWSB
         YZJA==
X-Gm-Message-State: APjAAAWfZSlFsOdZAVBmWFMSHgVDL7dzhXGiO8qCb1gxbq2y7yg7Uj1k
        oXIQ0q6QyPujHT0ljzBRTjHSO1GhhDOhsbcTjIQ=
X-Google-Smtp-Source: APXvYqxTlUIJTqAQ7wADVSl1f90KSihADYKiCuHyYG/JvGAUchepy/4WCuvCFz5IgZrJ1/yJcH2/BDRva71dz/6mgyo=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr12213592otc.250.1565251557005;
 Thu, 08 Aug 2019 01:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190730181557.90391-1-swboyd@chromium.org> <20190730181557.90391-40-swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-40-swboyd@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 10:05:46 +0200
Message-ID: <CAMuHMdXArXKeE0OUaBN2f8bkAakuV6+55acNw9t9Fc5uyk_LXg@mail.gmail.com>
Subject: Re: [PATCH v6 39/57] rtc: Remove dev_err() usage after platform_get_irq()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Stephen,

On Tue, Jul 30, 2019 at 8:21 PM Stephen Boyd <swboyd@chromium.org> wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
>
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
>
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
>
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
>
> While we're here, remove braces on if statements that only have one
> statement (manually).
>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Please apply directly to subsystem trees
>
>  drivers/rtc/rtc-88pm80x.c    | 1 -
>  drivers/rtc/rtc-88pm860x.c   | 4 +---
>  drivers/rtc/rtc-ac100.c      | 4 +---
>  drivers/rtc/rtc-armada38x.c  | 5 +----
>  drivers/rtc/rtc-asm9260.c    | 4 +---
>  drivers/rtc/rtc-at91rm9200.c | 4 +---
>  drivers/rtc/rtc-at91sam9.c   | 4 +---
>  drivers/rtc/rtc-bd70528.c    | 5 +----
>  drivers/rtc/rtc-davinci.c    | 4 +---
>  drivers/rtc/rtc-jz4740.c     | 4 +---
>  drivers/rtc/rtc-max77686.c   | 5 +----
>  drivers/rtc/rtc-mt7622.c     | 1 -
>  drivers/rtc/rtc-pic32.c      | 4 +---
>  drivers/rtc/rtc-pm8xxx.c     | 4 +---
>  drivers/rtc/rtc-puv3.c       | 8 ++------
>  drivers/rtc/rtc-pxa.c        | 8 ++------
>  drivers/rtc/rtc-rk808.c      | 6 +-----
>  drivers/rtc/rtc-s3c.c        | 8 ++------
>  drivers/rtc/rtc-sc27xx.c     | 4 +---
>  drivers/rtc/rtc-spear.c      | 4 +---
>  drivers/rtc/rtc-stm32.c      | 1 -
>  drivers/rtc/rtc-sun6i.c      | 4 +---
>  drivers/rtc/rtc-sunxi.c      | 4 +---
>  drivers/rtc/rtc-tegra.c      | 4 +---
>  drivers/rtc/rtc-vt8500.c     | 4 +---
>  drivers/rtc/rtc-xgene.c      | 4 +---
>  drivers/rtc/rtc-zynqmp.c     | 8 ++------
>  27 files changed, 28 insertions(+), 92 deletions(-)

Failed to catch:
drivers/rtc/rtc-sh.c:   ret = platform_get_irq(pdev, 0);
drivers/rtc/rtc-sh.c-   if (unlikely(ret <= 0)) {
drivers/rtc/rtc-sh.c-           dev_err(&pdev->dev, "No IRQ resource\n");
drivers/rtc/rtc-sh.c-           return -ENOENT;
drivers/rtc/rtc-sh.c-   }
drivers/rtc/rtc-sh.c-

Note that there are two more calls for optional interrupts:
drivers/rtc/rtc-sh.c:   rtc->carry_irq = platform_get_irq(pdev, 1);
drivers/rtc/rtc-sh.c:   rtc->alarm_irq = platform_get_irq(pdev, 2);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
