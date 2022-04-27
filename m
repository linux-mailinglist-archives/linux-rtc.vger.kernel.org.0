Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A122511CD7
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Apr 2022 20:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240187AbiD0Pq1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Apr 2022 11:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240232AbiD0Pq1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Apr 2022 11:46:27 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD073B3C7
        for <linux-rtc@vger.kernel.org>; Wed, 27 Apr 2022 08:43:12 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 613231C000E;
        Wed, 27 Apr 2022 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651074182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3AxCeZdws5PLSMjseQkyUYQQyjWckmkImOz0yLvcOlo=;
        b=WLBwWEmQ2Ya1+d7uzVOV3d1FyKPgc/3VXVh8ugQjy4xuka6dwA9zRHoOPlwjnqyY/sF6Pl
        Zw/sQjAxg4EPEmPBUzwGaA6m8TAEXoLgeg6WmRlLThUn2AHrCJ0KcMnaNyx0dwg7OyQ7Ql
        NhJ2vYYEnLRanFGtTYrXlgNFwiOpr/gnteBmLIDjJ2x9ndSPsCQmvaCmZlmQ7ib4Gd2z1R
        g+F2lFQ6w0YCZ92U823YOOmvM20VCnZXgnO19sccr6qv85TFkbe01rSveqf2Et5OnGO9sl
        Wrlksr+vb5ASvf/IaALA2Zs575HXZ3cG+aLK5H1sozro/ARD/iWXIUDGVq6HuQ==
Date:   Wed, 27 Apr 2022 17:42:57 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 2/7] soc: renesas: rzn1-sysc: Fix the RTC hclock
 description
Message-ID: <20220427174257.48d1dd1a@xps13>
In-Reply-To: <CAMuHMdUZxAu3vTbyKYu=38OZ2QmFM6S=DrFWbp=Cwt6Ya-o9HQ@mail.gmail.com>
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
        <20220421090016.79517-3-miquel.raynal@bootlin.com>
        <CAMuHMdUZxAu3vTbyKYu=38OZ2QmFM6S=DrFWbp=Cwt6Ya-o9HQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Wed, 27 Apr 2022 17:32:58 +0200:

> On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > It needs to be un-gated, but also a reset must be released and an idle
> > flag should also be disabled.
> >
> > The driver already supports all these operations, so update the
> > description of the RTC hclock to fit these requirements.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> Thanks, will queue in renesas-devel for v5.19, with the prefix fixed.

I no longer remember why I chose this one in the first place. Should be
something like "clk: renesas: r9a06g032:".

Thanks,
Miqu=C3=A8l
