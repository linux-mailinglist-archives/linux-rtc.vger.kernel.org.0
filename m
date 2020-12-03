Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CCA2CE1E7
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 23:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgLCWh3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 17:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbgLCWh3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 17:37:29 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C89C061A4F
        for <linux-rtc@vger.kernel.org>; Thu,  3 Dec 2020 14:36:49 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id h20so3791724qkk.4
        for <linux-rtc@vger.kernel.org>; Thu, 03 Dec 2020 14:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n+97jptFEMRv4SKpUS0MUnQeAhF1sgMlf/u8Sx4ysb0=;
        b=nrp2QrBeU0OIH8tS1pFpUqs4G9zMLTXGkOv+LVdmeiBgUKhSGhM2kuiYXxsmGP3VLL
         UFOt0T7y0grJEcM/b/cv3Ge4zNrd+h310t6VZqZxT8gohQQEAWyJrPwOJRw6uNTR507y
         6kAag9IcNObAtxH5JTAzg86jb+sDh6lQmvxMpOKP1VTnp4SwV6dLh/cumpdX3+gjUTXc
         TqL9WzY1dIo3mwFGu9zbcQmq8VVd+yA07jUUWTwBlwzJ9h7dxZ8Hq+pfB2eABQwhqRaf
         qs97fn86wxVa6kOu+GWO0Ved3bRBMmOAjOf/kAtGNCFCWaiEEDacJUlEtQZgGjOFza2Q
         pI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n+97jptFEMRv4SKpUS0MUnQeAhF1sgMlf/u8Sx4ysb0=;
        b=DYeYbtbHT7HjUDasuqofStgfvAXBI3ZUbnRr9NStPu7BZklnnQCGnzRbZ66NNCPhoO
         agEZIA2sG8XjUpn4FExPGX02EU8h08Agg+SKfGnVsjPfCe/k0OupW4dLZNd8nYdSUa01
         MizWkrxJ+70nm932KdnBZrxkoA6sGv1Oa+Gmxhwa9nNxGbRzXTowNsOBvmg3EMC9PXVw
         lUfgnD92EjzYV5XpihZ0DiOFUuZBq0A7GrhgWulhrAlL6bLYx6wLxNZ6W6bhgwjJRet9
         XQStG0hgST6dNkbBSUO6YAOX+XKCy/CVjSpN91WbkozdKv4BYDnOsbJXpguxLtebiI+k
         xp+g==
X-Gm-Message-State: AOAM531KRc9VNVxBzAxcrHFfV6LXtaVISAA0k60EQ5ey47O2if1wRn15
        Lh0BzT5LQQpp00n/RTbliu+0MQ==
X-Google-Smtp-Source: ABdhPJwhsCbaiPBl0GDMrlnd1PMb8OGmJcQdgkj0jg08uFEU7R2621CBoRT9x2H1NXURQj3A2pTk0Q==
X-Received: by 2002:a37:a8c5:: with SMTP id r188mr5248158qke.83.1607035008230;
        Thu, 03 Dec 2020 14:36:48 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id y192sm3170126qkb.12.2020.12.03.14.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 14:36:47 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kkxDS-005eM7-EI; Thu, 03 Dec 2020 18:36:46 -0400
Date:   Thu, 3 Dec 2020 18:36:46 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203223646.GA1335797@ziepe.ca>
References: <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnxybmqx.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03, 2020 at 10:31:02PM +0100, Thomas Gleixner wrote:
> On Thu, Dec 03 2020 at 22:05, Thomas Gleixner wrote:
> > On Thu, Dec 03 2020 at 12:16, Jason Gunthorpe wrote:
> > So now we have two options to fix this:
> >
> >    1) Use a negative sync_offset for devices which need #1 above
> >       (rtc_cmos & similar)
> >
> >       That requires setting tsched to t2 - abs(sync_offset)
> >
> >    2) Use always a positive sync_offset and a flag which tells
> >       rtc_tv_nsec_ok() whether it needs to add or subtract.
> >
> > #1 is good enough. All it takes is a comment at the timer start code why
> > abs() is required.
> >
> > Let me hack that up along with the hrtimer muck.
> 
> That comment in rtc.h makes me cry:
> 
> 	/* Number of nsec it takes to set the RTC clock. This influences when
> 	 * the set ops are called. An offset:
> 	 *   - of 0.5 s will call RTC set for wall clock time 10.0 s at 9.5 s
> 	 *   - of 1.5 s will call RTC set for wall clock time 10.0 s at 8.5 s
> 	 *   - of -0.5 s will call RTC set for wall clock time 10.0 s at 10.5 s
> 	 */
> 
> Setting the wall clock time 10.0 at 10.5 is only possible for time
> traveling RTCs. It magically works, but come on ...

No tardis required. You can think of storing to a RTC as including a
millisecond component, so the three examples are: 10.0 stores 9.5,
10.0 stores 8.5, 10.0 stores 10.5.

It was probably included due to cmos, either as a misunderstanding
what it does, or it does actually store 10.5 when you store 10.0..

Jason
