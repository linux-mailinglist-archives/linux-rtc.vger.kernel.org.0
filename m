Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED70686BB9
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Aug 2019 22:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390211AbfHHUlH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Aug 2019 16:41:07 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38548 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfHHUlH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Aug 2019 16:41:07 -0400
Received: by mail-qk1-f195.google.com with SMTP id u190so6315795qkh.5;
        Thu, 08 Aug 2019 13:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHt4kl62PCQFTOrMsi+hPEp59k3mqYgovgD66AjIOD4=;
        b=tMiVoZTAMvDt+P76BDjkja6B0CRQF65ePRygyd/x8Hh1q2W1zLGGOhoiz5b0jQQtvH
         hUlWF1uhMg7Mi+f3jsqTeiroz+dfbsyZZDmAV7DubZ7DCxiDHjmTGWi/SUXQ/Bu/keTk
         1syHaKJchAPq8uoZzuhp3QK0W2icUHYfkB1BKuAQR22jdS8lRvGh/irihuM4GYyUQnpC
         cxP4hD9rlZWX185rKQZ7/jJSELAgB5bCH+GORWYnTKLzKcc/qISWUOR5yU71TPFvGknW
         ETwP/JRP0W2ni+r6H3Q4L26lazk0ZuIQ8gfKH/9qvKxZo6+JvDcIVDcq5rsZPiUibUUP
         DuxA==
X-Gm-Message-State: APjAAAWmqa3IwftBzR+ed9oYcOQzr01OGx+F5nECOUwL4T5snUHIqDuA
        BY+INYlnvpUbtGzvYPxDCgV6Na7u/xjL7oXMZFg=
X-Google-Smtp-Source: APXvYqxvwAzDFtLTI1NTHILmZNs1F2X4p2krCf4ECREW46KwDo93TmuTOs+U9PxQE8DMY4O/p+TnAhiLjCqwXglHtC4=
X-Received: by 2002:a37:4ac3:: with SMTP id x186mr14669116qka.138.1565296866077;
 Thu, 08 Aug 2019 13:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190708124227.3422311-1-arnd@arndb.de> <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
 <CAK8P3a1HNnstePcreH-ZLyiJi3tNcCNJ=VozZUMnp-VLvYLSaA@mail.gmail.com>
 <e1687224a155787d9f3c042dca1c03a81b89ed25.camel@fi.rohmeurope.com>
 <81f5978e-f401-0975-6c96-003b6d94e49d@huawei.com> <f22cf88f836159b9f5428c6297d8e54b4639e1db.camel@fi.rohmeurope.com>
In-Reply-To: <f22cf88f836159b9f5428c6297d8e54b4639e1db.camel@fi.rohmeurope.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 8 Aug 2019 22:40:49 +0200
Message-ID: <CAK8P3a1hJBF40n49furd2pJ3tPCKNfELXweNyab+CZZo1fvZTg@mail.gmail.com>
Subject: Re: [PATCH] rtc: bd70528: fix link error
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Aug 8, 2019 at 9:53 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Thu, 2019-08-08 at 10:29 +0800, Yuehaibing wrote:
> > On 2019/7/9 13:25, Vaittinen, Matti wrote:
> > > awkward at first sight but indeed - depends on BD70528_WATCHDOG
> > > disallows BD70528_WATCHDOG=m with RTC_DRV_BD70528=y while
> > > !BD70528_WATCHDOG allows BD70528_WATCHDOG=n. Brilliant and exactly
> > > what
> > > we need :) Thanks a bunch!
> >
> > Hello Vaittinen,
> >
> > the issue still exists in linux-next 20190807, any plan?
> >
>
> Sorry folks. I thought Arnd would send new patch - I didn't want to
> steal his work ;) I will be back to my normal life next week so I
> will send a patch at monday if the issue is still open!

Sorry I lost track, and thanks for the offer to take care of it.

Please add my one

Reported-by: Arnd Bergmann <arnd@arndb.de>

and/or

Suggested-by: Arnd Bergmann <arnd@arndb.de>

as appropriate when you create that patch.

       Arnd
