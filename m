Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE70330DA70
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 14:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhBCNBf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 08:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhBCNBC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 08:01:02 -0500
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [IPv6:2001:1600:4:17::190c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ED6C0613D6
        for <linux-rtc@vger.kernel.org>; Wed,  3 Feb 2021 05:00:15 -0800 (PST)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DW1xT4G5VzMqKBM;
        Wed,  3 Feb 2021 14:00:13 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DW1xS1HTmzlpq04;
        Wed,  3 Feb 2021 14:00:12 +0100 (CET)
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
To:     Thomas Gleixner <tglx@linutronix.de>,
        Serge Belyshev <belyshev@depni.sinp.msu.ru>
Cc:     Dirk Gouders <dirk@gouders.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.594826678@linutronix.de>
 <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
 <871re7hlsg.fsf@nanos.tec.linutronix.de>
 <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
 <87y2gfg18p.fsf@nanos.tec.linutronix.de>
 <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net>
 <877dnrc2sv.fsf@depni.sinp.msu.ru> <8735yfd2q4.fsf@nanos.tec.linutronix.de>
 <87zh0nbnha.fsf@nanos.tec.linutronix.de>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <2b5d8143-f49d-409b-49f1-556366b9d70c@digikod.net>
Date:   Wed, 3 Feb 2021 14:00:13 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <87zh0nbnha.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

FWIW, it's still OK for me.

Tested-by: Mickaël Salaün <mic@linux.microsoft.com>

On 01/02/2021 20:24, Thomas Gleixner wrote:
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
> 
