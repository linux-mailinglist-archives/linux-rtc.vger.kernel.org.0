Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD072D1B59
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Dec 2020 21:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgLGU4O (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Dec 2020 15:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgLGU4O (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Dec 2020 15:56:14 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B01C061793
        for <linux-rtc@vger.kernel.org>; Mon,  7 Dec 2020 12:55:34 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id l7so10453772qtp.8
        for <linux-rtc@vger.kernel.org>; Mon, 07 Dec 2020 12:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8YG17SSVuJgwGIpcMzN3dn+GzIecfAXIsWVzJqr65Eo=;
        b=bx3a+7hnV5LT/kqYVdT/TYircF3A/nA6pobjdaX4CXPT71sS2M93+H8cYoE6NRq6nH
         dbDaA+ipjTXrMvbdOKldYE6u2IP2g1UFYHdInsXPkJkdZspLGr1BBViziQOQ8vh4d1Au
         WzYlv0B/WATw0N7iLClEkCdZEEY8CtaH+vnF302zpZjthE27WyJGlJrel1OQT9j5goqS
         ph5UqukiK0DmRvBFW1Zrn3tZQOTFt+ck/1GGKwP3H5QNi7f3p+Brc9Ev70bpJ20oQh3d
         bKzauvvdfKl1IverjIvLAIhXIqTLFBBRrfJgka5QmvsH37rncm3b/1k0YIlv5Ehoas9R
         zF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8YG17SSVuJgwGIpcMzN3dn+GzIecfAXIsWVzJqr65Eo=;
        b=p17mddbcxjQjlhyONZT8va3EXvZwJqdARHKubeePBc4s9XQ9ljP4P6f3hVy7iFg4JY
         dqwiXJeZ+kXEYNiNLhjgp1cbvoObO1+HVuybsLwPHUq5ioJTQp0q2Exx75/k0V0ahZsU
         9xgiHxGHVorqipqMCnpy7ZZrwIFMPOsTpeLDkbNg2ERtTb/gHQzYCaoTJvWjt02odcl3
         x2492KM6Z4hUvJuuV04545Gxi3EPTTYbun2EUTphDWiA12mFTK+KjJcGc2rzvZlVTB+Z
         JKNixDuCmWjF7lIxc1YTWjgIuUzq0oC0aLHiir58D18UjEmlJcpywMAW1fuKP3SSuMjC
         fZBA==
X-Gm-Message-State: AOAM5300woy6MH1/7tpClPFKkosTK6WeL8tY0bWQ+LIY3QNyKzZhKm53
        TfquCBfyVIw1zrreibO7RSKCdQ==
X-Google-Smtp-Source: ABdhPJxOcXpXlDcawq9tZgp+iCVWNpOhONjyCg6buQCyscdYrGLh8Fiwu6M5+4B9lu3uq9sCquUVhg==
X-Received: by 2002:a05:622a:182:: with SMTP id s2mr25463960qtw.147.1607374533698;
        Mon, 07 Dec 2020 12:55:33 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id w7sm12573425qkd.92.2020.12.07.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:55:32 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kmNXg-007fV6-3E; Mon, 07 Dec 2020 16:55:32 -0400
Date:   Mon, 7 Dec 2020 16:55:32 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 4/8] rtc: core: Make the sync offset default more
 realistic
Message-ID: <20201207205532.GJ5487@ziepe.ca>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.960333166@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206220541.960333166@linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Dec 06, 2020 at 10:46:17PM +0100, Thomas Gleixner wrote:
> The offset which is used to steer the start of an RTC synchronization
> update via rtc_set_ntp_time() is huge. The math behind this is:
> 
>   tsched       twrite(t2.tv_sec - 1) 	 t2 (seconds increment)
> 
> twrite - tsched is the transport time for the write to hit the device.
> 
> t2 - twrite depends on the chip and is for most chips one second.
> 
> The rtc_set_ntp_time() calculation of tsched is:
> 
>     tsched = t2 - 1sec - (t2 - twrite)
> 
> The default for the sync offset is 500ms which means that twrite - tsched
> is 500ms assumed that t2 - twrite is one second.
> 
> This is 0.5 seconds off for RTCs which are directly accessible by IO writes
> and probably for the majority of i2C/SPI based RTC off by an order of
> magnitude. Set it to 10ms which should bring it closer to reality.
> 
> The default can be adjusted by drivers (rtc_cmos does so) and could be
> adjusted further by a calibration method which is an orthogonal problem.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>  drivers/rtc/class.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> +++ b/drivers/rtc/class.c
> @@ -201,7 +201,7 @@ static struct rtc_device *rtc_allocate_d
>  	device_initialize(&rtc->dev);
>  
>  	/* Drivers can revise this default after allocating the device. */
> -	rtc->set_offset_nsec =  NSEC_PER_SEC / 2;
> +	rtc->set_offset_nsec =  10 * NSEC_PER_MSEC;

So the old value is clearly wrong for CMOS, and I have a strong
feeling this was an error and it should have been -NSEC_PER_SEC/2

I have no idea if CMOS behavior or 0s behavior is more common in the
rtclib drivers, but it seems since nobody noticed the huge offset
mistake in 3 years it doesn't actually really matter.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
