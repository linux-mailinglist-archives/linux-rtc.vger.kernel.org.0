Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE28730B07A
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 20:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhBATjg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 14:39:36 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:37647 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhBATjf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 14:39:35 -0500
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4A8C3240006;
        Mon,  1 Feb 2021 19:38:47 +0000 (UTC)
Date:   Mon, 1 Feb 2021 20:38:46 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        Dirk Gouders <dirk@gouders.net>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
Message-ID: <20210201193846.GD1196852@piout.net>
References: <20201206220541.594826678@linutronix.de>
 <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
 <871re7hlsg.fsf@nanos.tec.linutronix.de>
 <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
 <87y2gfg18p.fsf@nanos.tec.linutronix.de>
 <87tur3fx7w.fsf@nanos.tec.linutronix.de>
 <ghft2hwevu.fsf@gouders.net>
 <877dnrc2sv.fsf@depni.sinp.msu.ru>
 <8735yfd2q4.fsf@nanos.tec.linutronix.de>
 <87zh0nbnha.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zh0nbnha.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/02/2021 20:24:17+0100, Thomas Gleixner wrote:
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
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

I'm still fine with that going through your tree.

Thanks for this work I do hope this will be the last issue...

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
