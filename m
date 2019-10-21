Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED285DF4DA
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 20:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbfJUSIW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 14:08:22 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33638 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbfJUSIW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 14:08:22 -0400
Received: by mail-qt1-f193.google.com with SMTP id r5so22469121qtd.0
        for <linux-rtc@vger.kernel.org>; Mon, 21 Oct 2019 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4x966FzqbSx/OKh4p5Ft123ZasqylypjRFf91DAyyOA=;
        b=ZMBnR2U2u4X68MXVm+8rsMwA+4duw05rldsVrPC4uH+6neLc/Y761o+A+e0P8mDu+F
         utweRWpB6iBzQPfEHGUPjFwESRMWYH1GX9VMij+Gzp5M6maRvvwBN4Bq2X01XUN62Dw5
         ToEe4Pv9IucB7UOv46I1/6GfMkaEGz+vfbqj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4x966FzqbSx/OKh4p5Ft123ZasqylypjRFf91DAyyOA=;
        b=ATH8qSadXitVPxIBoxDjbnTuZ+SIEMSHBQwRbfiFYJgp6Rum2mY1DwhrTdkjO4yDIc
         MFXlnKsqFyEig9MHJ0/r4UUt4s0rnGL+XkDqcSa3xGWaB/3QYXfV8M/KTNPHfGnSVjrd
         Fkb/+VgLCvii+4OEPUWTYQh5UKV1PvvYnvTqetPQNsRuh/6/uyx8vCqTslnADzvYmq6/
         PqU1iDHzVGLzpYPYyjqy8CZ1ndj0UooBRP8/IrArgsFWhmWagMQCc+41W0JiSIEBkOEr
         rIbgFRWUl8ZuOQ6JEeo+edX5yHKL8CYpUtLVA2rmDDSolhxsP2m8Jrawnoh+i680wolc
         VEJQ==
X-Gm-Message-State: APjAAAW60pX55HfQOl8KGJ7uTXA33Ma7sQxYCypWuLCoeExUJKcWHARU
        FyUWRFwma+tGW0QtQTe5NRyhXkDjlrw=
X-Google-Smtp-Source: APXvYqzthuaeh40eeIQJorGqgWk9NOrnS23dv4yve/KcXWIjK48mEER7qpyKDH1fVyikU2ACwmhK2A==
X-Received: by 2002:aed:230a:: with SMTP id h10mr25255561qtc.84.1571681301020;
        Mon, 21 Oct 2019 11:08:21 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id p4sm9068629qkf.112.2019.10.21.11.08.19
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 11:08:20 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id g50so8254817qtb.4
        for <linux-rtc@vger.kernel.org>; Mon, 21 Oct 2019 11:08:19 -0700 (PDT)
X-Received: by 2002:ac8:529a:: with SMTP id s26mr25589910qtn.238.1571681299254;
 Mon, 21 Oct 2019 11:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180521164222.149896-1-briannorris@chromium.org>
 <20191021161113.GZ3125@piout.net> <CA+ASDXOXSKoRcuRWZ1FGNcioFKSiazXGxOvMv5=px_pn46vJbw@mail.gmail.com>
 <20191021174809.GA3125@piout.net>
In-Reply-To: <20191021174809.GA3125@piout.net>
From:   Brian Norris <briannorris@chromium.org>
Date:   Mon, 21 Oct 2019 11:08:08 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMarBG5C1Kz42B9i_iVZ1=i6GgH9Yja2cdmSueKD_As_g@mail.gmail.com>
Message-ID: <CA+ASDXMarBG5C1Kz42B9i_iVZ1=i6GgH9Yja2cdmSueKD_As_g@mail.gmail.com>
Subject: Re: [PATCH] rtc: report time-retrieval errors when updating alarm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Oct 21, 2019 at 10:48 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 21/10/2019 10:20:08-0700, Brian Norris wrote:
> > Hi Alexandre!
> >
> > On Mon, Oct 21, 2019 at 9:11 AM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > On 21/05/2018 09:42:22-0700, Brian Norris wrote:
> > > > __rtc_read_time() can fail (e.g., if the RTC uses an unreliable medium).
> > > > When it does, we don't report the error, but instead calculate a
> > > > 1-second alarm based on the potentially-garbage 'tm' (in practice,
> > > > __rtc_read_time() zeroes out the time first, so it's likely to still be
> > > > all 0).
> > > >
> > > > Let's propagate the error instead.
> > > >
> > >
> > > I submitted
> > > https://lore.kernel.org/linux-rtc/20191021155631.3342-2-alexandre.belloni@bootlin.com/T/#u
> > > to solve this after looking at all the implication checking the return
> > > value of __rtc_read_time had.
> >
> > Only about a year and a half late, nice!
>
> I know, right? :) The fact is that this is not a common issue or at
> least, I didn't have any report that this was causing real problems in
> the field. So it ended up being one of the longest standing patch in
> patchwork...

I suppose I could have put specific examples in here: the Rockchip
RK3399-based Gru family of Chromebooks
(arch/arm64/boot/dts/rockchip/rk3399-gru-{kevin,bob,scarlet}*.dts) use
the Chrome OS EC-based RTC (drivers/rtc/rtc-cros-ec.c), and the EC
protocol is prone to occasional errors. So we definitely have a
concrete case where this problem can be tickled. I guess I was too
terse in summarizing that as "if the RTC uses an unreliable medium"?

As for the actual symptoms: this was part of a variety of problems
that resulted in seeing interrupt storms from our EC/RTC when running
`hwclock -r`. I believe there were other patches that were more
critical to resolving the worst symptoms, but this error was noticed
along the way. If you care to read more, you can see our downstream
kernel patches here, when we first handled this problem:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1067442
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1066984
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1069546

Unfortunately, the bug links are private (they were dealing with
partner/factory issues), so you can only glean the implicit
information from the code. And since this was over a year ago, my
memory is a little fuzzy on what exactly the source of the interrupt
storm was...

> >Fortunately we have a decent
> > (albeit time-consuming) process for rebasing our downstream patches in
> > Chrome OS kernels...
> >
>
> Do you need that patch backported to LTS kernels?

Eh, I dunno. If anything that'll just cause us merge troubles (but not
too much) on our Chrome OS kernels, which already carry my patch. But
if there are any non-Chrome-OS users of these Chromebooks (there are)
that are seeing this problem (I'm not sure), they might appreciate it.

By the way, I wonder if your patch actually deserves a "Reported-by".
I suppose I also left off Jeffy as the reporter, but it would be:

Reported-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Reported-by: Brian Norris <briannorris@chromium.org>

Brian
