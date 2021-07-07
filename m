Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF103BF173
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 23:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhGGVlx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 17:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbhGGVlx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 17:41:53 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C473C061574
        for <linux-rtc@vger.kernel.org>; Wed,  7 Jul 2021 14:39:12 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id e20so1381675ual.9
        for <linux-rtc@vger.kernel.org>; Wed, 07 Jul 2021 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RXyEo0cDhLbIf8bC+6p6VI3JmiO1V1r4nPpmv6Lh3cw=;
        b=Yy3rye3RBQbSjlYsIw5+WREoZ/v6zvcRJLI1vd6HMBPsG4rTj8ekS6meVkapGwvMtU
         Nar+4zMtYyko3QZCVjjDCf+YZA7odO3sUtVwhhj836GeaWTgluuNcqmkUp/Fyx51v4VG
         tl9exKl+RVE36N0eza+lCllxta8jS8Q71A2RI+yUZA30SyGxNE41O0RIkIyL2i34OU+J
         begmo3xXnyJTKUcDaqud2gaKw3izsW94xHNOJ+4tR8ogowORK5Si2gRETXwzSc0Cnw0w
         DBvwMFSrmJVctYM9np9aiICqoJ6H2aYGM12n/pu7D2y7kQrh65/RQaAK4FzRxtTjhek6
         UEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RXyEo0cDhLbIf8bC+6p6VI3JmiO1V1r4nPpmv6Lh3cw=;
        b=i0pPMJcR4XDi5A/Fa7CQ+nqjYG4QfjGc9+edKPpVqjCMy5Ppkcc9qo0AGVKbHREGQ5
         NKBy01VMnfGug0043+ZVY7nz6K8guMFvcN2WQrCBvAn57HCBlgRj9vhX3GGgdo86GL0F
         NSyQdC2uKnT5Y7jQ2OQlHzuGPykkRHK0DV2Tik3qK/2ZsrntXwPgvvueQ4AUvvA/RKVV
         TG3BqFj7o6cMPlz7Cp+7rMF27pkjg9nh6CwBZK9Q5gJzA0o1vMn5kM6X9L2XeJ4Spjcg
         KaNs194f8X8mc4WH2ietUoW/L61WIrXNuuZz2gJtOItiLiLay7tJdarU3w0VUVPwYw/2
         nG7Q==
X-Gm-Message-State: AOAM533RHxTKZhvoJgzVLUpQFunn9MQIG1F/W2DunLToKHybBf3wieJg
        X2jQAFk5aHhgYBvr56Pmk75+K4PCp+XYldQzxRFr
X-Google-Smtp-Source: ABdhPJwIDH0S+ZennpMtx4BVUQxVJpupWsgftT0fBDTm0RCw+rsKPUHbcaB9wVePwh2y08pfr2Vm3/Ynzl5/oV5v7CQ=
X-Received: by 2002:ab0:2e81:: with SMTP id f1mr25499580uaa.74.1625693951226;
 Wed, 07 Jul 2021 14:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210707071616.28976-1-matt@traverse.com.au> <20210707071616.28976-2-matt@traverse.com.au>
