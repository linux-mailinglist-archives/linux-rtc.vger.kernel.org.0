Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913EC39C5C
	for <lists+linux-rtc@lfdr.de>; Sat,  8 Jun 2019 12:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfFHKTw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 8 Jun 2019 06:19:52 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49572 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfFHKTw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 8 Jun 2019 06:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559989187; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8NE8iJ1tXNtCj76fVN4fK098gqqNEc6CFVlZPcPldXE=;
        b=A1Tf+oKfHq5/Uxxno7gNPEu3ldLB+2ACNj3cbPZ6vJxF4HAFfkq3IcbGAf9HGqyQP+dMTo
        xZt17uQESHRZjmCsk7gx6hsjnLPkWt0/9G8ut6FF6vfoFMAYg6HwZ4q69n3wnNBudtC0aX
        x9Wgv5fqlRojyp2ZH3h1o/6kE49GjAM=
Date:   Sat, 08 Jun 2019 12:19:42 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] rtc: jz4740: Make probe function __init_or_module
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1559989182.1815.3@crapouillou.net>
In-Reply-To: <20190607155438.14342-1-paul@crapouillou.net>
References: <20190607155438.14342-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

I misunderstood what __init_or_module was for. Please ignore this patch.


Le ven. 7 juin 2019 =E0 17:54, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> This allows the probe function to be dropped after the kernel finished
> its initialization, in the case where the driver was not compiled as a
> module.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/rtc/rtc-jz4740.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index 9e7b3a04debc..a20e7dc794dd 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -303,7 +303,7 @@ static const struct of_device_id=20
> jz4740_rtc_of_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, jz4740_rtc_of_match);
>=20
> -static int jz4740_rtc_probe(struct platform_device *pdev)
> +static int __init_or_module jz4740_rtc_probe(struct platform_device=20
> *pdev)
>  {
>  	int ret;
>  	struct jz4740_rtc *rtc;
> --
> 2.21.0.593.g511ec345e18
>=20

=

