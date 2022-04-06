Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A0F4F5B8B
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 12:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343618AbiDFKjF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Apr 2022 06:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354978AbiDFKhj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Apr 2022 06:37:39 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC5B11A55F;
        Wed,  6 Apr 2022 00:00:13 -0700 (PDT)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9CE54FF811;
        Wed,  6 Apr 2022 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649228409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3feAVPb/IZI+Kyt7g88AM6urFegWf3gJ4WYhTcG5vQY=;
        b=IvewMjVxFUDoClFDiZPfYFb5P9w2kBwonvgmUOwfVj3KTaTmCwvn6H6Zp/sgPHHXgTXXQb
        fOqvp9ztat3Swhn2xNnIFd+X8OPj4Il0S3AEFS/xu+IsC9XwEXLSgK0+9Ff1rfXjXp4BwX
        Qs2r3m3yjzYRveSn1Lmg+Gd1kGNTAGzuSm0a15GTE66owzUxlcCzbmNA82dzpTsNUhDLL0
        aCeOpFOc5b1uqU0tJMb1pUSDWKmUSnXJcdDUnLAiRfeMdyFkq4dnPlUga1sN0lZErDvCzn
        GGZ3gvStPE4U07XzAGCyjmL7aSJpqZv6PSOh+kmetU4xmAbyMTz1VKC/ZuDEZg==
Date:   Wed, 6 Apr 2022 09:00:04 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/7] soc: renesas: rzn1-sysc: Export a function to
 enable/disable the RTC
Message-ID: <20220406090004.230b9b94@windsurf>
In-Reply-To: <20220405184716.1578385-3-miquel.raynal@bootlin.com>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
        <20220405184716.1578385-3-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Miqu=C3=A8l,

On Tue,  5 Apr 2022 20:47:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> +	spin_lock_irqsave(&sysctrl_priv->lock, flags);

Taking a lock here...

> +
> +	if (enable) {
> +		val =3D readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> +		val &=3D ~R9A06G032_SYSCTRL_PWRCTRL_RTC_RST;
> +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> +		val |=3D R9A06G032_SYSCTRL_PWRCTRL_RTC_CLKEN;
> +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> +		val |=3D R9A06G032_SYSCTRL_PWRCTRL_RTC_RSTN_FW;
> +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> +		val &=3D ~R9A06G032_SYSCTRL_PWRCTRL_RTC_IDLE_REQ;
> +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> +		val =3D readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRSTAT_RTC);
> +		if (val & R9A06G032_SYSCTRL_PWRSTAT_RTC_IDLE)
> +			return -EIO;

And forgetting to release it here in the error case.

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
