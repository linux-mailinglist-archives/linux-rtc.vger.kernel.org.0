Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03014457814
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 22:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbhKSVZp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 16:25:45 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:39937 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbhKSVZo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Nov 2021 16:25:44 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 24DDB240004;
        Fri, 19 Nov 2021 21:22:40 +0000 (UTC)
Date:   Fri, 19 Nov 2021 22:20:30 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RESEND v3 0/7] rtc-cmos,rtc-mc146818-lib: fixes
Message-ID: <YZgVHi5+i4qQIdvG@piout.net>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119204221.66918-1-mat.jonczyk@o2.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Mateusz,

I'm planning to review and take them soon (early next week), I found it
was a bit late for the previous version. I'd like that to sit in
linux-next for a while a rtc-cmos is kind of sensitive ;)

On 19/11/2021 21:42:14+0100, Mateusz Jończyk wrote:
> Hello,
> 
> This patch series fixes some issues in the RTC CMOS handling code:
> 
> 1. A missing spin_lock_irq() / spin_unlock_irq() pair in cmos_set_alarm().
> 2. A failing presence check of the RTC: the clock was misdetected as
>    broken since Linux 5.11 on one of our home systems.
> 3. Do not touch the RTC alarm registers when the RTC update is in
>    progress. (On some Intel chipsets, this causes bogus values being
>    read or writes to fail silently.)
> 
> This is my first patch series, so please review carefully.
> 
> v2: Drop the last patch:
>         Revert "rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ"
> which was made obsolete by mainlining of 
> commit 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")
> 
> v3: Rework solution to problem 3 (I'd like to thank Greg KH for comment),
> drop x86 refactoring patches (I'll send them later).
> 
> Greetings,
> Mateusz
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
