Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054CD4FFAA1
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 17:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbiDMPvN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 11:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbiDMPvL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 11:51:11 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C6666226;
        Wed, 13 Apr 2022 08:48:48 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7A0C360009;
        Wed, 13 Apr 2022 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649864927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dUc7DZ0s5s8q5Hp7V4kZQSzl4aTwEKtCJGqudHda2mY=;
        b=H5l4NFNlJQsdB8Ss/FBLauC8vGBummdq9D+Bu9irYpQvpIHYhwDhp6meFOyLbsXThZaW4v
        fV7L6Op+QXiMZ+PQNQ6TfJfUFc4/jgHmR/5u2B+2PS1tt+IwahSk92gK2sS4xqQg0mIawT
        W2/3saE14UCRF2nEBq0bM04IkeoeI9rd/M2q9QW0ry7Bt6QJZQ2VXvPGJwRU9hIjPdq1Cj
        OT2uvWFrOy1sluYR/EcQpnAFhUAmxb2D4XZvJKYFdJau5v5lAQm5qv89696DpRZng0Du25
        KDnmT0UkW3lTnCNk86jgxjjeKpIyVUAYONe5IS/+XHg+zrWDr3tKykMmIisgJg==
Date:   Wed, 13 Apr 2022 17:48:45 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH 3/7] rtc: rzn1: Add new RTC driver
Message-ID: <Ylbw3bEc+QK4m9hX@mail.local>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
 <20220405184716.1578385-4-miquel.raynal@bootlin.com>
 <Yk1UXjTk32Vc9+/k@mail.local>
 <20220413172327.73d1fcc1@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220413172327.73d1fcc1@xps13>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquèl,

On 13/04/2022 17:23:27+0200, Miquel Raynal wrote:
> > > +static int rzn1_rtc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct rzn1_rtc *rtc;
> > > +	int ret;
> > > +
> > > +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > > +	if (!rtc)
> > > +		return -ENOMEM;
> > > +
> > > +	platform_set_drvdata(pdev, rtc);
> > > +
> > > +	rtc->clk = devm_clk_get(&pdev->dev, "hclk");
> > > +	if (IS_ERR(rtc->clk))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hclk\n");
> > > +
> > > +	rtc->base = devm_platform_ioremap_resource(pdev, 0);
> > > +	if (IS_ERR(rtc->base))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
> > > +
> > > +	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
> > > +	if (IS_ERR(rtc->rtcdev))
> > > +		return PTR_ERR(rtc);
> > > +
> > > +	rtc->rtcdev->range_max = 3178591199UL; /* 100 years */  
> > 
> > I'm not sure how you came to this value, this is 2070-09-22T05:59:59.
> > I'm pretty sure the RTC will not fail at that time. Also, the comment
> > seems fishy.
> 
> The RTC itself as no "starting point", but just a counter that can
> count up to 100. So the max range is start-year + 100 years. But at
> this point I don't yet have access to the start-year value. What's
> your advise?

The question is why is this limited to 100 years? My guess is that it
doesn't handle leap years properly if this is the case, there is only
one range that works, this is 2000-01-01 to 2099-12-31 like many other
RTCs.

You can run rtc-range from rtc-tools after removing range_max to find
out.

Cheers

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
