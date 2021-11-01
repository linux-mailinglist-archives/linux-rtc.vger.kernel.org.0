Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1919D441B60
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Nov 2021 13:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhKAM4l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Nov 2021 08:56:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231892AbhKAM4i (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 1 Nov 2021 08:56:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BE40610A8;
        Mon,  1 Nov 2021 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635771245;
        bh=hfzr1W1/xR2QxeAac/v+nVxOrTn9v56q7DmcGPc9+hg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JyF3OQQKpe0IVxPMA8jW8Npwe9zoKdWOP7gWYNnNLx3pa7ibboEx/zc9aNuAjFuyD
         d+eeImhrqaN34rSyM3gp4pGRPGFfIX+QLPqHOThPTrhHwFtQ9x50pVYebMoaA8R8jw
         aXi8OIziSswNW2P0swO1GTZOgtlxrx4ea3/1n/MDTpG8xOYHh7Mou58DuIW4gRaG3W
         hU0QyO5AoKC8+UoK5fi1x9undzdujmcr/P/fI8PXQwRf+KsgIqkg2zlpiKICSXXvvQ
         //S32PDRqB9dGEh9YrFH4b5xxrMV7duhZf4gd6ILyL8SCZoPGaqrGeqkdVXLOBMhSC
         hCkjIUzJLSVyA==
Received: by mail-ed1-f52.google.com with SMTP id r12so64277431edt.6;
        Mon, 01 Nov 2021 05:54:05 -0700 (PDT)
X-Gm-Message-State: AOAM5310CLMlu2GcpWn8KPfett42wZnQeOlkXJRjrDHSY7vJI84PEhre
        QuEFwwxqfp4pBYzcXt9znoUIdhQhv3IxPNs94g==
X-Google-Smtp-Source: ABdhPJyjMTDw9t58QpQtxtKylM7emYM+C5K1eTBnydfOO+GGZtkWVApPkMX5Bdn/cjMxI7MznVU0jEI21XYTs7nduX4=
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr21344386ejc.390.1635771243743;
 Mon, 01 Nov 2021 05:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211101013400.325855-1-dominique.martinet@atmark-techno.com> <20211101013400.325855-2-dominique.martinet@atmark-techno.com>
In-Reply-To: <20211101013400.325855-2-dominique.martinet@atmark-techno.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 1 Nov 2021 07:53:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmUDj42r=1n2+JoOS+1dAJgq4Ujv8EYb07ZzPEbLgS8Q@mail.gmail.com>
Message-ID: <CAL_JsqJmUDj42r=1n2+JoOS+1dAJgq4Ujv8EYb07ZzPEbLgS8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] rv8803: add irq-gpio optional dts attribute
To:     Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Oct 31, 2021 at 8:40 PM Dominique Martinet
<dominique.martinet@atmark-techno.com> wrote:
>
> Some device cannot be woken up from i2c signal.
> Add a new irq-gpio attribute for devices which have a gpio connected to
> the rv8803 INT line so the rtc can be used for suspend to mem

Please send DT patches to the DT list.

Binding changes should be a separate patch.

>
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
>
> Our board does not have an upstream dts so I cannot provide a real
> example for it, but I've tested this on something close to the
> imx8mp-evk.
>
> It should not break anything for people having no alarm at all or using
> the i2c irq.
>
>  .../devicetree/bindings/rtc/epson,rx8900.yaml |  5 ++
>  drivers/rtc/rtc-rv8803.c                      | 73 +++++++++++++++++--
>  2 files changed, 73 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> index 29fe39bb08ad..0d7912b984c7 100644
> --- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> @@ -28,6 +28,10 @@ properties:
>
>    trickle-diode-disable: true
>
> +  irq-gpio:
> +    description: |
> +      gpio for INT signal. Set up gpio for irq and device wakeup.

No, use 'interrupts' as interrupt capable GPIO controllers are also an
interrupt provider.

