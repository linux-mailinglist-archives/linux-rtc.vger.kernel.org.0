Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB73772D06
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Aug 2023 19:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjHGRcX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Aug 2023 13:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjHGRcW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Aug 2023 13:32:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A125CE68
        for <linux-rtc@vger.kernel.org>; Mon,  7 Aug 2023 10:32:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso7560426e87.1
        for <linux-rtc@vger.kernel.org>; Mon, 07 Aug 2023 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1691429539; x=1692034339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3IbEjZSX91UtpA+DFU2alOeKFrHIvSI2HurlIVr6js=;
        b=NwYaf3R/rYhOvQNdZdloSbfiIg7hZgRf2QbMu7sg8P2ZtTaOoipA9uhDRAmDO7yWkM
         kCgOcRFPCkYh70RLefLN0vHQ396mMoZf4O8yzSS17nKPJreU9BpqXbvAEA+/QPDfIrnT
         wATpYlY6MZ+MBmygufyDIWHwOcqm7YkMA6e76VX/8MsNmUYGnijI0iJetXwjjMeSt6t/
         0G8XmYLT4U0QLWcbPjIMZqocaYN0bfYO8xBtvETus+Ei5g26M4rbjSGwUQ1bdkcXrxWG
         oanHGMc3Bb4A5/lASbrRsL1Ft7QiV3qGTXyY9M3QaS6V6isOEsh/qe1jCxbFwOaQvQjy
         4FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691429539; x=1692034339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3IbEjZSX91UtpA+DFU2alOeKFrHIvSI2HurlIVr6js=;
        b=fcm4i/g7mVCa5N2bETfZE7S/41RNIld0X8G0eZ5y/8WN3J7yNuCRNWIGJ6BJ+g6NXq
         xVkvgfHaBKMtLPeimXJgyDMUcJFKdVjw0+Vym4E4goYTCFfWOeorXffbH8X7YoYPIgMh
         WVEvLUuvbBxnYEH+hSWzH4FhNEZPyr4DEE+/RS3U/kC2wtw6gYFXMNbdosKy80nnt+Zf
         0gc3LDQI46o0Xdc2WNDF9Bn9urvFiwsKzZQND8NAEgDhL+arPcpRFT4kL1DzFLpAuwKR
         BA443jJ7iEYtElV1K5tj9UxzqXuGbL+afzVtTN5kLh7uk0aLmx3+9hQU8TlX1zGANWSJ
         CGvg==
X-Gm-Message-State: AOJu0Yw3b/RXBU7NQSph0JilZVACTVitVWPPSqITLSG467clO60+MaQ6
        KUFoBS24lUBCtVTQ519yA30sEo6MEbwOAAVGxmBpPQ==
X-Google-Smtp-Source: AGHT+IGJLKzth9Ha81gK+UcioZSVO5VCxabAoYaaszRmaxFcvf7oxtGRzu5ValD5vJOi54EnbrHUYlB507647/0576s=
X-Received: by 2002:a05:6512:3a82:b0:4fb:8bab:48b6 with SMTP id
 q2-20020a0565123a8200b004fb8bab48b6mr6232121lfu.52.1691429538643; Mon, 07 Aug
 2023 10:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230807124811.16763-1-aboutphysycs@gmail.com>
In-Reply-To: <20230807124811.16763-1-aboutphysycs@gmail.com>
From:   Alexandru Ardelean <alex@shruggie.ro>
Date:   Mon, 7 Aug 2023 20:32:06 +0300
Message-ID: <CAH3L5QqPqb8GhK6J8iM7-fHZ7Yb4d0aU-1MzduRhO76BqR403Q@mail.gmail.com>
Subject: Re: [PATCH] rtc: armada38x: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.com,
        andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 7, 2023 at 3:48=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail.c=
om> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>

NAK on this.
This still calls dev_get_drvdata() in PM routines to access the private dat=
a.

> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/rtc/rtc-armada38x.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index b4139c200676..5ed028429565 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -527,7 +527,6 @@ static __init int armada38x_rtc_probe(struct platform=
_device *pdev)
>                 dev_warn(&pdev->dev, "Interrupt not available.\n");
>                 rtc->irq =3D -1;
>         }
> -       platform_set_drvdata(pdev, rtc);
>
>         if (rtc->irq !=3D -1)
>                 device_init_wakeup(&pdev->dev, 1);
> --
> 2.34.1
>
