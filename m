Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14806AB808
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Mar 2023 09:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjCFIMy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Mar 2023 03:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCFIMy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Mar 2023 03:12:54 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB2BAD18;
        Mon,  6 Mar 2023 00:12:51 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 573806000D;
        Mon,  6 Mar 2023 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678090369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=41tK/4sc0HybqHTpg8xmCxNLiEjYYyAPf4MvYENFtJw=;
        b=RuZAo4lvA91UGB4Tgm9ZfOFjEwmOPPVSnQ7US/AXswmAEM6BNyBXvFPIjr4uTXzsmqOJev
        BMvleglWXhOimRwavPfBtjOW+D2LMMEISTq9jnvqdfvgJECZYZKdC8PnhNy4JhR+7mmApg
        +mQ3Y7dX9/NuzAL4RnxocB75lKZgE4IzXqFrmjlk/bAZuqgfffTBsYwsIBv3N7PexskSZ4
        x7RyTJ4OqcFbtJvkN8ELcmO9GQVPx1A/fW8a5gtwFsz8mcwlenht7LBVm2QEFE4iw8jOAC
        QwnrxyXxp7ATGzxQGoB0WsXYc5txrFQacCKxR6tL7EOu30xZu/7WJfOFpi6xaA==
Date:   Mon, 6 Mar 2023 09:12:48 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 28/41] rtc: rzn1: Convert to platform remove callback
 returning void
Message-ID: <20230306091248.555ddca2@xps-13>
In-Reply-To: <20230304133028.2135435-29-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
        <20230304133028.2135435-29-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Sat,  4 Mar 2023 14:30:15 +0100:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-rzn1.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 0d36bc50197c..dca736caba85 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c

Thanks,
Miqu=C3=A8l
