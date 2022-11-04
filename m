Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95535619328
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 10:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiKDJJ6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Nov 2022 05:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiKDJJ5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Nov 2022 05:09:57 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A332B1
        for <linux-rtc@vger.kernel.org>; Fri,  4 Nov 2022 02:09:55 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 41D05C000D;
        Fri,  4 Nov 2022 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667552993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b3Tkig9iISCY1nujx73bJa+ve4f6Qz3gHcxkx2aL6q8=;
        b=kXVS5N4CJNgZ8fwbUVGIVx5ggSIcLbFCaeQKtatVHuvkDvdhV2nAf9fLzVompDIX8O+Zir
        sHslLjAxAkSugYFhBRc8e0sR+b9wPWr5CxIezTwYvUaDFxu2UhCO4tNxwIaw6BUOC/ZIn9
        himI9WKQTSyiKhkmUYf8kCqx13CIz38tFGYi1xw05XhsMo5Z5cVTYZDmUddKkT4Y1D6Atd
        zGhd+UcHsnUOz95SXpBPum/xPv2+M80dYApseVGjnZLnHj+7mteCYrf+Ubhko00NGydQ7o
        ajbJy4mkWKqpV/qAgujdA8jPAZ3whXA2/P3OzvbhN2/MdfkUfoRDj3Z80C3xLw==
Date:   Fri, 4 Nov 2022 10:09:52 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Trent Piepho <tpiepho@impinj.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] rtc: snvs: Allow a time difference on clock register
 read
Message-ID: <Y2TW4IRgyI0I1Cs0@mail.local>
References: <20221103111309.211915-1-francesco@dolcini.it>
 <Y2RAbLzvNJDRocgZ@mail.local>
 <Y2TRDdCc+kl/J3DO@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2TRDdCc+kl/J3DO@francesco-nb.int.toradex.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/11/2022 09:45:01+0100, Francesco Dolcini wrote:
> On Thu, Nov 03, 2022 at 11:27:56PM +0100, Alexandre Belloni wrote:
> > On 03/11/2022 12:13:09+0100, Francesco Dolcini wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > 
> > > On an iMX6ULL the following message appears when a wakealarm is set:
> > > 
> > > echo 0 > /sys/class/rtc/rtc1/wakealarm
> > > rtc rtc1: Timeout trying to get valid LPSRT Counter read
> > > 
> > > This does not always happen but is reproducible quite often (7 out of 10
> > > times). The problem appears because the iMX6ULL is not able to read the
> > > registers within one 32kHz clock cycle which is the base clock of the
> > > RTC. Therefore, this patch allows a difference of up to 320 cycles
> > > (10ms). 10ms was chosen to be big enough even on systems with less cpu
> > > power (e.g. iMX6ULL). According to the reference manual a difference is
> > > fine:
> > > - If the two consecutive reads are similar, the value is correct.
> > > The values have to be similar, not equal.
> > > 
> > > Fixes: cd7f3a249dbe ("rtc: snvs: Add timeouts to avoid kernel lockups")
> > > Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Also, your SoB needs to match the sender address.
> 
> I'll fix it.
> 
> However there is something that I do not fully understand and I thought
> it was not strictly required when forwarding patches like I just did.
> 
> How do you handle the very common case in which the patch author is the
> corporate email address, but the email sender is a private one?
> 
> Normally you have:
>  - sender me@personal.example.com
>  - first line of the email From: me@company.example.com
>  - SoB: me@company.example.com
> 
> with that the email sender does not match the last sob, but this is very
> common, see for example https://lore.kernel.org/all/20220705085825.21255-1-max.oss.09@gmail.com/
> 
> Should we have an additional
>  - sob me@personal.example.com
> 
> Therefore having 2 sob by the same individual, but with 2 different email
> addresses?

I would simply drop the company one if they are not able to provide you
with a working email.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
