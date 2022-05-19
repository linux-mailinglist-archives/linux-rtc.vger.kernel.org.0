Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F92B52D597
	for <lists+linux-rtc@lfdr.de>; Thu, 19 May 2022 16:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239079AbiESOI3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 May 2022 10:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbiESOI2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 May 2022 10:08:28 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E58260DAA;
        Thu, 19 May 2022 07:08:25 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BC5E740008;
        Thu, 19 May 2022 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652969304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+rE6gwbsgS2oLBE5ddkY8KWT/D++rFRsrz02UqzfbA0=;
        b=aPkZForcz0tz/Aw46CNMJMpI7XvW/l1HK3cHVZzSYwx8BgmXt/WrSRTNQCaITFWsy5TApt
        R7JHJ6BgTMkCohBdyZ90J93730DkNkWduvTeaXItZkRi1fUBvSaQJVGyIDwaYJv5gR+aOm
        tp3z++yjlin3TIFyM5IHKubuYsbheOYr/gaKn48ZPkwDuVm3NrOpMult+YeXWIKew2Bkl+
        /jfiCSnQmOf8HITFfEPxgNdjcMnI79x/0kK5j68cUixpXmg8yjyiKFcpOi4PAnHT54TqAa
        gZwCEygPK2HI7H/LtA7Ec8QYQ0Yxgngn60vjbhv2ViFQF6hWPFsl8wYQKQ8Gtw==
Date:   Thu, 19 May 2022 16:08:21 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Michel Pollet <michel.pollet@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: Fix error code in probe
Message-ID: <20220519160821.14230810@xps-13>
In-Reply-To: <YoZMg1dmHHSJEfE9@kili>
References: <YoZMg1dmHHSJEfE9@kili>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Dan,

dan.carpenter@oracle.com wrote on Thu, 19 May 2022 16:56:19 +0300:

> There is a copy and paste error so this code returns the wrong variable.
>=20
> Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")

The Fixes here will point to an unknown id once pulled by Linus.

Otherwise

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rtc/rtc-rzn1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 0b4bf6e43464..ff49cedd98b8 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -348,7 +348,7 @@ static int rzn1_rtc_probe(struct platform_device *pde=
v)
> =20
>  	rtc->rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc->rtcdev))
> -		return PTR_ERR(rtc);
> +		return PTR_ERR(rtc->rtcdev);
> =20
>  	rtc->rtcdev->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
>  	rtc->rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;


Thanks,
Miqu=C3=A8l
