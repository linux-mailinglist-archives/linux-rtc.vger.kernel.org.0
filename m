Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9F636832B
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Apr 2021 17:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236563AbhDVPRt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 11:17:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:52414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236545AbhDVPRs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Apr 2021 11:17:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBB76613C8;
        Thu, 22 Apr 2021 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619104633;
        bh=W8iGIqJG4zluG1+8hGwKSis7uYy6Ct+D0O1tpNsCCnM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dL/8BcsLMs9MkDWPKeXGo1h2GQTzpE3nC1r9AImH9Dp8xVPRkOBVqp2or3aTq4/6f
         RWZDz6EWZj34AZzm8bg/W9jBCqa58RqZunr7DRGHPQJ9Z2q+4zMpXygTOTtQLcZsOU
         hUO1TfI3Ii67/naPw8knx/sTPjsWJ1PwHRBoWZj1fGFncDrtbAbU/FHWtbiSq4NwzL
         bn5vXl1DTCKPYN9ivv30kS7G51i77yGjSiokIhNItG8wUB6RIRfAIudjYcfzAhUzSZ
         aQJpfauSj/0Yj7rbylwIVQHGs8xLqDr2m9VQvkRjkopA1MiTaBQJJVDacQPDcJedAU
         jtu9XLWAEzXzA==
Received: by mail-wm1-f47.google.com with SMTP id y5-20020a05600c3645b0290132b13aaa3bso3346930wmq.1;
        Thu, 22 Apr 2021 08:17:13 -0700 (PDT)
X-Gm-Message-State: AOAM532uQ1DwjGivs+H/fyuwEQPVLJoisbmoYx9DXViKt5cNe7b8gGgu
        MovQGRFXUnWnwNeBMf3pQgIxOE9x7jSatgEfdZc=
X-Google-Smtp-Source: ABdhPJzaA5K7NHngZk5kbZI1Nu/xW1ztSM0nD9LIKxCpNlNByzqYD9Uy8m9iDD8K8PM25znTLjD3c27Wo0umtEPYgWw=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr538741wmi.75.1619104632198;
 Thu, 22 Apr 2021 08:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210422133307.1710832-1-arnd@kernel.org> <82120164-c12a-bf12-0838-c3d926fe4eaf@roeck-us.net>
In-Reply-To: <82120164-c12a-bf12-0838-c3d926fe4eaf@roeck-us.net>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 22 Apr 2021 17:16:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2OfujAbCHqr+cRYw3SLNE0EnMkvPCvxd5R8hxv4zGCrw@mail.gmail.com>
Message-ID: <CAK8P3a2OfujAbCHqr+cRYw3SLNE0EnMkvPCvxd5R8hxv4zGCrw@mail.gmail.com>
Subject: Re: [PATCH] rtc: bd70528: fix BD71815 watchdog dependency
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 22, 2021 at 4:23 PM Guenter Roeck <linux@roeck-us.net> wrote:

> >
> >  config RTC_DRV_BD70528
> >       tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
> > -     depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> > +     depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 || BD70528_WATCHDOG
>
> Is the "|| BD70528_WATCHDOG" above correct ? Seems odd to me, since
> it makes the depend statement true even if neither MFD_ROHM_BD71828
> nor MFD_ROHM_BD70528 is enabled.
>
> I think the condition needs to be something like
>         depends on (MFD_ROHM_BD71828 || MFD_ROHM_BD70528) && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> or, in two lines,
>         depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528
>         depends on BD70528_WATCHDOG || !BD70528_WATCHDOG

Indeed, I misread this as being used on any of three drivers, but
MFD_ROHM_BD70528/BD70528_WATCHDOG is really the same
thing.

I sent an updated patch.

        Arnd
