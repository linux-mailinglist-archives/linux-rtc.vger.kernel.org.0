Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62B91FAAF0
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 10:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgFPIRk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 04:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFPIRj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 04:17:39 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0D6C05BD43
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 01:17:39 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id f7so20525116ejq.6
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jNq4fsyY87ysYqxulg9LaKOZ8zOqWb8uCkX7itHGvfw=;
        b=rx24sDEsH5kANXvqSNp0lY7wvVKwG+Wu9032EUpVDTCP1ORaCCA2CyWroSJ7KDYn0L
         mfMk8UwK0/eLFAx+julwohxTqgyHv1x+UHdRRGSbgTHtH6v20+ZuIBQbzUVM7q0CE2Dt
         1rV4Q2Lhx1QgviszM1i/vyeuv8fKfjfiDwISRKz1zjzXRDE3iGJ3P1IkZzLOqAfvIgYW
         JmZ/a3v7bVC1JV+Iu6/lut+qyugMD0zySJZvca38OEAZ4HloyFnTRoVeu6ZntsOeGcns
         0LRs2+jj0w6om3iNWMUAOlIZYUolyJAteZPbG6gLZhXYszVeLFKV3oyhTe7q2L5HSsZB
         Ippw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jNq4fsyY87ysYqxulg9LaKOZ8zOqWb8uCkX7itHGvfw=;
        b=NJgUjgL9c1+xA0dpX4gPEVc/RiavQYFiI7umT3Ziotl/L0GSSoPp1R0ZS0qioWt7jX
         sa0S50a888tZKYAwob0CeyzSmi9l9wf/RQSF3nYiqE1l9Ie+U+6H3Na4XtLIjTfd8Sx1
         JW+aff+IRxgfVHAfFdl98sdvBU3twedq70M05Exgdp2qBDp+nSyUVdvhk54bM+EZ7UQH
         67cnZYzMt7dHWh6gUhRmgRa6tiGLkRkA8mDcRw3T2RZLd/ws7Kp3D5DH5qn/xNVCTPbd
         hj37Myy/WeJzkkndVjtU1wHp1mI+9FHg08kStDILklEAKh/EaJ44antSho7ourAmfcFR
         kteg==
X-Gm-Message-State: AOAM531DnYu59TE44q1x9dNXA3TN2YhmlSmR9J6uxIgEVSxFenonfnyE
        z2fNA5o0Dk4GsoLgd65bzpJ1AE3h/j2yOeuN/sE=
X-Google-Smtp-Source: ABdhPJyVagP9sFecoTQSghkUAGsTJRF5V2zZULCvY0WoToE9mXN1VCPfx0qOtCaPHYJAPbCPT4u3wnDx/pd+eNxqqHs=
X-Received: by 2002:a17:906:4e88:: with SMTP id v8mr1765741eju.360.1592295458153;
 Tue, 16 Jun 2020 01:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200614040409.30302-1-liambeguin@gmail.com> <20200614040409.30302-2-liambeguin@gmail.com>
In-Reply-To: <20200614040409.30302-2-liambeguin@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Tue, 16 Jun 2020 10:17:21 +0200
Message-ID: <CAH+2xPAorviPx+b6kf2poqO49r_gnk1mARDj+9oqJYtwZWesig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rtc: pcf2127: add pca2129 device id
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den s=C3=B8n. 14. jun. 2020 kl. 06.04 skrev Liam Beguin <liambeguin@gmail.c=
om>:
>
> From: Liam Beguin <lvb@xiphos.com>
>
> The PCA2129 is the automotive grade version of the PCF2129.
> add it to the list of compatibles.
>
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
> Changes since v1:
> - Document new compatible string for the pca2129
>
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  drivers/rtc/rtc-pcf2127.c                              | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index 18cb456752f6..c7d14de214c4 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -52,6 +52,8 @@ properties:
>        - nxp,pcf2127
>        # Real-time clock
>        - nxp,pcf2129
> +      # Real-time clock
> +      - nxp,pca2129
>        # Real-time Clock Module
>        - pericom,pt7c4338
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC

Split device tree binding update into separate patch and
remember to add devicetree@vger.kernel.org mailing list
when you send the next patch series version.

/Bruno

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
