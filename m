Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146B634DCBB
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Mar 2021 02:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhC3AC3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 29 Mar 2021 20:02:29 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38497 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhC3ACH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Mar 2021 20:02:07 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id EBE6F100002;
        Tue, 30 Mar 2021 00:02:05 +0000 (UTC)
Date:   Tue, 30 Mar 2021 02:02:05 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
Message-ID: <YGJqfVFVb7Z1LBTu@piout.net>
References: <YFClVBShBuy9/VPY@piout.net>
 <CGME20210316180430eucas1p1a3cb26f40772b0af75782ff84908d731@eucas1p1.samsung.com>
 <dleftjblbjc6w1.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <dleftjblbjc6w1.fsf%l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/03/2021 19:04:14+0100, Lukasz Stelmach wrote:
> OK, you are right. The problem seems to be elsewhere.
> 
> How about this scnario? We call rtc_update_irq_enable(). We read rtc
> with __rtc_read_time() and calculate the alarm time. We get through
> rtc_timer_enqueue() and down to __rtc_set_alarm(). We loose the race
> condition (I can do it, I've got really slow connection to DS3231) and
> we return -ETIME from __rtc_set_alarm()
> 
>     if (scheduled <= now)
>         return -ETIME;
> 
> and 0 from rtc_timer_enqueue() and the very same zero from
> rtc_update_irq_enable(). The caller of ioctl() thinks they can expect
> interrupts when, in fact, they won't receive any.
> 
> The really weird stuff happens in rtc_timer_do_work(). For the timer to
> be dequeued __rtc_set_alarm() needs to return EINVAL three times in a
> row. In my setup this doesn't happen and the code keeps running loops
> around "reporogram" and "again" labels.
> 
> With my patch we never risk the above race condition between
> __rtc_read_time() in rtc_update_irq_enable() and the one in
> __rtc_set_alarm(), because we know rtc doesn't support alarms before we
> start the race. In fact there is another race between __rtc_read_time()
> and actually setting the alarm in the chip.
> 
> IMHO the solution is to introduce RTC_HAS_ALARM flag for struct
> rtc_device and check it at the very beginning of __rtc_set_alarm() the
> same way it is being done in ds1337_set_alarm(). What are your thoughts?
> 

I did introduce RTC_FEATURE_ALARM for that in v5.12. I'm sending patches
that are not well tested but should solve your issue.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
