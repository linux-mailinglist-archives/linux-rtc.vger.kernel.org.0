Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A92F433DBC
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 19:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhJSRul (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 13:50:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:35173 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhJSRul (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 13:50:41 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7A38E240004;
        Tue, 19 Oct 2021 17:48:26 +0000 (UTC)
Date:   Tue, 19 Oct 2021 19:48:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
Message-ID: <YW8E6oeIoRdpmPL8@piout.net>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
 <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
 <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 19:35:26+0300, Sam Protsenko wrote:
> On Tue, 19 Oct 2021 at 19:22, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> >
> > On 19/10/2021 18:17, Krzysztof Kozlowski wrote:
> > > On 19/10/2021 15:17, Sam Protsenko wrote:
> > >> This RTC driver only accepts dates from 2000 to 2099 year. It starts
> > >> counting from 2000 to avoid Y2K problem,
> > >
> > > 1. Where is the minimum (2000) year set in the RTC driver?
> >
> > Ah, indeed. I found it now in the driver.
> >
> > >
> > >> and S3C RTC only supports 100
> > >
> > > On some of the devices 100, on some 1000, therefore, no. This does not
> > > look correct.
> >
> > That part of sentence is still incorrect, but change itself makes sense.
> > Driver does not support <2000.
> >
> 
> Driver itself does not allow setting year >= 2100:
> 
> <<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
>     if (year < 0 || year >= 100) {
>         dev_err(dev, "rtc only supports 100 years\n");
>         return -EINVAL;
>     }
> <<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
> 
> Devices might allow it, so the commit message phrasing is incorrect
> and should be replaced, yes. But the code should be correct. Should I
> send v2 with fixed commit message?
> 

It would be better to pass the proper values because else nobody will
ever come back and fix it (hence why I didn't move that driver to
devm_rtc_register_device yet).

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
