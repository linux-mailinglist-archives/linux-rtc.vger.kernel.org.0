Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DD62D1B8C
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Dec 2020 22:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgLGU7v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Dec 2020 15:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgLGU7v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Dec 2020 15:59:51 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47875C061749
        for <linux-rtc@vger.kernel.org>; Mon,  7 Dec 2020 12:59:05 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id 4so7255664qvh.1
        for <linux-rtc@vger.kernel.org>; Mon, 07 Dec 2020 12:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bs1pNw1TpBQF5RUuJZRYk30Ml/bCx749DByttaYNFPU=;
        b=YcRQbgFRZCI9i/ib4FNHbnXr57ZA16t6cWxA32yn/RtRpCF8NuSMugoZsjIw8R6vpG
         vnUEVHvKhkqDUd3mNAfksdrFSjgG+gU+AWRFrs06mODWssMJLp+D6ZYUkWfuXSP25Auk
         5tyIMilDGRelBvYYZhsCPv5wzh+93Wq/0LGSRgy2oeLezsJLRfFICEMdffJuVopraTau
         7FMMvFYSZjRhb0ukRtEIFmwwC0EFRqNs5+oSRRxPFt6kiztQiUEkkEqcEik5nuXmqeR8
         FBCnRBXjiPRaxwxzHWW7HjcF1r2Syv9VDwgxhHIKdJwCi1KfFXYih2gAdbvhKlrZozcB
         YjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bs1pNw1TpBQF5RUuJZRYk30Ml/bCx749DByttaYNFPU=;
        b=Q6kRsR0mtqdExPGdHgVCij4rh1VAKV3BYiTdjINdtPrIDichqGL08QSN18OrTrywjt
         IZsTat2pn6KMcPQjuqj5IkjRsZjCrOpe1yRCSgWuxQ0P8iY671YunqG0L+svYXcayxjR
         p72VhxRgobggh41fWdQXZFUQjXKVj6FCG+6iNX9xbtFrZsSAA+JN3FEkxiHMq7c3cJeY
         rNyZ8G9RPUEk3BeclSiUa8tnt67ndPMWMlPO44m21cPpNYdvUXscqnopEhfmMOUImN4k
         LrLMBwt/dowRhprED4kS3Nskj89+D9233mHw4K4Bo+NfY2gAlVDRBRbxQmGrSGFW0Jme
         y1vQ==
X-Gm-Message-State: AOAM531x2OwWwhX11/+hS5G5xr9vHlqmVFO6Al2s3d/H6e9H9gkZoAxf
        a8V278e29qCT/nSs1ruzCH3mdQ==
X-Google-Smtp-Source: ABdhPJzZQM0V4XFZLUViuvjzkLryp89Lx7sJA0+Q2aEUtAmg2zm4ikASI2hUZasgSyNnrBZGnok0qw==
X-Received: by 2002:ad4:4ee3:: with SMTP id dv3mr21556629qvb.58.1607374744507;
        Mon, 07 Dec 2020 12:59:04 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id k26sm4941155qtb.41.2020.12.07.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:59:03 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kmNb5-007fYV-6o; Mon, 07 Dec 2020 16:59:03 -0400
Date:   Mon, 7 Dec 2020 16:59:03 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 5/8] ntp: Make the RTC synchronization more reliable
Message-ID: <20201207205903.GK5487@ziepe.ca>
References: <20201206214613.444124194@linutronix.de>
 <20201206220542.062910520@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206220542.062910520@linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Dec 06, 2020 at 10:46:18PM +0100, Thomas Gleixner wrote:
> Miroslav reported that the periodic RTC synchronization in the NTP code
> fails more often than not to hit the specified update window.
> 
> The reason is that the code uses delayed_work to schedule the update which
> needs to be in thread context as the underlying RTC might be connected via
> a slow bus, e.g. I2C. In the update function it verifies whether the
> current time is correct vs. the requirements of the underlying RTC.
> 
> But delayed_work is using the timer wheel for scheduling which is
> inaccurate by design. Depending on the distance to the expiry the wheel
> gets less granular to allow batching and to avoid the cascading of the
> original timer wheel. See 500462a9de65 ("timers: Switch to a non-cascading
> wheel") and the code for further details.
> 
> The code already deals with this by splitting the 660 seconds period into a
> long 659 seconds timer and then retrying with a smaller delta.
> 
> But looking at the actual granularities of the timer wheel (which depend on
> the HZ configuration) the 659 seconds timer ends up in an outer wheel level
> and is affected by a worst case granularity of:
> 
> HZ          Granularity
> 1000        32s
>  250        16s
>  100        40s
> 
> So the initial timer can be already off by max 12.5% which is not a big
> issue as the period of the sync is defined as ~11 minutes.
> 
> The fine grained second attempt schedules to the desired update point with
> a timer expiring less than a second from now. Depending on the actual delta
> and the HZ setting even the second attempt can end up in outer wheel levels
> which have a large enough granularity to make the correctness check fail.
> 
> As this is a fundamental property of the timer wheel there is no way to
> make this more accurate short of iterating in one jiffies steps towards the
> update point.
> 
> Switch it to an hrtimer instead which schedules the actual update work. The
> hrtimer will expire precisely (max 1 jiffie delay when high resolution
> timers are not available). The actual scheduling delay of the work is the
> same as before.
> 
> The update is triggered from do_adjtimex() which is a bit racy but not much
> more racy than it was before:
> 
>      if (ntp_synced())
>      	queue_delayed_work(system_power_efficient_wq, &sync_work, 0);
> 
> which is racy when the work is currently executed and has not managed to
> reschedule itself.
> 
> This becomes now:
> 
>      if (ntp_synced() && !hrtimer_is_queued(&sync_hrtimer))
>      	queue_work(system_power_efficient_wq, &sync_work, 0);
> 
> which is racy when the hrtimer has expired and the work is currently
> executed and has not yet managed to rearm the hrtimer.
> 
> Not a big problem as it just schedules work for nothing.
> 
> The new implementation has a safe guard in place to catch the case where
> the hrtimer is queued on entry to the work function and avoids an extra
> update attempt of the RTC that way.
> 
> Reported-by: Miroslav Lichvar <mlichvar@redhat.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Prarit Bhargava <prarit@redhat.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> ---
>  include/linux/timex.h      |    1 
>  kernel/time/ntp.c          |   90 ++++++++++++++++++++++++---------------------
>  kernel/time/ntp_internal.h |    7 +++
>  3 files changed, 55 insertions(+), 43 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