> +
>  required:
>    - compatible
>    - reg
> @@ -45,5 +49,6 @@ examples:
>              reg = <0x32>;
>              epson,vdet-disable;
>              trickle-diode-disable;
> +            irq-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
>          };
>      };
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 0d5ed38bf60c..1c4b96bc110e 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/rtc.h>
> +#include <linux/pm_wakeirq.h>
>
>  #define RV8803_I2C_TRY_COUNT           4
>
> @@ -509,6 +510,61 @@ static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
>                                          flags);
>  }
>
> +static int rv8803_setup_gpio_irq(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       int err;
> +       int irq;
> +       unsigned long irqflags;
> +       struct gpio_desc *gpiod;
> +
> +
> +       gpiod = devm_gpiod_get_from_of_node(dev, dev->of_node, "irq-gpio",
> +                                           0, GPIOD_IN, "RTC irq pin");
> +       if (!gpiod || IS_ERR(gpiod)) {
> +               dev_dbg(dev, "no gpio for rtc: skipping\n");
> +               return -ENOENT;
> +       }
> +
> +       irq = gpiod_to_irq(gpiod);
> +       if (irq < 0) {
> +               dev_err(dev, "gpio found but no irq\n");
> +               err = irq;
> +               goto error_gpio;
> +       }
> +
> +       irqflags = IRQF_ONESHOT;
> +       irqflags |= gpiod_is_active_low(gpiod) ?
> +                   IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
> +
> +       err = devm_request_threaded_irq(dev, irq, NULL, rv8803_handle_irq,
> +                                       irqflags, "rtc-rv8803-gpio", client);
> +       if (err) {
> +               dev_warn(dev, "unable to request IRQ\n");
> +               goto error_gpio;
> +       }
> +
> +       err = device_init_wakeup(dev, true);
> +       if (err) {
> +               dev_warn(dev, "unable to set as wakeup source\n");
> +               goto error_irq;
> +       }
> +
> +       err = dev_pm_set_wake_irq(dev, irq);
> +       if (err) {
> +               dev_warn(dev, "unable to set wake irq\n");
> +               goto error_irq;
> +       }
> +
> +       return 0;
> +
> +error_irq:
> +       devm_free_irq(dev, irq, client);
> +error_gpio:
> +       devm_gpiod_put(dev, gpiod);
> +       return err;
> +}
> +
>  static int rv8803_probe(struct i2c_client *client,
>                         const struct i2c_device_id *id)
>  {
> @@ -524,6 +580,7 @@ static int rv8803_probe(struct i2c_client *client,
>                 .reg_write = rv8803_nvram_write,
>                 .priv = client,
>         };
> +       bool irq_setup = false;
>
>         if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>                                      I2C_FUNC_SMBUS_I2C_BLOCK)) {
> @@ -562,17 +619,23 @@ static int rv8803_probe(struct i2c_client *client,
>         if (IS_ERR(rv8803->rtc))
>                 return PTR_ERR(rv8803->rtc);
>
> -       if (client->irq > 0) {
> +       if (client->dev.of_node) {
> +               err = rv8803_setup_gpio_irq(client);
> +               if (!err)
> +                       irq_setup = true;
> +       }
> +
> +       if (!irq_setup && client->irq > 0) {
>                 err = devm_request_threaded_irq(&client->dev, client->irq,
>                                                 NULL, rv8803_handle_irq,
>                                                 IRQF_TRIGGER_LOW | IRQF_ONESHOT,
>                                                 "rv8803", client);
> -               if (err) {
> +               if (err)
>                         dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
> -                       client->irq = 0;
> -               }
> +               else
> +                       irq_setup = true;
>         }
> -       if (!client->irq)
> +       if (!irq_setup)
>                 clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
>
>         err = rv8803_write_reg(rv8803->client, RV8803_EXT, RV8803_EXT_WADA);
> --
> 2.30.2
>
