Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0F93CD036
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jul 2021 11:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234816AbhGSIbT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Jul 2021 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbhGSIbS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Jul 2021 04:31:18 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D452C061762
        for <linux-rtc@vger.kernel.org>; Mon, 19 Jul 2021 01:13:02 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 70so14978155pgh.2
        for <linux-rtc@vger.kernel.org>; Mon, 19 Jul 2021 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C/jKKp5/wQLBQDXRyhzMqlLvH6J9ztLjXrsaGM34GA8=;
        b=ToPtgFmpGZoW/ODAFZ8Kdp2lJaEuTtlQr0I9Jmw6NBQvwMaidTSNArbv40uIBFqoNw
         19yZ5kw2k3bzJmYfKfrDZujc1DQIscwkBB3q06qJNzC54bwHHQUmJOTcQA5z5g1OBnds
         VuQNXY5gyzYd8tpYJXmn5/R+tJV2OQPrND3hmh6Yjzb2NCQGqQNN33YbcbpWZDAt3t0N
         /jE8PkBNt7j8f3PX+tqNsGpvfx2vFWvOQZ35qUAqB2abwykZFHw6ClCPFqePYqGeNBRP
         YVy5GkShoVl8MoB9Xr0WlriHq2s8hrBEmsiHi04nLY1Ut6Hene4kKUrck0tY49MjNDcl
         iW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C/jKKp5/wQLBQDXRyhzMqlLvH6J9ztLjXrsaGM34GA8=;
        b=gQvp7Q4cio8YuTWHQeqkGZBHy7v1bVW5GRy/o5QufQAna67/rcMjWS9aouFRuVEwDI
         7Tx79Xd2wcPlzTHhtom3iFinoiAGPfCdrr71Nwv3QNU3Nf8pNOsGIZdYGGWE7vZLIaqV
         lEtvs7LC2E2sOcbtmM96puFbV9HgPfOIeEaxmlvvZOuTP47Yb02lJleaK7nzSxWbIF9D
         e9pz7SbfuOrKQYZo0FSwk9O2wovZcycih5lQGmoJvw6adCAxy/iSpSBjTw5flkV3NkLy
         D46y2P3isKngPYQDFFGOExGQPxITln8Qg++9zEcYMT02Z0pQbXTncWLfR4oPXj/6L41/
         wCSA==
X-Gm-Message-State: AOAM530iX5i3j8VoptO5aKkmTrnQK1f7GATQsSlQefMoyOHbdFfMe73E
        khxJ+LCRylcnJFPHZE+fjZX1OknAxjljoYOkHM50QzC6Cb+p
X-Google-Smtp-Source: ABdhPJxT6p3bCm4/Uwa+Iljn2nv6PtaNHappvE83y9TtBmUhh71wVjnjs05oVOvAEuB5FZdGOqkFd+3tZTwAe/N//uE=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr21327401vkh.3.1626682580250;
 Mon, 19 Jul 2021 01:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210709044518.28769-1-matt@traverse.com.au> <20210709044518.28769-2-matt@traverse.com.au>
In-Reply-To: <20210709044518.28769-2-matt@traverse.com.au>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Mon, 19 Jul 2021 17:15:53 +0900
Message-ID: <CABMQnVLgpLdb=HDwEKnoNzM50WS6yB65uQvGxB3m3VfHLNE6+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rtc: rx8025: implement RX-8035 support
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

2021=E5=B9=B47=E6=9C=889=E6=97=A5(=E9=87=91) 13:45 Mathew McBride <matt@tra=
verse.com.au>:
>
> The RX-8035 is a newer RTC from EPSON that is very
> similar to the RX-8025.
>
> The key difference is in the oscillation stop (XSTP)
> bit which is inverted on the RX-8035.
>
> Signed-off-by: Mathew McBride <matt@traverse.com.au>

Reviewed- by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro

> ---
>  drivers/rtc/rtc-rx8025.c | 58 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
> index c914091819ba..7a0258fe4b8e 100644
> --- a/drivers/rtc/rtc-rx8025.c
> +++ b/drivers/rtc/rtc-rx8025.c
> @@ -60,14 +60,23 @@
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
>  static const struct i2c_device_id rx8025_id[] =3D {
> -       { "rx8025", 0 },
> +       { "rx8025", model_rx_8025 },
> +       { "rx8035", model_rx_8035 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rx8025_id);
>
>  struct rx8025_data {
>         struct rtc_device *rtc;
> +       enum rx_model model;
>         u8 ctrl1;
>  };
>
> @@ -100,10 +109,26 @@ static s32 rx8025_write_regs(const struct i2c_clien=
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
> @@ -117,7 +142,8 @@ static int rx8025_check_validity(struct device *dev)
>                 return -EINVAL;
>         }
>
> -       if (!(ctrl2 & RX8025_BIT_CTRL2_XST)) {
> +       xstp =3D rx8025_is_osc_stopped(drvdata->model, ctrl2);
> +       if (xstp) {
>                 dev_warn(dev, "crystal stopped, date is invalid\n");
>                 return -EINVAL;
>         }
> @@ -127,6 +153,7 @@ static int rx8025_check_validity(struct device *dev)
>
>  static int rx8025_reset_validity(struct i2c_client *client)
>  {
> +       struct rx8025_data *drvdata =3D i2c_get_clientdata(client);
>         int ctrl2 =3D rx8025_read_reg(client, RX8025_REG_CTRL2);
>
>         if (ctrl2 < 0)
> @@ -134,22 +161,28 @@ static int rx8025_reset_validity(struct i2c_client =
*client)
>
>         ctrl2 &=3D ~(RX8025_BIT_CTRL2_PON | RX8025_BIT_CTRL2_VDET);
>
> +       if (drvdata->model =3D=3D model_rx_8025)
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
>  {
>         struct i2c_client *client =3D dev_id;
>         struct rx8025_data *rx8025 =3D i2c_get_clientdata(client);
> -       int status;
> +       int status, xstp;
>
>         rtc_lock(rx8025->rtc);
>         status =3D rx8025_read_reg(client, RX8025_REG_CTRL2);
>         if (status < 0)
>                 goto out;
>
> -       if (!(status & RX8025_BIT_CTRL2_XST))
> +       xstp =3D rx8025_is_osc_stopped(rx8025->model, status);
> +       if (xstp)
>                 dev_warn(&client->dev, "Oscillation stop was detected,"
>                          "you may have to readjust the clock\n");
>
> @@ -519,6 +552,21 @@ static int rx8025_probe(struct i2c_client *client,
>
>         i2c_set_clientdata(client, rx8025);
>
> +       if (id) {
> +               rx8025->model =3D id->driver_data;
> +               switch (rx8025->model) {
> +               case model_rx_8025:
> +                       dev_info(&client->dev, "Model RX-8025");
> +                       break;
> +               case model_rx_8035:
> +                       dev_info(&client->dev, "Model RX-8035");
> +                       break;
> +               default:
> +                       dev_warn(&client->dev, "Unknown model: %d\n", rx8=
025->model);
> +                       break;
> +               }
> +       }
> +
>         err =3D rx8025_init_client(client);
>         if (err)
>                 return err;
> --
> 2.30.1
>


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
