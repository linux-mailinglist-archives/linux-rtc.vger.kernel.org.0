Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C002F1043
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 11:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbhAKKlV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 05:41:21 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:34125 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbhAKKlV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 05:41:21 -0500
Received: by mail-ot1-f54.google.com with SMTP id a109so16470566otc.1;
        Mon, 11 Jan 2021 02:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQE92wGImoCuHGlTBsuRYfPJyJNJDeXQD1pa+O0heSQ=;
        b=k3CagimkYb5qti0xPocP9KUUcWHcx57HTW4rxNTMiDtntcJOflk9XuQSFaKrsXryQG
         VKFQdGQ2KtNcgl7UBf+xmXsHosyL7TgRxvXV/W0TL0t+bgrqheg0g8QdADQTlDAP8r0M
         pfCEOlCGoVuP1L/Bv1BeAtzDrfOvNcqwYzkgI/+wZ7CoL3SdlFBAkzy5aA1zOivBcKN8
         Z4n9bPH8RwZFO+OAdBhBrAJHbnSqKYIXPavjD9BNLEP6WGIQWcXdeZJjmi9Idv73TszC
         vbn4RpeScyaseBMScBrAFfTWQ7jFRppq0mpLVy+Kge83L6SGNRHeYhAV4Sk9Dtlej9KV
         qLAQ==
X-Gm-Message-State: AOAM531zKhywTZpLSAwkmf4zJE32isxlh+FPfxtQJIef+UvJOYLRkd12
        sBN18F/uIUWiUOCUO6/ndNC4KcpOItHbKJXTupE=
X-Google-Smtp-Source: ABdhPJw0eeT3HhWAExbemNPOr5fFXG+x/OCUxkL5CeiTn4tO82WpZyRF9+zqWH7caDpH3OcHEW0fc+4bhYFaLcEtYtw=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr10469024oth.250.1610361640322;
 Mon, 11 Jan 2021 02:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20201206214613.444124194@linutronix.de> <20201206220542.062910520@linutronix.de>
 <CAMuHMdVB9XMAaMDnKrRzkqvhFugrDGmj=00Vh5sDQT-idnA7DA@mail.gmail.com> <87lfcz7pem.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87lfcz7pem.fsf@nanos.tec.linutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Jan 2021 11:40:29 +0100
Message-ID: <CAMuHMdXQvPY_mYicjPKjDSCwdO_rP-9PJOvqD0J6=S3Opr1ycg@mail.gmail.com>
Subject: Re: [patch 5/8] ntp: Make the RTC synchronization more reliable
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Thomas,

On Mon, Jan 11, 2021 at 11:12 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, Dec 29 2020 at 20:41, Geert Uytterhoeven wrote:
> >> Reported-by: Miroslav Lichvar <mlichvar@redhat.com>
> >> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> >
> > Thanks for your patch, which is now commit c9e6189fb03123a7 ("ntp: Make
> > the RTC synchronization more reliable").
> >
> > Since this commit, the I2C RTC on the R-Car M2-W Koelsch development
> > board is accessed every two seconds.  Sticking a WARN() in the I2C
> > activation path gives e.g.
>
> Huch? Every two seconds? The timer is armed with 11 * 60 * NSEC_PER_SEC,
> which is 11 minutes. Confused....

Thanks for the hint:

    #define SYNC_PERIOD_NS (11UL * 60 * NSEC_PER_SEC)

is truncated on 32-bit platforms.

Patch sent.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
