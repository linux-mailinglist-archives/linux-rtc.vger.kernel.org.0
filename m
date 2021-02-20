Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F8B320669
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Feb 2021 18:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhBTR2V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 20 Feb 2021 12:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhBTR2V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 20 Feb 2021 12:28:21 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD30C061574
        for <linux-rtc@vger.kernel.org>; Sat, 20 Feb 2021 09:27:40 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id g24so6397995qts.2
        for <linux-rtc@vger.kernel.org>; Sat, 20 Feb 2021 09:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=3cqKNH4/q2OHZhZVmiscwUYZe72W/KykEhyT7GXHaqo=;
        b=sVi/PyaybT8goMRtFqCagI5Ri/YWtoKpP/dTgbUge35BFXRzTLeV+v3t01TetWIqDb
         V+PlBunPEbNggaPq+eu0O2hYknCSXiuRxfHsDMVkN3iQjA80ckQtRUoBZ3TiizszJyD4
         0q88JObh5SktzIccJz6mi3j4Bv3dt4TlEaq5IMrUMZSmwe36aGGojXLHZ/2VPHI1xSmu
         GzW534p7OI3VIBcJrQWzU2N5CAwfJ/EycO7+3Qh9yI6FLp8dQ2px0HdQ2IpF4QcPGSfk
         aulbRodxxUXnH3t35bRnMw0UiUc7McRqAxMpQpinyddDn3weykFkot8mT3XwKJ6xcYza
         HcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=3cqKNH4/q2OHZhZVmiscwUYZe72W/KykEhyT7GXHaqo=;
        b=Uaf8Bk05EMTPlIKjnH7yqbCjyPY/F+Rv6ULGNxScSRF9fVgZmR2fQpQkx+ePteZY6M
         Ot7tFYzh/RNYO0AhHzGYerLgdq1N8G5gGncfMagT72Yi/znGF6VIgrimf0CdUyGbjj/I
         V+Fi7yIEOmCOiEEgw7c6KngRcZxsTzOsxvENEnaJ3e0AZLvXtRf42yc1CHh/Dku4Igsd
         wXIQkB6n7i5Ncbx1ONLRlWenDC+9peWGJ8dffkH2OYM60IAwiA1sQfK23xnROTF7mQ1c
         b2ooUhv7QYYgR42WVBjIYC9MHztzPLYvl8RVk5BuVAIjSSdjWw8zmqm8dDB5IdFS6UyG
         obTQ==
X-Gm-Message-State: AOAM530ujKUny+xptR1x1D3rU1YxC01z426C9Dslrh1ZOrFEGP7hHewK
        L7oJ8J2RNxCIt9wjK8sKZ2UmFiaiRF5Rbw==
X-Google-Smtp-Source: ABdhPJw40uix8gyXZdwHUzpewmwIb9Viri2T1doNWTWi1E++yUqU3ErkmRrOduwd0FMrgVO7R+vIhw==
X-Received: by 2002:ac8:530f:: with SMTP id t15mr13595623qtn.167.1613842060042;
        Sat, 20 Feb 2021 09:27:40 -0800 (PST)
Received: from DESKTOPJC0RTV5 (pool-173-48-78-29.bstnma.fios.verizon.net. [173.48.78.29])
        by smtp.gmail.com with ESMTPSA id a9sm1004636qtx.96.2021.02.20.09.27.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Feb 2021 09:27:39 -0800 (PST)
From:   <charley.ashbringer@gmail.com>
To:     "'Alexandre Belloni'" <alexandre.belloni@bootlin.com>
Cc:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>
References: <000801d706f0$31f2c370$95d84a50$@gmail.com> <YDBZOMKQreMcCEXz@piout.net>
In-Reply-To: <YDBZOMKQreMcCEXz@piout.net>
Subject: RE: [bug report] out-of-bound array access in drivers/rtc/lib.c rtc_month_days
Date:   Sat, 20 Feb 2021 12:27:36 -0500
Message-ID: <000f01d707ad$aee32f60$0ca98e20$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJNV6U8H1Ym7EyydOwVWl3Qide36AFDVmtwqWqQGnA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!

> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Friday, February 19, 2021 7:35 PM
> To: charley.ashbringer@gmail.com
> Cc: a.zummo@towertech.it; linux-rtc@vger.kernel.org
> Subject: Re: [bug report] out-of-bound array access in drivers/rtc/lib.c
> rtc_month_days
> 
> Hello,
> 
> On 19/02/2021 13:51:12-0500, charley.ashbringer@gmail.com wrote:
> > Hi Alessandro and Alexandre,
> > Greetings, I'm a 2nd year PhD student who is interested in using UBSan
> > to the kernel.
> > Through some experiment, I found a out-of-bound array access in
> > function rtc_month_days.
> > More specifically, the through the call chain of
> > davinci_rtc_set_time/davinci_rtc_set_alarm -> convert2days ->
> > rtc_month_days, since davinci_rtc_set_time/davinci_rtc_set_alarm are
> > ioctl functions, thus the 2nd parameter, struct rtc_time *tm, is
> > passed in purely from user-space which can be any value.
> 
> This part is not true and is probably what you are missing, the userspace
> input is sanitized by the core, see the rtc_valid_tm calls
> here:
> https://elixir.bootlin.com/linux/v5.11/source/drivers/rtc/interface.c#L130
> and here:
> https://elixir.bootlin.com/linux/v5.11/source/drivers/rtc/interface.c#L457
> 

Thank you so much for pointing this out, 
I didn't notice when probing each individual rtc device, 
there is a devm_rtc_allocate_device which essentially 
sanitized the ioctl input from the core.
This broaden my understanding of how ioctl works a lot, 
thank you so much!

Best regards,
Changming

> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

