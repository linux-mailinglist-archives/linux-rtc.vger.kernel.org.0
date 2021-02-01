Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE2630B196
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 21:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBAUaz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 15:30:55 -0500
Received: from services.gouders.net ([141.101.32.176]:48616 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBAUaq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 15:30:46 -0500
Received: from localhost (ltea-047-066-000-239.pools.arcor-ip.net [47.66.0.239])
        (authenticated bits=0)
        by services.gouders.net (8.14.8/8.14.8) with ESMTP id 111KGcRB016228
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 1 Feb 2021 21:16:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
        t=1612210599; bh=OL61rVU+tFkKTJhOobzoZ+qk74fBZ06cF5QzMmY0Iu4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date;
        b=UNQeYSyg3XKkVQt6ENhYCB2/yddwGIeCkFgZLSxzlGpcDEBthzEyCzqL0RHDo2OQ6
         JjhjZvCUekLogkZSoLGsWsC5AIS9DMZf8ug+B1BRHiTtilpdj/uULG9ObWsDNnYY4N
         Yp9cYltCViB+amJhnQ3kTCSJVMbgtjpgIC/kmAPc=
From:   Dirk Gouders <dirk@gouders.net>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        =?utf-8?Q?Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn?= 
        <mic@digikod.net>, LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
In-Reply-To: <87zh0nbnha.fsf@nanos.tec.linutronix.de> (Thomas Gleixner's
        message of "Mon, 01 Feb 2021 20:24:17 +0100")
References: <20201206214613.444124194@linutronix.de>
        <20201206220541.594826678@linutronix.de>
        <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
        <871re7hlsg.fsf@nanos.tec.linutronix.de>
        <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
        <87y2gfg18p.fsf@nanos.tec.linutronix.de>
        <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net>
        <877dnrc2sv.fsf@depni.sinp.msu.ru>
        <8735yfd2q4.fsf@nanos.tec.linutronix.de>
        <87zh0nbnha.fsf@nanos.tec.linutronix.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Mon, 01 Feb 2021 21:15:01 +0100
Message-ID: <gh7dnro88q.fsf@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thomas Gleixner <tglx@linutronix.de> writes:

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

I tested V2 and it eliminates the warning, here.

Thank you,

Dirk

> ---
>  drivers/rtc/rtc-cmos.c         |    4 ++--
>  drivers/rtc/rtc-mc146818-lib.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -805,8 +805,8 @@ cmos_do_probe(struct device *dev, struct
>  
>  	spin_lock_irq(&rtc_lock);
>  
> -	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> -	if ((CMOS_READ(RTC_VALID) & 0x7f) != 0) {
> +	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
> +	if ((CMOS_READ(RTC_VALID) & 0x40) != 0) {
>  		spin_unlock_irq(&rtc_lock);
>  		dev_warn(dev, "not accessible\n");
>  		retval = -ENXIO;
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -21,8 +21,8 @@ unsigned int mc146818_get_time(struct rt
>  
>  again:
>  	spin_lock_irqsave(&rtc_lock, flags);
> -	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> -	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) != 0)) {
> +	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
> +	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x40) != 0)) {
>  		spin_unlock_irqrestore(&rtc_lock, flags);
>  		memset(time, 0xff, sizeof(*time));
>  		return 0;
