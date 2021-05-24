Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB5C38E081
	for <lists+linux-rtc@lfdr.de>; Mon, 24 May 2021 06:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhEXE6A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 May 2021 00:58:00 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:42971 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhEXE6A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 May 2021 00:58:00 -0400
Received: by mail-vs1-f51.google.com with SMTP id j12so8561421vsq.9
        for <linux-rtc@vger.kernel.org>; Sun, 23 May 2021 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aCou1GN+VFtJo9bn++vd0SQb+ICnnNfgmjfEdtqu+TU=;
        b=r+okJWapj6LP9sM7DQYVx+X+UNKfi1pmuTWUqUdUd7O6gTcDym9ZyoAlBkOOzpFd8h
         s9YazJGK/BNBBuz/R678Ym+zpnxI5P0mHyUJ/4bqTAZocp513soXI2zxYd+N3/PRBGzg
         xbASLRSRSRUFo9CchWADbKzDuJ7+YCl1rkX+a0csjlzibnlRhj3ez1tHhWr7u6ipy9Fg
         yljVvjwLRGt6o1mDA2lafL5ennH/1oe6Vspquu1Dj2ERmFDQriet0nxhn2YrhSCNZA6N
         zf9QppdSaEzVM3RsZ9Ck5rnen+/cytRtqcKUq9BQ4K9APuNP1zqjj4JTXJt4wAn0JnVU
         BHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aCou1GN+VFtJo9bn++vd0SQb+ICnnNfgmjfEdtqu+TU=;
        b=DPG5mnhena9D4wZBDjYaoQvERmXEQ+hmTGj8Xp9tQuGmhNbo7kKte5wr45gKdXejZ2
         zYSyHM1IK0ji/EWEvysvTzM8Q6aiYzc09dLU74/wHavxLxU8cKU/QkAh8lw9qH7PTg50
         pNHwfmJCsWBvJTwh4Honw7QiC4KxWTW5o1W6lbhJDkiwd5qkF6mUBdPqW34Lo8DHwfzM
         NdDdimjhjDiCba1mKFv4zViX/G+5Q2d38VyxdB4JCNBfZPKokBJxPpzW7g3xQuMBxMJB
         YQ4udebYWk1kOnFjcMd6YFo7I1fgTTc3hBqVExU9k/JZ1l9VUaiVhPASMl3IpfEysduL
         JfFg==
X-Gm-Message-State: AOAM532A2BgDolyUNb/MUNEWFVC5QcbCKX3BFg26XaNI6epxlRI2K7DU
        zHPnNekcrDvW9WeS9bF15z4Vt6zOEIGEHTpHu5qVrnrzlJPu
X-Google-Smtp-Source: ABdhPJyQ1sCG7EzyJjxM8qGA6E35iVomWczbCw795hTy1vTQpPzRIJXlHn8Ok/vRfG55i/app4kI7K7nCaWAwiY5LW8=
X-Received: by 2002:a67:f281:: with SMTP id m1mr18731775vsk.24.1621831990685;
 Sun, 23 May 2021 21:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <AM8P190MB09806335DF5E7967BB8EA9E4F52C9@AM8P190MB0980.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <AM8P190MB09806335DF5E7967BB8EA9E4F52C9@AM8P190MB0980.EURP190.PROD.OUTLOOK.COM>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Mon, 24 May 2021 13:52:44 +0900
Message-ID: <CABMQnVLmkQtBqgMiUVpdpTm2c1LmZZZ2Y5y=zMHrCE34J5A7eg@mail.gmail.com>
Subject: Re: [RFC] rtc: rv3032: Add devicetree parameter to enable level
 switching mode
To:     Hager Stefan <s.hager@abatec.at>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B45=E6=9C=8818=E6=97=A5(=E7=81=AB) 17:46 Hager Stefan <s.hager@a=
batec.at>:
>
> When the Micro Crystal RV3032 rtc is used with a primary coin-cell for po=
wer backup, the backup switching mode LSM (level switching mode) should be =
used according to the technical support from the manufacturer of this devic=
e.
>
> Currently there is no way to set this mode by the driver.
>
> Thererfore, i suggest to introduce an additional parameter for the device=
tree to enable this backup switchover mode
> and to extend the probe function to look for that parameter and activate =
the LSM.
>
> Is this an appropriate solution? Does it need improvements?
>
> Signed-off-by: Stefan Hager <s.hager@abatec.at>
>
> ---
> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.ya=
ml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
> index a2c55303810d..b948e19e358b 100644
> --- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
> @@ -37,6 +37,10 @@ properties:
>        - 3000
>        - 4400
>
> +  backup-switchover-mode-level:
> +    description:
> +      Use level switching mode for backup switchover mode

Please add 'type: boolean'.

> +
>  required:
>    - compatible
>    - reg
> diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
> index d63102d5cb1e..a28a3e0172d0 100644
> --- a/drivers/rtc/rtc-rv3032.c
> +++ b/drivers/rtc/rtc-rv3032.c
> @@ -881,6 +881,12 @@ static int rv3032_probe(struct i2c_client *client)
>         if (ret)
>                 return ret;
>
> +       if (device_property_read_bool(&client->dev, "backup-switchover-mo=
de-level")) {
> +               ret =3D regmap_update_bits(rv3032->regmap, RV3032_PMU, RV=
3032_PMU_BSM, (RV3032_PMU_BSM_LSM) << 4);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         rv3032_trickle_charger_setup(&client->dev, rv3032);
>
>         rv3032->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
>

Best regards,
  Nobuhiro
--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
