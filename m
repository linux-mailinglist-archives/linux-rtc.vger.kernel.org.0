Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCF839EB5F
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jun 2021 03:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhFHBca (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Jun 2021 21:32:30 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:38447 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhFHBc3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Jun 2021 21:32:29 -0400
Received: by mail-vs1-f46.google.com with SMTP id x8so10000405vso.5
        for <linux-rtc@vger.kernel.org>; Mon, 07 Jun 2021 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=czIj+vTuyUPTTsGflIZKxK3a6KoDVGJuiWeqdLZDc+4=;
        b=fFS/3zH3mKfpl9GjJEKOuKlEFJ+8r2RpSD0v0dIoHf5cXcc2HkzcRj2AsiaQGnUAHB
         LPvAuk3NiBz8pqbUqpZo1UvKX0Di+zVTOJ85/YxSf9Ls/NjMsVdCt7pLOujOUo3Vct7j
         6+5AQRDWfpSZJqmSTgCgS0qD+lYUoXFPqgk0kvFgwen8b5Iu9Vqfze5n7TF78qyrlL0+
         xIdns4qpwa7OWiEZvNI3e8lwm3bsX2bm2wFLjy6rsI3TXOBDcgjFqTM3NS+qJ/zlIees
         YFtKgCRnAxxTPfU83+vBY+yreoJDTnQLpmO6JJTF8bbnFVrVNMewg1XPlQ6H8EeUvyAz
         b0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=czIj+vTuyUPTTsGflIZKxK3a6KoDVGJuiWeqdLZDc+4=;
        b=IPtHTC4QA7/Fu/AQiX7GHdOLb+nXmpwgsImTaY+Bd5/s/Si2rp5gCWvG2l/4GK2iZh
         Pb0qvJkN5FtwlTbiGSvDcDSzPHMmrZvpcr70H1eRA6UXJY0QCyUq40Yq8Mfig3aFv3UI
         zs1LOCRBsNkQAWuRNUy/JUOLeH3KC9up69XDcFR8+RWj3f5LhFc4fTvyGk7u9HmWTvT5
         ddiqllTbufsYK9z7eCg0OV0WuoQ291TTNCE6nCUUUNUhFgsqIE1SjSGP9kO4UWpK2g6T
         xPIgqS0PNhZ0romotF+Dtq7WG091UO3J6/lh0HfHFngGluom2Beu4nfgDOAIWGzoaZ4t
         4oGw==
X-Gm-Message-State: AOAM5332M/cC7cm+dHSMyvc9itcPd/DhVTd+5sYyObhlq6CKPt+vQ7IL
        ytxdJbjZZw7OCHsWafRoU/av7ykZ4xlyIPXZo/cH
X-Google-Smtp-Source: ABdhPJzC7d0aAG0wK/pgbD9DvKJ8Ow19ZTC+Sb1kKloTawBaehfjEs5EMOa8IuEsEpT6pV2T497kijKZggNr/b9P7nE=
X-Received: by 2002:a67:6c42:: with SMTP id h63mr3602107vsc.33.1623115777392;
 Mon, 07 Jun 2021 18:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210606162423.22235-1-rdunlap@infradead.org>
In-Reply-To: <20210606162423.22235-1-rdunlap@infradead.org>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Tue, 8 Jun 2021 10:29:11 +0900
Message-ID: <CABMQnVL5fEbrj1VVV5kX7Gc7urW4qj+Hknt9EwhpzrYuLwHBeA@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf8523: rename REG_OFFSET register
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B46=E6=9C=887=E6=97=A5(=E6=9C=88) 1:24 Randy Dunlap <rdunlap@inf=
radead.org>:
>
> REG_OFFSET is defined both here and in arch/arm/mach-ixp4xx/, which
> causes a build warning, so rename this macro in the RTC driver.
>
> ../drivers/rtc/rtc-pcf8523.c:44: warning: "REG_OFFSET" redefined
>    44 | #define REG_OFFSET   0x0e
>
> ../arch/arm/mach-ixp4xx/include/mach/platform.h:25: note: this is the loc=
ation of the previous definition
>    25 | #define REG_OFFSET 3
>
> Fixes: bc3bee025272 ("rtc: pcf8523: add support for trimming the RTC osci=
llator")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> ---
>  drivers/rtc/rtc-pcf8523.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --- linux-next-20210604.orig/drivers/rtc/rtc-pcf8523.c
> +++ linux-next-20210604/drivers/rtc/rtc-pcf8523.c
> @@ -41,7 +41,7 @@
>  #define REG_WEEKDAY_ALARM      0x0d
>  #define ALARM_DIS BIT(7)
>
> -#define REG_OFFSET   0x0e
> +#define REG_OFFSET_TUNE   0x0e /* offset register is used for tuning */
>  #define REG_OFFSET_MODE BIT(7)
>
>  #define REG_TMR_CLKOUT_CTRL 0x0f
> @@ -442,7 +442,7 @@ static int pcf8523_rtc_read_offset(struc
>         u8 value;
>         s8 val;
>
> -       err =3D pcf8523_read(client, REG_OFFSET, &value);
> +       err =3D pcf8523_read(client, REG_OFFSET_TUNE, &value);
>         if (err < 0)
>                 return err;
>
> @@ -467,7 +467,7 @@ static int pcf8523_rtc_set_offset(struct
>         else
>                 value =3D (reg_m1 & 0x7f) | REG_OFFSET_MODE;
>
> -       return pcf8523_write(client, REG_OFFSET, value);
> +       return pcf8523_write(client, REG_OFFSET_TUNE, value);
>  }
>
>  static const struct rtc_class_ops pcf8523_rtc_ops =3D {

Looks good to me.
Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro
--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
