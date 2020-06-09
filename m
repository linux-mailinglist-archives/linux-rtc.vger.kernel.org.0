Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD9C1F4848
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jun 2020 22:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgFIUsv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jun 2020 16:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbgFIUsu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jun 2020 16:48:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D19C05BD1E
        for <linux-rtc@vger.kernel.org>; Tue,  9 Jun 2020 13:48:49 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id k11so84312ejr.9
        for <linux-rtc@vger.kernel.org>; Tue, 09 Jun 2020 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TLF19D1UPpvd1PpGy4wnDzukqxWRk/cQk0kHN53mUpQ=;
        b=kY+3k+3cdIx53j9DtzYEfxbqHRgcAKT6E2uet9vO5p+ijiARaWIKfayck5+9CpUvkV
         MZuCBi7pemOh/7aCJrOb47dNZlsfQOdfDPxAqXBohzfHq+oiYLNLKsMzw2iMaODxMe3G
         24uGMfY2XBaOxsaAIvifUpadJFNiPjPQgfkfj4nyN4Lr9gVmnBChIKKLgHcX7olJWO2r
         Hm+WzOjN3LIxlYHchEcQ1BoIDpZ82cufzrGTNeypjDRj1IKlgk5zrxWFvyoThfLwGmbv
         ZAexmoXNONOmPXyBZ6lY70Y51gY61D23xISTmAAFaAKXG9LTk0FflH6ahOXhx+/7j/Bv
         +wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TLF19D1UPpvd1PpGy4wnDzukqxWRk/cQk0kHN53mUpQ=;
        b=dU9JSGRwdj9i4ktsaWmFT5kaPR42xd/b3ViuKqNJ/F0qfyY5C8K1ZED31Z8l3y7y+P
         OTfaMD8OwutyYSPfZLTILBKlcvvbQA2MeK886Tm5PM+lMgbf3lKoJfMLkGHn0+41ToUE
         2+M/pLOegIgx202Qf8vSrLcnZttutEW2RyVZNLwwe9CuPPXSBPsLWSHA5mq9dYU2uZoQ
         lGlS5NFRnmfuQacNmYOHb1txdiIC/S2y+t2n+PbyuSmOLIHiGXm8ci8qMztyFYUPnvrs
         1CylTie8eN4wjtGP8uQNwPdP5HqAw6R/wCPuVNuP35xqxPGHiTQOOlw8yMj0hX7exPrd
         47ng==
X-Gm-Message-State: AOAM531H//0ttxhQe+Psyu+cbumK36ap1EsLNuHNHjimVJmTRfwAuswv
        0FfkZuC/im37AwZ9SKCvVfQCfnZFGV8iJiEhtC1T5IJS
X-Google-Smtp-Source: ABdhPJzk7rANRVfRGnVKo21uqk0O/54nJPLOjou1Zng6XdxkPx+d2+rRnUkwbJHVplIH77ybWtfXNzG1vwfQGis131Q=
X-Received: by 2002:a17:906:2584:: with SMTP id m4mr236500ejb.328.1591735727396;
 Tue, 09 Jun 2020 13:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200607170610.24534-1-liambeguin@gmail.com> <20200607170610.24534-2-liambeguin@gmail.com>
In-Reply-To: <20200607170610.24534-2-liambeguin@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Tue, 9 Jun 2020 22:48:30 +0200
Message-ID: <CAH+2xPAb=468vj06NqkV+f0sE2RNaHBXiR0SC5NjHLw+D4AtZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rtc: pcf2127: add pca2129 device id
To:     liambeguin@gmail.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den s=C3=B8n. 7. jun. 2020 kl. 19.06 skrev <liambeguin@gmail.com>:
>
> From: Liam Beguin <lvb@xiphos.com>
>
> From: Liam Beguin <lvb@xiphos.com>
>
> The PCA2129 is the automotive grade version of the PCF2129.
> add it to the list of compatibles.
>
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 4e50d6768f13..396a1144a213 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -546,6 +546,7 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>  static const struct of_device_id pcf2127_of_match[] =3D {
>         { .compatible =3D "nxp,pcf2127" },
>         { .compatible =3D "nxp,pcf2129" },
> +       { .compatible =3D "nxp,pca2129" },

Remember to document new compatible string here:
Documentation/devicetree/bindings/rtc/trivial-rtc.yaml

/Bruno

>         {}
>  };
>  MODULE_DEVICE_TABLE(of, pcf2127_of_match);
> @@ -656,6 +657,7 @@ static int pcf2127_i2c_probe(struct i2c_client *clien=
t,
>  static const struct i2c_device_id pcf2127_i2c_id[] =3D {
>         { "pcf2127", 1 },
>         { "pcf2129", 0 },
> +       { "pca2129", 0 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> @@ -720,6 +722,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
>  static const struct spi_device_id pcf2127_spi_id[] =3D {
>         { "pcf2127", 1 },
>         { "pcf2129", 0 },
> +       { "pca2129", 0 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(spi, pcf2127_spi_id);
> --
> 2.27.0
>
