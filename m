Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFD21E9153
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 14:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgE3MvD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 08:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgE3MvD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 08:51:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0715EC08C5C9
        for <linux-rtc@vger.kernel.org>; Sat, 30 May 2020 05:51:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m18so2569404ljo.5
        for <linux-rtc@vger.kernel.org>; Sat, 30 May 2020 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7MoXFf0+k24ZJ0xE7dxQMHlYNoQ4i6xVNFYw3gZONQ=;
        b=viDU7nHJz9GLKyvVfnmaQzuVJRJfPDEsiPDafjItWVdcvxhrnhgcFGdHR7UhoNbrxT
         GuCwV0LU8aDlWNaAk30xcc9dRcjQ2p9DQ1RyYHdtPQxJPP3CwpDJZIwh35bT47ilslvp
         m51C5SH8jq6f+qe5MqhsohJf1VAk4q33DzKoGI/REeoWtXsw+QrF5e/rpNUyxaQzJBUm
         WZpO4hVdkN5WKjmiwUjHX/toUfJJhMH5soMPSKTEHyUDpAtlGVr0tKncVikJxZg6F4yK
         IgmiQroAtsfPZvfDQKiFRTJOQKrpmKSQKPnLiYS75fqAQwRuuLOCo5eqlsCcgftrRlbq
         ePww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7MoXFf0+k24ZJ0xE7dxQMHlYNoQ4i6xVNFYw3gZONQ=;
        b=nqyD7mXG+p1IgJlowDc+y7o0QdkFB2WJ/NAZv+zzheDTK6SDrwDO/DFdAvW+Mj63zj
         yn2+i/lgGW9GSmwEhzil6bXo+v0w5LqUVU7JOA9z3KsFNIB3YgfhZ75bjjNCl2EvbOzg
         7sz8hWhHDaLlQkV5evCyUZmo9slj0n1RCe3bjj/O+GA9IBcRm42deP9GJ/XXde/FwE0j
         OatroU47bvh4KxdzuOgrX1BOwatxTmI53OHKygmUH04Lg8YqGc0TxPIUqa3QmYDSvwaY
         z3eFVxcRQsbranx0s/u6M6DMmYzSRA0fTGzXwcNMn4y5chym/XTt9yirnHYPKfNDGaNi
         i0Xw==
X-Gm-Message-State: AOAM533t3WzALGlsIWS8aNeDgYvG8uXMUY7WqmMHaoSrOHgItXRMzoJ9
        Cc+rPSV+uJifJLI0rBI+TqqyjNj5cOMfm0zDudXEHuZC9v0=
X-Google-Smtp-Source: ABdhPJxT2WfMdBmO1lPqeelQNK9xuUcXa9b2iDztzq36z4exu31N74ZCt13SnBaQPLeApNT677Csy32qvA17hoQJ43A=
X-Received: by 2002:a2e:810c:: with SMTP id d12mr6323787ljg.410.1590843060975;
 Sat, 30 May 2020 05:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200530123222.361104-1-kevin+linux@km6g.us>
In-Reply-To: <20200530123222.361104-1-kevin+linux@km6g.us>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Sat, 30 May 2020 08:50:49 -0400
Message-ID: <CAE+Udoq_mNiwfjwm1Fw==6wcQ71GU-U+t=Kd5ixvaXMg_+WQNA@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Sorry, this was sent prematurely and should have been split into two
patches. It has been resent properly.

On Sat, May 30, 2020 at 8:32 AM Kevin P. Fleming <kevin+linux@km6g.us> wrote:
>
> All of the parts supported by this driver can make use of a
> small capacitor to improve the accuracy of the autocalibration
> process for their RC oscillators. If a capacitor is connected,
> a configuration register must be set to enable its use, so a
> new Device Tree property has been added for that purpose.
>
> Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  .../bindings/rtc/abracon,abx80x.txt           |  6 ++++
>  drivers/rtc/rtc-abx80x.c                      | 34 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> index 2405e35a1bc0..ad5d59ed6f24 100644
> --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> @@ -29,3 +29,9 @@ and valid to enable charging:
>   - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
>   - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
>                            resistor, the other values are in kOhm.
> +
> +All of the devices can have a 47pf capacitor attached to increase the
> +autocalibration accuracy of their RC oscillators. To enable usage of the
> +capacitor the following property has to be defined:
> +
> + - "abracon,autocal-filter"
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index 3521d8e8dc38..be5a814e8c0b 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -76,6 +76,9 @@
>  #define ABX8XX_CFG_KEY_OSC     0xa1
>  #define ABX8XX_CFG_KEY_MISC    0x9d
>
> +#define ABX8XX_REG_AFCTRL      0x26
> +#define ABX8XX_AUTOCAL_FILTER_ENABLE   0xa0
> +
>  #define ABX8XX_REG_ID0         0x28
>
>  #define ABX8XX_REG_OUT_CTRL    0x30
> @@ -130,6 +133,31 @@ static int abx80x_is_rc_mode(struct i2c_client *client)
>         return (flags & ABX8XX_OSS_OMODE) ? 1 : 0;
>  }
>
> +static int abx80x_enable_autocal_filter(struct i2c_client *client)
> +{
> +       int err;
> +
> +       /*
> +        * Write the configuration key register to enable access to the AFCTRL
> +        * register
> +        */
> +       err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
> +                                       ABX8XX_CFG_KEY_MISC);
> +       if (err < 0) {
> +               dev_err(&client->dev, "Unable to write configuration key\n");
> +               return -EIO;
> +       }
> +
> +       err = i2c_smbus_write_byte_data(client, ABX8XX_REG_AFCTRL,
> +                                       ABX8XX_AUTOCAL_FILTER_ENABLE);
> +       if (err < 0) {
> +               dev_err(&client->dev, "Unable to write autocal filter register\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  static int abx80x_enable_trickle_charger(struct i2c_client *client,
>                                          u8 trickle_cfg)
>  {
> @@ -825,6 +853,12 @@ static int abx80x_probe(struct i2c_client *client,
>                         return err;
>         }
>
> +       if (of_property_read_bool(np, "abracon,autocal_filter")) {
> +               err = abx80x_enable_autocal_filter(client);
> +               if (err)
> +                       return err;
> +       }
> +
>         if (client->irq > 0) {
>                 dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
>                 err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> --
> 2.26.2
>
