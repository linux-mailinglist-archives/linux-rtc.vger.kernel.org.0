Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB323320245
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Feb 2021 01:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhBTAfs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Feb 2021 19:35:48 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:48263 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbhBTAfq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Feb 2021 19:35:46 -0500
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 247A4FF803;
        Sat, 20 Feb 2021 00:35:05 +0000 (UTC)
Date:   Sat, 20 Feb 2021 01:35:04 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     charley.ashbringer@gmail.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [bug report] out-of-bound array access in drivers/rtc/lib.c
 rtc_month_days
Message-ID: <YDBZOMKQreMcCEXz@piout.net>
References: <000801d706f0$31f2c370$95d84a50$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000801d706f0$31f2c370$95d84a50$@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 19/02/2021 13:51:12-0500, charley.ashbringer@gmail.com wrote:
> Hi Alessandro and Alexandre,
> Greetings, I'm a 2nd year PhD student who is interested in using UBSan to
> the kernel.
> Through some experiment, I found a out-of-bound array access in function
> rtc_month_days.
> More specifically, the through the call chain of 
> davinci_rtc_set_time/davinci_rtc_set_alarm -> convert2days ->
> rtc_month_days,
> since davinci_rtc_set_time/davinci_rtc_set_alarm are ioctl functions,
> thus the 2nd parameter, struct rtc_time *tm, is passed in purely from
> user-space which can be any value.

This part is not true and is probably what you are missing, the
userspace input is sanitized by the core, see the rtc_valid_tm calls
here:
https://elixir.bootlin.com/linux/v5.11/source/drivers/rtc/interface.c#L130
and here:
https://elixir.bootlin.com/linux/v5.11/source/drivers/rtc/interface.c#L457

> And such a value, tm->tm_mon is used directly as an index to a fixed length
> array, rtc_ydays.
> This looks very fishy to me.
> 
> Although I know that, syzkaller has applied UBSan to this driver before, and
> such a simple error cannot evade its detection, I'm still wondering if this
> is a true error,
> and more importantly, if it's not, then why, this will help me understand
> linux a lot.
> 
> Looking forward to your valued response!
> 

Regards,

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
