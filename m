Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C3E4F5C22
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 13:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiDFLWb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Apr 2022 07:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiDFLWD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Apr 2022 07:22:03 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62BC1FE552;
        Wed,  6 Apr 2022 00:44:03 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5872FFF80A;
        Wed,  6 Apr 2022 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649231042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KP8PsC70GFt4t1aynJ4Y0eCjqH2ZoNYER5sI3JjZX6o=;
        b=QaExUIMfE6CrWTc+DlvjTx1ugmWXWT1I4xg2XTUPBY2oDu8Ka7u99dO6n5JwJEuFGIn9QK
        EcJiJWB5YfoUpcXDAHtT7lcLmXSuL+oh8owrzPCI33fvwteKyaaxJiUBWgbObokGr21NNp
        PTyIIQil+7UD6gPxHd+MNqw+a77MpoLq+H3aq13k5+aZfbcX+QgtRykKG9kdaBMvs/B/66
        LOduNwuM2YogiGLYQ7HJS1ZAQlMPOXnky+4PxnI+l4IfzKjxbpAyUMMGmsuVDqLLbDpN3Y
        bR3pnOT9lVFlFrebQPmBaSBK83216aLjFd7J3uw1eIhugxc6F7UWyn8Pr2X7JA==
Date:   Wed, 6 Apr 2022 09:43:54 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
Message-ID: <20220406094354.7d50f23e@xps13>
In-Reply-To: <20220406090004.230b9b94@windsurf>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
        <20220405184716.1578385-3-miquel.raynal@bootlin.com>
        <20220406090004.230b9b94@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

Hi Thomas,

thomas.petazzoni@bootlin.com wrote on Wed, 6 Apr 2022 09:00:04 +0200:

> Hello Miqu=C3=A8l,
>=20
> On Tue,  5 Apr 2022 20:47:11 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > +	spin_lock_irqsave(&sysctrl_priv->lock, flags); =20
>=20
> Taking a lock here...
>=20
> > +
> > +	if (enable) {
> > +		val =3D readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> > +		val &=3D ~R9A06G032_SYSCTRL_PWRCTRL_RTC_RST;
> > +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> > +		val |=3D R9A06G032_SYSCTRL_PWRCTRL_RTC_CLKEN;
> > +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> > +		val |=3D R9A06G032_SYSCTRL_PWRCTRL_RTC_RSTN_FW;
> > +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> > +		val &=3D ~R9A06G032_SYSCTRL_PWRCTRL_RTC_IDLE_REQ;
> > +		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
> > +		val =3D readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRSTAT_RTC);
> > +		if (val & R9A06G032_SYSCTRL_PWRSTAT_RTC_IDLE)
> > +			return -EIO; =20
>=20
> And forgetting to release it here in the error case.

Right, I'll fix it.

Thanks!
Miqu=C3=A8l
