Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA9444EF25
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 23:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbhKLWWE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Nov 2021 17:22:04 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50789 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhKLWWE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Nov 2021 17:22:04 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C4A6560007;
        Fri, 12 Nov 2021 22:19:11 +0000 (UTC)
Date:   Fri, 12 Nov 2021 23:19:11 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] rtc: s3c: S3C driver improvements
Message-ID: <YY7oX8k3dTH6n5lp@piout.net>
References: <20211021202256.28517-1-semen.protsenko@linaro.org>
 <163502632457.411308.6365977083733513077.b4-ty@bootlin.com>
 <CAPLW+4mBKH_-A5rWGKgpA=r8as6UqhmHf6h1DRg0fEY9jSmJQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLW+4mBKH_-A5rWGKgpA=r8as6UqhmHf6h1DRg0fEY9jSmJQA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/11/2021 19:05:06+0200, Sam Protsenko wrote:
> On Sun, 24 Oct 2021 at 00:58, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On Thu, 21 Oct 2021 23:22:53 +0300, Sam Protsenko wrote:
> > > While working on Exynos850 support (where this driver works fine in its
> > > current state), I've stumbled upon some minor issue. This is the effort
> > > to fix those.
> > >
> > >   * [PATCH 1/3]: moves S3C RTC driver to newer API usage
> > >     (no functional changes)
> > >   * [PATCH 2/3]: refactoring/cleanup (no functional changes)
> > >   * [PATCH 3/3]: adds time range, as [PATCH 1/3] made it possible
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> 
> Hi Alexandre,
> 
> Just want to check if this series is going to be merged during current
> merge window, or is it scheduled for the next one?
> 

This is now pulled by Linus.

> Thanks!
> 
> > [1/3] rtc: s3c: Remove usage of devm_rtc_device_register()
> >       commit: dba28c37f23a09fc32dbc37463ddb2feb3886f98
> > [2/3] rtc: s3c: Extract read/write IO into separate functions
> >       commit: e4a1444e10cbda2892a4ea7325ef5efa47c75cfb
> > [3/3] rtc: s3c: Add time range
> >       commit: a5feda3b361e11b291786d5c4ff86d4b9a55498f
> >
> > Best regards,
> > --
> > Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
