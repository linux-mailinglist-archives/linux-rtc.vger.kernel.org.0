Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE3B45D5F4
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Nov 2021 09:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349004AbhKYIKC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Nov 2021 03:10:02 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58977 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348426AbhKYIIC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 25 Nov 2021 03:08:02 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 95E55E0010;
        Thu, 25 Nov 2021 08:04:49 +0000 (UTC)
Date:   Thu, 25 Nov 2021 09:04:49 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND v3 3/7] rtc-mc146818-lib: extract
 mc146818_do_avoiding_UIP
Message-ID: <YZ9DoQYl0JUDq7pt@piout.net>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-4-mat.jonczyk@o2.pl>
 <YZ6/GC3xouzEZmEh@piout.net>
 <1b217171-b301-f2fe-f455-9bddabe2e115@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b217171-b301-f2fe-f455-9bddabe2e115@o2.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/11/2021 06:28:45+0100, Mateusz Jończyk wrote:
> W dniu 24.11.2021 o 23:39, Alexandre Belloni pisze:
> > On 19/11/2021 21:42:17+0100, Mateusz Jończyk wrote:
> >> Function mc146818_get_time() contains an elaborate mechanism of reading
> >> the RTC time while no RTC update is in progress. It turns out that
> >> reading the RTC alarm clock also requires avoiding the RTC update (see
> >> following patches). Therefore, the mechanism in mc146818_get_time()
> >> should be reused - so extract it into a separate function.
> >>
> >> The logic in mc146818_do_avoiding_UIP() is same as in
> >> mc146818_get_time() except that after every
> >>
> >>         if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
> >>
> >> there is now "mdelay(1)".
> >>
> >> To avoid producing an unreadable diff, mc146818_get_time() will be
> >> refactored to use mc146818_do_avoiding_UIP() in the next patch.
> >>
> >> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> >> Cc: Alessandro Zummo <a.zummo@towertech.it>
> >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>
> >> ---
> >>  drivers/rtc/rtc-mc146818-lib.c | 69 ++++++++++++++++++++++++++++++++++
> >>  include/linux/mc146818rtc.h    |  3 ++
> >>  2 files changed, 72 insertions(+)
> >>
> >> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> >> index b50612ce1a6d..946ad43a512c 100644
> >> --- a/drivers/rtc/rtc-mc146818-lib.c
> >> +++ b/drivers/rtc/rtc-mc146818-lib.c
> >> @@ -8,6 +8,75 @@
> >>  #include <linux/acpi.h>
> >>  #endif
> >>  
> >> +/*
> >> + * Execute a function while the UIP (Update-in-progress) bit of the RTC is
> >> + * unset.
> >> + *
> >> + * Warning: callback may be executed more then once.
> >> + */
> >> +bool mc146818_do_avoiding_UIP(mc146818_callback_t callback, void *param)
> > mc146818_avoid_UIP would be a simpler name. 
> Right
> > Also, I'm pretty sure we can
> > avoid the mc146818_callback_t typedef
> 
> Do you mean doing something like:
> 
> bool mc146818_avoid_UIP(
> 	void (*callback)(unsigned char seconds, void *param), void *param);
> 

yes!

> Thanks for reviewing.
> 
> Greetings,
> Mateusz
> 
> >> +{
> >> +	int i;
> >> +	unsigned long flags;
> [snip]

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