In-Reply-To: <20210707071616.28976-2-matt@traverse.com.au>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Thu, 8 Jul 2021 06:38:44 +0900
Message-ID: <CABMQnVLm2f7cm_j3NtAKXzoyMHrm1ALSR7J99faEOCK6KysNnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: rx8025: implement RX-8035 support
To:     Mathew McBride <matt@traverse.com.au>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B47=E6=9C=887=E6=97=A5(=E6=B0=B4) 16:17 Mathew McBride <matt@tra=
verse.com.au>:
>
> The RX-8035 is a newer RTC from EPSON that is very
> similar to the RX-8025.
>
> The key difference is in the oscillation stop (XSTP)
> bit which is inverted on the RX-8035.
>
> Signed-off-by: Mathew McBride <matt@traverse.com.au>
> ---
>  drivers/rtc/rtc-rx8025.c | 59 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
> index c914091819ba..1a33ec402f4a 100644
> --- a/drivers/rtc/rtc-rx8025.c
> +++ b/drivers/rtc/rtc-rx8025.c
> @@ -60,14 +60,24 @@
>  #define RX8025_ADJ_DATA_MAX    62
>  #define RX8025_ADJ_DATA_MIN    -62
>
> +enum rx_model {
> +       model_rx_unknown,
> +       model_rx_8025,
> +       model_rx_8035,
> +       model_last
> +};
> +
>  static const struct d rx8025_id[] =3D {
> -       { "rx8025", 0 },
> +       { "rx8025", model_rx_8025 },
> +       { "rx8035", model_rx_8035 },
>         { }
>  };
> +
>  MODULE_DEVICE_TABLE(i2c, rx8025_id);
>
>  struct rx8025_data {
>         struct rtc_device *rtc;
> +       enum rx_model type;

I think 'model' is easier to understand than 'type'.

>         u8 ctrl1;
>  };
>
> @@ -100,10 +110,26 @@ static s32 rx8025_write_regs(const struct i2c_clien=
t *client,
>                                               length, values);
>  }
>
> +static int rx8025_is_osc_stopped(enum rx_model model, int ctrl2)
> +{
> +       int xstp =3D ctrl2 & RX8025_BIT_CTRL2_XST;
> +       /* XSTP bit has different polarity on RX-8025 vs RX-8035.
> +        * RX-8025: 0 =3D=3D oscillator stopped
> +        * RX-8035: 1 =3D=3D oscillator stopped
> +        */
> +
> +       if (model =3D=3D model_rx_8025)
> +               xstp =3D !xstp;
> +
> +       return xstp;
> +}
> +
>  static int rx8025_check_validity(struct device *dev)
>  {
>         struct i2c_client *client =3D to_i2c_client(dev);
> +       struct rx8025_data *drvdata =3D dev_get_drvdata(dev);
>         int ctrl2;
> +       int xstp;
>
>         ctrl2 =3D rx8025_read_reg(client, RX8025_REG_CTRL2);
>         if (ctrl2 < 0)
> @@ -117,7 +143,8 @@ static int rx8025_check_validity(struct device *dev)
>                 return -EINVAL;
>         }
>
> -       if (!(ctrl2 & RX8025_BIT_CTRL2_XST)) {
> +       xstp =3D rx8025_is_osc_stopped(drvdata->type, ctrl2);
> +       if (xstp) {
>                 dev_warn(dev, "crystal stopped, date is invalid\n");
>                 return -EINVAL;
>         }
> @@ -125,7 +152,7 @@ static int rx8025_check_validity(struct device *dev)
>         return 0;
>  }
>
> -static int rx8025_reset_validity(struct i2c_client *client)
> +static int rx8025_reset_validity(enum rx_model model, struct i2c_client =
*client)

We can get the struct rx8025_data by using i2c_get_clientdata().
Therefore, I think that it can be updated without increasing the arguments.

```
struct rx8025_data *rx8025 =3D i2c_get_clientdata(client);

if (rx8025->type =3D=3D model_rx_8025)
```

>  {
>         int ctrl2 =3D rx8025_read_reg(client, RX8025_REG_CTRL2);
>
> @@ -134,8 +161,13 @@ static int rx8025_reset_validity(struct i2c_client *=
client)
>
>         ctrl2 &=3D ~(RX8025_BIT_CTRL2_PON | RX8025_BIT_CTRL2_VDET);
>
> +       if (model =3D=3D model_rx_8025)
> +               ctrl2 |=3D RX8025_BIT_CTRL2_XST;
> +       else
> +               ctrl2 &=3D ~(RX8025_BIT_CTRL2_XST);
> +
>         return rx8025_write_reg(client, RX8025_REG_CTRL2,
> -                               ctrl2 | RX8025_BIT_CTRL2_XST);
> +                               ctrl2);
>  }
>
>  static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
> @@ -149,7 +181,7 @@ static irqreturn_t (int irq, void *dev_id)
>         if (status < 0)
>                 goto out;
>
> -       if (!(status & RX8025_BIT_CTRL2_XST))
> +       if (rx8025_is_osc_stopped(rx8025->type, status))

In rx8025_check_validity(), the return value is put in xstp and confirmed.
I thought it would be better to unify to either one.

>                 dev_warn(&client->dev, "Oscillation stop was detected,"
>                          "you may have to readjust the clock\n");
>
> @@ -241,7 +273,7 @@ static int rx8025_set_time(struct device *dev, struct=
 rtc_time *dt)
>         if (ret < 0)
>                 return ret;
>
> -       return rx8025_reset_validity(client);
> +       return rx8025_reset_validity(rx8025->type, client);
>  }
>
>  static int rx8025_init_client(struct i2c_client *client)
> @@ -519,6 +551,21 @@ static int rx8025_probe(struct i2c_client *client,
>
>         i2c_set_clientdata(client, rx8025);
>
> +       if (id) {
> +               rx8025->type =3D id->driver_data;
> +               switch (rx8025->type) {
> +               case model_rx_8025:
> +                       dev_info(&client->dev, "Type RX-8025");
> +               break;

Please fix indent.

> +               case model_rx_8035:
> +                       dev_info(&client->dev, "Type RX-8035");
> +                       break;
> +               default:
> +                       dev_warn(&client->dev, "Unknown type: %d\n", rx80=
25->type);
> +               break;

ditto.

> +               }
> +       }
> +
>         err =3D rx8025_init_client(client);
>         if (err)
>                 return err;
> --
> 2.30.1
>

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
