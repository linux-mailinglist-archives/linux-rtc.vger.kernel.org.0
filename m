Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6AE30B16F
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 21:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbhBAUKR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 15:10:17 -0500
Received: from mail.skyhub.de ([5.9.137.197]:36740 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232704AbhBAUKO (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 1 Feb 2021 15:10:14 -0500
Received: from zn.tnic (p200300ec2f06fe00e55f3102cc5eb27e.dip0.t-ipconnect.de [IPv6:2003:ec:2f06:fe00:e55f:3102:cc5e:b27e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 71B651EC0323;
        Mon,  1 Feb 2021 21:09:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1612210171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=O13Y80dsRADNdOgEp6MuJ+UNlOPBi29Lc1Rx4caynmQ=;
        b=mNfTRgrxKcOyWKsLoi+gmOn3CN46Myo9QNdMbrfHEm3pBElbXx4MdzC3pir8oqD3GIGnoQ
        GbWgSXK6O6Z+Bo39vt096jJfZLOZKqFR5xUsomEpenFy0TTF6m7M7GzelW+ZXTN6q30eEe
        m9x017vfhC3rvB/yN+ClaxTf/47ngRE=
Date:   Mon, 1 Feb 2021 21:09:25 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        Dirk Gouders <dirk@gouders.net>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
Message-ID: <20210201200925.GA20521@zn.tnic>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zh0nbnha.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Feb 01, 2021 at 08:24:17PM +0100, Thomas Gleixner wrote:
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

FWIW:

Reported-by: Borislav Petkov <bp@suse.de>
Tested-by: Borislav Petkov <bp@suse.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
