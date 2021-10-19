Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A3C43401E
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 23:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhJSVHC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 17:07:02 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41619 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhJSVHC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 17:07:02 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6316D20002;
        Tue, 19 Oct 2021 21:04:47 +0000 (UTC)
Date:   Tue, 19 Oct 2021 23:04:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
Message-ID: <YW8y73hydUFeSBzj@piout.net>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
 <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
 <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
 <YW8E6oeIoRdpmPL8@piout.net>
 <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 22:12:09+0300, Sam Protsenko wrote:
> > It would be better to pass the proper values because else nobody will
> > ever come back and fix it (hence why I didn't move that driver to
> > devm_rtc_register_device yet).
> >
> 
> Krzysztof, do you have by chance the doc for different SoCs supported
> by S3C RTC driver? I can implement proper values for min/max range for
> each SoC, as Alexandre asked, by adding those to driver data. But I
> need max year register value (100, 1000, etc) for each of those chips:
> 
>   - "samsung,s3c2410-rtc"
>   - "samsung,s3c2416-rtc"
>   - "samsung,s3c2443-rtc"
>   - "samsung,s3c6410-rtc"
>   - "samsung,exynos3250-rtc"
> 
> For example Exynos850 TRM states that BCDYEAR register has [11:0] bits
> for holding the year value in BCD format, so it's 10^(12/4)=1000 years
> max.
> 

And the question will be whether time is contiguous over this period. A
very common thing is that the RTC will think that years divisible by 100
are not leap years, even if the register accepts higher values. This
makes it work for 2000 but fails in 2100.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
