Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A617B52D5A7
	for <lists+linux-rtc@lfdr.de>; Thu, 19 May 2022 16:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239016AbiESOLY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 May 2022 10:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239575AbiESOLW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 May 2022 10:11:22 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643D65BE5E;
        Thu, 19 May 2022 07:11:21 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 854A01BF215;
        Thu, 19 May 2022 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652969479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2g7bA0zV/g2OSk9yzwSqPKk3gWbqxVR9aXtOUrO7UFc=;
        b=CKtOqRYP5tkU9T8OmBPhyEsrsdPJ9TIpz4ZwTuiEwhWkcOdt/Koigz7tezyd37Qe3eFDzh
        b0xwHn+uuJgzmB2sy9qKog4Ep45XqF/IT+BeaWsz3Vkb9/QHgMeX5+vl1Lll5Zz+wULQYY
        7OMaKX/8pnF4Ib6/pxabTb+GN2CYFamXk89o1o4Tr8Qi79jSZyyhArNlrsPEpoEVYABDBD
        lngUHQmwmplQagZ2vwZWyAseT4byM970fkX8/I8tyl794s5NutYDN8Dx9HI4bNFX7/4Umr
        Jss/R2JNVJohivquKfU38nPoWLI3VZWUJOzQVJF930fNQ7gCCsaKyCmbIH9ZZw==
Date:   Thu, 19 May 2022 16:11:16 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [bug report] rtc: rzn1: Add oscillator offset support
Message-ID: <20220519161116.6f378382@xps-13>
In-Reply-To: <YoZMjwjcDlVCG+TR@kili>
References: <YoZMjwjcDlVCG+TR@kili>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Dan,

dan.carpenter@oracle.com wrote on Thu, 19 May 2022 16:56:31 +0300:

> Hello Miquel Raynal,
>=20
> The patch be4a11cf98af: "rtc: rzn1: Add oscillator offset support"
> from May 16, 2022, leads to the following Smatch static checker
> warning:
>=20
> 	drivers/rtc/rtc-rzn1.c:302 rzn1_rtc_set_offset()
> 	warn: 'steps' 'true' implies 'steps > 0' is 'true'
>=20
> drivers/rtc/rtc-rzn1.c
>     270 static int rzn1_rtc_set_offset(struct device *dev, long offset)
>     271 {
>     272         struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
>     273         unsigned int steps;
>                 ^^^^^^^^^^^^^^^^^^
> steps is unsigned
>=20
>     274         int stepsh, stepsl;
>     275         u32 val =3D 0;
>     276         int ret;
>     277=20
>     278         /*
>     279          * Check which resolution mode (every 20 or 60s) can be u=
sed.
>     280          * Between 2 and 124 clock pulses can be added or substra=
cted.
>     281          *
>     282          * In 20s mode, the minimum resolution is 2 / (32768 * 20=
) which is
>     283          * close to 3051 ppb. In 60s mode, the resolution is clos=
er to 1017.
>     284          */
>     285         stepsh =3D DIV_ROUND_CLOSEST(offset, 1017);
>     286         stepsl =3D DIV_ROUND_CLOSEST(offset, 3051);
>     287=20
>     288         if (stepsh >=3D -0x3E && stepsh <=3D 0x3E) {
>     289                 /* 1017 ppb per step */
>     290                 steps =3D stepsh;
>     291                 val |=3D RZN1_RTC_SUBU_DEV;
>     292         } else if (stepsl >=3D -0x3E && stepsl <=3D 0x3E) {
>     293                 /* 3051 ppb per step */
>     294                 steps =3D stepsl;
>     295         } else {
>     296                 return -ERANGE;
>     297         }
>     298=20
>     299         if (!steps)
>=20
> if steps is zero return
>=20
>     300                 return 0;
>     301=20
> --> 302         if (steps > 0) { =20
>=20
> This is true.  No need to check.

'steps' should not be unsigned in order to properly carry the offset.

Do you plan to send a patch?

>=20
>     303                 val |=3D steps + 1;
>     304         } else {
>     305                 val |=3D RZN1_RTC_SUBU_DECR;
>     306                 val |=3D (~(-steps - 1)) & 0x3F;
>     307         }
>     308=20
>     309         ret =3D readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
>     310                                  !(val & RZN1_RTC_CTL2_WUST), 100=
, 2000000);
>     311         if (ret)
>     312                 return ret;
>     313=20
>     314         writel(val, rtc->base + RZN1_RTC_SUBU);
>     315=20
>     316         return 0;
>     317 }
>=20
> regards,
> dan carpenter


Thanks,
Miqu=C3=A8l
