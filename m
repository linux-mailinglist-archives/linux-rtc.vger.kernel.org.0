Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFE9436C5C
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 22:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhJUU5V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 16:57:21 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46149 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhJUU5U (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 16:57:20 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E2C0E20004;
        Thu, 21 Oct 2021 20:55:02 +0000 (UTC)
Date:   Thu, 21 Oct 2021 22:55:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
Message-ID: <YXHTptyzo8oMoKk2@piout.net>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
 <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
 <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
 <YW8E6oeIoRdpmPL8@piout.net>
 <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
 <effeb83b-7923-7086-5b4f-36266015e137@canonical.com>
 <CAPLW+4=RuoT016zHotKvrNNxB_bZt4VXhZRWkGuJs22XeOpcpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLW+4=RuoT016zHotKvrNNxB_bZt4VXhZRWkGuJs22XeOpcpA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/10/2021 22:48:51+0300, Sam Protsenko wrote:
> After testing thoroughly, I can confirm that Alexandre is right about
> leap years (Exynos850 RTC treats both 2000 and 2100 as leap years).
> And it also overflows internally on 2159 year, limiting the actual
> time range at 160 years. So I'll keep that range at 100 years for all
> RTCs. As Krzysztof said, there is no practical reasons in trying to
> increase it anyway. Will send v2 soon.
> 
> What I'm curious about is RTC testing. I've found this test suite:
> 
>     tools/testing/selftests/rtc/rtctest.c
> 
> But it doesn't seem to cover corner cases (like checking leap years,
> which was discussed here). Just a thought: maybe it should be added
> there, so everyone can benefit from that? For example, I know that in
> Linaro we are running LKFT tests for different boards, so that might
> theoretically reveal some bugs. Though I understand possible
> implications: we probably don't know which ranges are supported in
> driver that's being tested. Anyway, just saying.
> 

Sorry, I should have pointed to:
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tree/rtc-range.c

This does check for the actual range of an RTC.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
