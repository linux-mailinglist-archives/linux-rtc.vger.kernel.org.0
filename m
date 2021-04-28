Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D5036D6FF
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 14:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbhD1MIs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 28 Apr 2021 08:08:48 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:34462 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhD1MIr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 08:08:47 -0400
Received: by mail-vs1-f45.google.com with SMTP id d25so25063766vsp.1;
        Wed, 28 Apr 2021 05:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J5mBs5jaQh3wtMQmRUFFXymD4w0OFf894XaJ7i3Natc=;
        b=kjjM4UiyKtUjaPSPuq9mkwGyC4s0EH6s/udSCpBfLL6wh3VVT+iU7NrIMRx2uCf/Zg
         MWMspfVf0n9RavshI4UczMl0vktf0QXVyYrjwOq1JierNEx+t8aR4Jmq66TaA1U2blJB
         +x9A71oPpHrvCy7/OplKQT550gnylWT4zhCtgY0Dm3cICmGRhJb4uSIJJbKMv0jCP1Or
         psF4/AIxKDT1RTGyZf1GXO1632oodd7WUTB2okRKSlOUL0mlR8xbLoy77k+xyDpiyU+d
         baYQuThI5iMT/VqzFIfJLNW2BL3io0ADYNaDBWaofKy/0z10syQO/12PNxlm7b7M68y3
         9avw==
X-Gm-Message-State: AOAM531JwloVCh39t0a9BDFyaje9Dcwdkm/R6UJK0PjFxHFwwt3Jj4m4
        ZwdQEgo+sCOe5RerSovv8AgF3GVaPnZEFIPHlGI=
X-Google-Smtp-Source: ABdhPJyt7LPnKkg4RokoJwXilgPmqlDDD/Bu5PTcYsE2WO63a5OjnRGES3axOm0jQe9YJGZ21DkJc+/8VBf1Z2ktDK0=
X-Received: by 2002:a67:8745:: with SMTP id j66mr24878487vsd.18.1619611682536;
 Wed, 28 Apr 2021 05:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221430.3735147-1-laurent@vivier.eu> <20210323221430.3735147-3-laurent@vivier.eu>
 <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
In-Reply-To: <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Apr 2021 14:07:51 +0200
Message-ID: <CAMuHMdW49S_81Oip2p+yUO5YUL1-V3_K_C1WEXux7mQWcb-mKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Laurent,

On Tue, Apr 27, 2021 at 7:20 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 23/03/2021 à 23:14, Laurent Vivier a écrit :
> > This machine allows to have up to 3.2 GiB and 128 Virtio devices.
> >
> > It is based on android goldfish devices.
> >
> > Signed-off-by: Laurent Vivier <laurent@vivier.eu>

> As 5.12 has been released, is this possible to consider having this new machine in the next release?
>
> All changes are contained under arch/m68k and protected by the CONFIG_VIRT flag. This should not
> have any impact on the other m68k machines. In any case, I'll be able to maintain the machine and
> fix any problem.

Thanks for the reminder!

Please accept my apologies: I had completely forgotten about your patch.
By the time it reappeared on my radar (due to Alexandre's reply), it was
already too late for v5.13.

I have tested and reviewed your patch, great work!
I'm confident this can make v5.14, with the small nits fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
