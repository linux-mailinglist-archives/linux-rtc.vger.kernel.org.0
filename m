Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D616A20C13D
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2020 14:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgF0MX7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 27 Jun 2020 08:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgF0MX6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 27 Jun 2020 08:23:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF9FC03E979
        for <linux-rtc@vger.kernel.org>; Sat, 27 Jun 2020 05:23:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id b15so8925323edy.7
        for <linux-rtc@vger.kernel.org>; Sat, 27 Jun 2020 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KKPGyo3MXVtAhbYKQybtdTdPk4crLVXPTYiJKKQUXqk=;
        b=H3CSwzhzLppKcO9Nk2iLHtGOeJ4F46Znd+X7jQuqNjR5kOBgOOVwQx0okSvmTFagFt
         0qSqd6pFaRwwI007RPGbaknBNZX0QuzvAnJ/4eoqBAgoyZULYtBt3T4aw8ObAobmWnFv
         62EerjAKr1fMxOqf5qa5aiQnAku7m/YZ1i/V6uXk+SlLO2zjCSFNRYG3mcn2JWFay6i8
         vhCjqF0T/PvO8fVxrgNVaXk8jlbtJ7ctTyCLW8Bgrv2bP/fAWKNdfLnvtclH3iQc/4HH
         Q619GRxKUvSjRVfIZ32mMlZgvpA/PE2DfobusaEkOnzaWD8bLoChiTzVVIUWw8BkkmGI
         XDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKPGyo3MXVtAhbYKQybtdTdPk4crLVXPTYiJKKQUXqk=;
        b=b5Qbbrudh8BGEvyfqe6766lpV0tUmJSi1qPmKFRbJw5fJPDnm94Ubo3sXFYcE7R60N
         UjC4MhzBu04eWg1y5GOx7RSDh1JB8F01LMSvS1eJ3RgxsuZ5KvdLjBH1Pqi4xdNuygJC
         TknA7gBOSO+3kH+93FswNWXNZeXQmYxXrfZxzq0/J4W1FdJVgLZ+vlnSESRQt5Imnj6n
         rxGVpjG+2FwZRetW6URKuX4222DySnWRhPp/aEnKdFGpYXr6MggHvsdjTwJmrVq3xOFF
         mvIiPY8Wc+YBUxcEU7HNh527P79304aew1iJHnSUc/mNgZv0TuGdNHbeGI08oU+3FtJp
         j+AA==
X-Gm-Message-State: AOAM531PaKOR4igfhhyFXc9CANKsXfPo1XTPMctbb/LEplh8Te3O+FPg
        60dOUI8sxkZHv0ImMdIUhUb3mn/cQVk8xZub/NDAvw==
X-Google-Smtp-Source: ABdhPJz2l7WiloxCZj/SRm01aI2OPwPGgicxy9ZOoqAxPZAmfPJlG/SueBc6NaIHr6Z2y8czeSQvh7ffD2ML7X8u+fU=
X-Received: by 2002:a05:6402:17f6:: with SMTP id t22mr8478439edy.141.1593260637021;
 Sat, 27 Jun 2020 05:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200619041145.1882-1-liambeguin@gmail.com> <20200619041145.1882-2-liambeguin@gmail.com>
In-Reply-To: <20200619041145.1882-2-liambeguin@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Sat, 27 Jun 2020 14:23:40 +0200
Message-ID: <CAH+2xPD3A1QWQyeCPwMxn+QPKCOK4RDMMrqVUQ2pL6TKZiWxxw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rtc: pcf2127: add pca2129 device id
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den fre. 19. jun. 2020 kl. 06.11 skrev Liam Beguin <liambeguin@gmail.com>:
>
> From: Liam Beguin <lvb@xiphos.com>
>
> The PCA2129 is the automotive grade version of the PCF2129.
> add it to the list of compatibles.
>
> Signed-off-by: Liam Beguin <lvb@xiphos.com>

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

> ---
> Changes since v1:
> - Document new compatible string for the pca2129
>
> Changes since v2:
> - None
>
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  drivers/rtc/rtc-pcf2127.c                              | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
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
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 9c5670776c68..4accee09bfad 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -553,6 +553,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  static const struct of_device_id pcf2127_of_match[] = {
>         { .compatible = "nxp,pcf2127" },
>         { .compatible = "nxp,pcf2129" },
> +       { .compatible = "nxp,pca2129" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, pcf2127_of_match);
> @@ -664,6 +665,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
>  static const struct i2c_device_id pcf2127_i2c_id[] = {
>         { "pcf2127", 1 },
>         { "pcf2129", 0 },
> +       { "pca2129", 0 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> @@ -729,6 +731,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
>  static const struct spi_device_id pcf2127_spi_id[] = {
>         { "pcf2127", 1 },
>         { "pcf2129", 0 },
> +       { "pca2129", 0 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(spi, pcf2127_spi_id);
> --
> 2.27.0
>
