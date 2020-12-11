Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551402D72C4
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 10:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405596AbgLKJYT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 04:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404401AbgLKJYM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Dec 2020 04:24:12 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD096C0613CF;
        Fri, 11 Dec 2020 01:23:31 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607678610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/64yfk/f7iWtTjLUC4NhqoHGM4ucIwe7KEQDNM7rmxQ=;
        b=BFXK24VpgfEg9bCn3Yd+M/huO0MTAeHWg5wAr6dEpsgJVi2Ot7fxcxVs51AYQTlOvH6ld4
        XwS3uK8FTXl8ZIHvdtBOmIwWNF1iT+WwiRZeIO6QHKc+nBLE1HXeIW/4GNAWj4ehrtz5l4
        WVuRJPm/Tkj80uqJkrceCbcQFGvx/1wfbeDm02Zei738yVkYhNePs7Sfc+M/X4nYl5oBOF
        GaJL3LBmujpZ14IDewiy88Bacf8AbHeROrd3tgkXSeaqtzHIsRdxyFXDiHwAuyx4u24cWD
        6YG9jcGjYJMLEKpGhh+XrIdIAwb72qAcnGCdFF93gJxf3FzH0uL+gDZnUbvaNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607678610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/64yfk/f7iWtTjLUC4NhqoHGM4ucIwe7KEQDNM7rmxQ=;
        b=+aEWTKLPXJldoSe6edlC3FByXn5fdyrTXTK/3FgBy4hs32EwD4wB0A4O5GMzkH6FxD6fIZ
        ilFI6ge3FVTI6YCw==
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 8/8] ntp: Consolidate the RTC update implementation
In-Reply-To: <20201207210505.GM5487@ziepe.ca>
References: <20201206214613.444124194@linutronix.de> <20201206220542.355743355@linutronix.de> <20201207210505.GM5487@ziepe.ca>
Date:   Fri, 11 Dec 2020 10:23:29 +0100
Message-ID: <877dpoitm6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Dec 07 2020 at 17:05, Jason Gunthorpe wrote:
> On Sun, Dec 06, 2020 at 10:46:21PM +0100, Thomas Gleixner wrote:
>>  static void sync_hw_clock(struct work_struct *work)
>>  {
>> +	static unsigned long offset_nsec = NSEC_PER_SEC / 2;
>
> A comment here explaining this is the default: because the platform is
> assumed to use CMOS, and by the way, this whole thing is obsolete
> don't use it, seems appropriate..

Will add something like that.

> The time split is clearer if you think of it from a bus/datasheet
> perspective, less clear if you try to measure the system directly, eg
> from an alarm. But, I think this  has a better chance of some rtclib
> driver authors to fill in the datasheet value at least.

That's the hope. You know hope dies last...

Thanks,

        tglx

