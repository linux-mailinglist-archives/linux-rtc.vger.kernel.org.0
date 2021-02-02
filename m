Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F2830B671
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 05:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhBBEXr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 23:23:47 -0500
Received: from mail-ed1-f52.google.com ([209.85.208.52]:36591 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbhBBEXo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 23:23:44 -0500
Received: by mail-ed1-f52.google.com with SMTP id d2so21425704edz.3;
        Mon, 01 Feb 2021 20:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TiS9Bb48tzkbdlH/rNiDagt6bFiH7mad+u4GBGYV4aE=;
        b=br6ns9iW0owoKF6avcvPSYjqDY9Qfq3lhhVVz/UpIJNRBLXxmGG2oT/EoMjCO5+YKq
         vuKA9bqXwHuIw0wAhQCvLQKnwzbMvWM9aWQ0wSu93djhPt05WXWmy8krWCMTidSkdOWA
         ito9UD4iio30cppCAkMkKJ9suH45UWnNNfbfbXeyFQY+KZyzLhObYzX3NbUuENfYuPv0
         xCS6gcy5MghSEC/VyT++Mv6qHKP7tUTblz8YyBFfHMKH7JRb+8gKcBVc41w69xlpViBI
         st1kS6g898t2I9sGmm3f+cdave74JhGG3Lja/ERGKyWS0CZWUHOHRjVUzgtK6LkN2m/+
         +BNA==
X-Gm-Message-State: AOAM532HRJ0C1dt6wsCaMOJmO1qVp/8rUgHO5vxvF5UzckitQaYISVt/
        5EdIjvCGpP5u7uR2UUybqiVn67cF/YNQCjraBFQRc2Wp
X-Google-Smtp-Source: ABdhPJw3T7W4aL2oifIILWsa7+b6BttYz8h88vRDEB+JbjPxw5FRx5LcCFuSSmtfr1rrRXiXuyBraC9ZazEiXbFtD+E=
X-Received: by 2002:a05:6402:3494:: with SMTP id v20mr14015815edc.146.1612239781967;
 Mon, 01 Feb 2021 20:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de>
 <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de>
 <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net> <87y2gfg18p.fsf@nanos.tec.linutronix.de>
 <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net>
 <877dnrc2sv.fsf@depni.sinp.msu.ru> <8735yfd2q4.fsf@nanos.tec.linutronix.de> <87zh0nbnha.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87zh0nbnha.fsf@nanos.tec.linutronix.de>
From:   Len Brown <lenb@kernel.org>
Date:   Mon, 1 Feb 2021 23:22:50 -0500
Message-ID: <CAJvTdK=S+FTMUWyFgHMcZ2xKJKDrjE_9a-cb5hHcBT4MvoyJxg@mail.gmail.com>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        Dirk Gouders <dirk@gouders.net>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thanks for the update, Thomas.

V1 prevented rc6 automated suspend/resume testing on all 13 of my
local machines.
V2 applied, and they are back in business.

tested-by: Len Brown <len.brown@intel.com>

On Mon, Feb 1, 2021 at 2:25 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The recent change to validate the RTC turned out to be overly tight.
>
> While it cures the problem on the reporters machine it breaks machines
> with Intel chipsets which use bit 0-5 of the D register. So check only
> for bit 6 being 0 which is the case on these Intel machines as well.
>
> Fixes: 211e5db19d15 ("rtc: mc146818: Detect and handle broken RTCs")
> Reported-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> Reported-by: Dirk Gouders <dirk@gouders.net>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: Provide the actual delta patch. Should have stayed away from
>     computers today....
> ---
>  drivers/rtc/rtc-cmos.c         |    4 ++--
>  drivers/rtc/rtc-mc146818-lib.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -805,8 +805,8 @@ cmos_do_probe(struct device *dev, struct
>
>         spin_lock_irq(&rtc_lock);
>
> -       /* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> -       if ((CMOS_READ(RTC_VALID) & 0x7f) != 0) {
> +       /* Ensure that the RTC is accessible. Bit 6 must be 0! */
> +       if ((CMOS_READ(RTC_VALID) & 0x40) != 0) {
>                 spin_unlock_irq(&rtc_lock);
>                 dev_warn(dev, "not accessible\n");
>                 retval = -ENXIO;
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -21,8 +21,8 @@ unsigned int mc146818_get_time(struct rt
>
>  again:
>         spin_lock_irqsave(&rtc_lock, flags);
> -       /* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> -       if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) != 0)) {
> +       /* Ensure that the RTC is accessible. Bit 6 must be 0! */
> +       if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x40) != 0)) {
>                 spin_unlock_irqrestore(&rtc_lock, flags);
>                 memset(time, 0xff, sizeof(*time));
>                 return 0;



-- 
Len Brown, Intel Open Source Technology Center
