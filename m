Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9732CDF6D
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 21:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgLCULO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 15:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgLCULN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 15:11:13 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBF1C061A4F
        for <linux-rtc@vger.kernel.org>; Thu,  3 Dec 2020 12:10:33 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id v11so2302505qtq.12
        for <linux-rtc@vger.kernel.org>; Thu, 03 Dec 2020 12:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=19F8C1TBzS2ilKbChch8R1U1D631baLIUMtRl/hLoag=;
        b=YzUXB+Qw8kAAw9JNsQTRIo32gyXsZXIOS/QZtyaqxnozITvvhspMd0cT9b2xKI/qU8
         S0J7JjMOCvd3AAssKY6xJhBNRKgx1J8DgJTB2W466txaZSYRsDcOfxhYacDRLzixMYcT
         qDQwQlMLSJMa/H4KMb1d0G3RUqrB918TJzCwx8662oAtsti5TOaEMF8p8I5AcO4VoC18
         HcP0A/ZGYQzCNV6urYLdzkn597LwNKZg47cZndou3aKR0qzVYoo9qIGWVKMWOoNk3PqL
         1yM4eZqsO3XjrToh87Y2C1GIsmtvys5dIgLVZjzoE9AccMOCn2rs/uPZ0Cvw3nEIAcbn
         a+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=19F8C1TBzS2ilKbChch8R1U1D631baLIUMtRl/hLoag=;
        b=X5DHeebe2bEbtYBriySRXjgjM2mazmqaWZAwsMy7Mvd2Qt2TCMAd3SN0iFJiloqQkb
         BdkSJ3jtwiqXMkOPEJJhhDw/1kTJAZ8SI74rnIlUm3HOxuw4vNq9oSEDbFiV1jIZPpqE
         OSpQRsAWHMsHMZJH8Y8ajD/oW5TTd5RU7D3u9tsZ+JsTOWcTw3dnVb5f2ogdZo753CIQ
         w9FmMmGlTjHBxk0sDmCmsyNcY2CA1jScYgTTLqPPwHz4pf9OFAJ3XB3xXnr9FCLxJcO2
         RmV1u6xw/MtfVefThbeaOJySbsj2tBxoCiv3wa6Lxl1mDu7iksSQo6G9CnrtCTHug2PB
         n+wQ==
X-Gm-Message-State: AOAM532yuHtN8Q6QSHMiAwkUiZDTZaaN++KT3QaQqZk5haRFSABNoQBf
        wrr5SEHX5tvo1Us91FxRwr98PYb21YBixQ==
X-Google-Smtp-Source: ABdhPJxdW5jHNkHkOUUokYG75B90dE0vOuBurhCtqT9DeBoWb8oeEOYbtdiXtn9JjTrE4lWGGNPd4Q==
X-Received: by 2002:ac8:678d:: with SMTP id b13mr5205754qtp.332.1607026232532;
        Thu, 03 Dec 2020 12:10:32 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id o21sm2817783qko.9.2020.12.03.12.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 12:10:31 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kkuvu-005bne-T7; Thu, 03 Dec 2020 16:10:30 -0400
Date:   Thu, 3 Dec 2020 16:10:30 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203201030.GB1317829@ziepe.ca>
References: <20201201173540.GH5487@ziepe.ca>
 <87mtywe2zu.fsf@nanos.tec.linutronix.de>
 <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <20201203155249.GT5487@ziepe.ca>
 <20201203160753.GB7535@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203160753.GB7535@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03, 2020 at 05:07:53PM +0100, Alexandre Belloni wrote:
> On 03/12/2020 11:52:49-0400, Jason Gunthorpe wrote:
> > On Thu, Dec 03, 2020 at 03:10:47AM +0100, Alexandre Belloni wrote:
> > 
> > > IIRC, used in conjunction with rtc_hctosys which also adds
> > > inconditionnaly 500ms this can ends up with the system time
> > > being one second away from the wall clock time which NTP will take quite
> > > some time to remove.
> > 
> > I can't remember the details, but this was not the intention. 
> > 
> > As long as systohc and hctosys exist then the design goal of rtclib
> > should be to provide sub-second accuracy on the round trip of time
> > through the RTC.
> > 
> > Otherwise what is the point?
> 
> hctosys never had a sub second accuracy because there is no way to
> accurately read the rtc time without being ready to wait up to a
> second.

Yes, I know. I was talking about a goal..

If that is not the goal then just delete it all and update the docs
that userspace needs to deal with all of this and the kernel stuff
isn't supposed to be useful.

Jason
