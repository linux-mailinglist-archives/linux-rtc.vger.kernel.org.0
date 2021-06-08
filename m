Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E7739EB51
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jun 2021 03:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhFHB1C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Jun 2021 21:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhFHB1C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Jun 2021 21:27:02 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55A5C061574
        for <linux-rtc@vger.kernel.org>; Mon,  7 Jun 2021 18:24:56 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id z7so6175004vso.3
        for <linux-rtc@vger.kernel.org>; Mon, 07 Jun 2021 18:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y763XzHC2KtVYY8WpGzotgg8OceQbCjZ0tVGUQhBJ28=;
        b=sRrq9ET0FtypyPl7+UwR4e2TXdbQLyON0oQb4uwj/SrithueBRZPmdK0chncX6h5SS
         uZyjdwhS8UaPL5Zz/JEJeegNkebWHHh/HQjNChsDKl87EsU8Qzdry1XWb8VUOyyevHgQ
         n6pcN7uSTWUjxbUN8w8siKmB+h+fC1RHQMPrQ6AR95Dfd277ahOHLQkAGV5MuPMonUyC
         E/8Ctt+W1qhUrfOxRXVQmbGdZ9NKILhxo0uM1hfjpsRITL9QUt9UIPu0SXQ3R1pYAY48
         DdHEW5WOQ375SNjkfuznHLDM6lCuUCvKLg+fyuTLthBCLCdCQJZYBVu5J16DyCUIi54u
         F+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y763XzHC2KtVYY8WpGzotgg8OceQbCjZ0tVGUQhBJ28=;
        b=YrLvsJTvHEuYl5I1qjUFZBjcNrmQ3MuTlVdRmSnx9X5uPix6aEc7s1+mRJaWVrUXNO
         EjUGI0zedre48vHqHkJZyY4/iieVKQogqvIuheYXi/iVnyvMEqjDaWnpyWLtFGKtxCYW
         y0yeX3k/O1Segx6ekHOJUSRsuSM2l95igZN8KBMcEbzKqkdThErFdqhaDNcPzsQqe5sM
         3aCNaYUu1+bkSQJo5cp+lTcV/vbKJQy5zkxIncFNVGZoDv/bqNGCl3tjIlK0opDcOxOw
         nAQVesQn//yTOz3rjHTGR1MmZt2+DKGyWwT7kNULEARig9McujxLG0xl9rf/OV9m83hs
         +K/A==
X-Gm-Message-State: AOAM532w8NCnsLW3XGkEPREDsQD9NlHvoCG94MusT+A9/k3hTcQWHio/
        +yVifITaU+2Ft6YROEi/CSVu90utz5m79Wa3SazOvktP1xWHFsA=
X-Google-Smtp-Source: ABdhPJxb3kTwKtdXibpW7sZ5r84bDZeNX37S9VfH2XkWkHPXmkczUI8GcIcPcg7DJJd5KSYp1VlL83yX9St+0wCY4DY=
X-Received: by 2002:a05:6102:c49:: with SMTP id y9mr11102041vss.24.1623115495802;
 Mon, 07 Jun 2021 18:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <1623087421-19722-1-git-send-email-martin.fuzzey@flowbird.group>
In-Reply-To: <1623087421-19722-1-git-send-email-martin.fuzzey@flowbird.group>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Tue, 8 Jun 2021 10:24:29 +0900
Message-ID: <CABMQnVKde4LsNQT8jU4NkmjzkNOBMOd4vt2n8Eq_zKe_kBWTqw@mail.gmail.com>
Subject: Re: [PATCH] rtc: stm32: Fix unbalanced clk_disable_unprepare() on
 probe error path
To:     Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B46=E6=9C=888=E6=97=A5(=E7=81=AB) 2:38 Martin Fuzzey <martin.fuz=
zey@flowbird.group>:
>
> The STM32MP1 RTC may have 2 clocks, the pclk and the rtc_ck.
>
> If clk_prepare_enable() fails for the second clock (rtc_ck) we must only
> call clk_disable_unprepare() for the first clock (pclk) but currently we
> call it on both leading to a WARN:
>
> [   15.629568] WARNING: CPU: 0 PID: 146 at drivers/clk/clk.c:958 clk_core=
_disable+0xb0/0xc8
> [   15.637620] ck_rtc already disabled
> [   15.663322] CPU: 0 PID: 146 Comm: systemd-udevd Not tainted 5.4.77-pkn=
bsp-svn5759-atag-v5.4.77-204-gea4235203137-dirty #2413
> [   15.674510] Hardware name: STM32 (Device Tree Support)
> [   15.679658] [<c0111148>] (unwind_backtrace) from [<c010c0b8>] (show_st=
ack+0x10/0x14)
> [   15.687371] [<c010c0b8>] (show_stack) from [<c0ab3d28>] (dump_stack+0x=
c0/0xe0)
> [   15.694574] [<c0ab3d28>] (dump_stack) from [<c012360c>] (__warn+0xc8/0=
xf0)
> [   15.701428] [<c012360c>] (__warn) from [<c0123694>] (warn_slowpath_fmt=
+0x60/0x94)
> [   15.708894] [<c0123694>] (warn_slowpath_fmt) from [<c053b518>] (clk_co=
re_disable+0xb0/0xc8)
> [   15.717230] [<c053b518>] (clk_core_disable) from [<c053c190>] (clk_cor=
e_disable_lock+0x18/0x24)
> [   15.725924] [<c053c190>] (clk_core_disable_lock) from [<bf0adc44>] (st=
m32_rtc_probe+0x124/0x5e4 [rtc_stm32])
> [   15.735739] [<bf0adc44>] (stm32_rtc_probe [rtc_stm32]) from [<c05f7d4c=
>] (platform_drv_probe+0x48/0x98)
> [   15.745095] [<c05f7d4c>] (platform_drv_probe) from [<c05f5cec>] (reall=
y_probe+0x1f0/0x458)
> [   15.753338] [<c05f5cec>] (really_probe) from [<c05f61c4>] (driver_prob=
e_device+0x70/0x1c4)
> [   15.761584] [<c05f61c4>] (driver_probe_device) from [<c05f6580>] (devi=
ce_driver_attach+0x58/0x60)
> [   15.770439] [<c05f6580>] (device_driver_attach) from [<c05f6654>] (__d=
river_attach+0xcc/0x170)
> [   15.779032] [<c05f6654>] (__driver_attach) from [<c05f40d8>] (bus_for_=
each_dev+0x58/0x7c)
> [   15.787191] [<c05f40d8>] (bus_for_each_dev) from [<c05f4ffc>] (bus_add=
_driver+0xdc/0x1f8)
> [   15.795352] [<c05f4ffc>] (bus_add_driver) from [<c05f6ed8>] (driver_re=
gister+0x7c/0x110)
> [   15.803425] [<c05f6ed8>] (driver_register) from [<c01027bc>] (do_one_i=
nitcall+0x70/0x1b8)
> [   15.811588] [<c01027bc>] (do_one_initcall) from [<c01a1094>] (do_init_=
module+0x58/0x1f8)
> [   15.819660] [<c01a1094>] (do_init_module) from [<c01a0074>] (load_modu=
le+0x1e58/0x23c8)
> [   15.827646] [<c01a0074>] (load_module) from [<c01a0860>] (sys_finit_mo=
dule+0xa0/0xd4)
> [   15.835459] [<c01a0860>] (sys_finit_module) from [<c01011e0>] (__sys_t=
race_return+0x0/0x20)
>
> Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
> Fixes: 4e64350f42e2 ("rtc: add STM32 RTC driver")
> Cc: stable@vger.kernel.org
> ---
>  drivers/rtc/rtc-stm32.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
> index 75a8924..ac9e228 100644
> --- a/drivers/rtc/rtc-stm32.c
> +++ b/drivers/rtc/rtc-stm32.c
> @@ -754,7 +754,7 @@ static int stm32_rtc_probe(struct platform_device *pd=
ev)
>
>         ret =3D clk_prepare_enable(rtc->rtc_ck);
>         if (ret)
> -               goto err;
> +               goto err_no_rtc_ck;
>
>         if (rtc->data->need_dbp)
>                 regmap_update_bits(rtc->dbp, rtc->dbp_reg,
> @@ -830,10 +830,12 @@ static int stm32_rtc_probe(struct platform_device *=
pdev)
>         }
>
>         return 0;
> +
>  err:
> +       clk_disable_unprepare(rtc->rtc_ck);
> +err_no_rtc_ck:
>         if (rtc->data->has_pclk)
>                 clk_disable_unprepare(rtc->pclk);
> -       clk_disable_unprepare(rtc->rtc_ck);
>
>         if (rtc->data->need_dbp)
>                 regmap_update_bits(rtc->dbp, rtc->dbp_reg, rtc->dbp_mask,=
 0);
> --
> 1.9.1
>
Looks good to me.

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro
--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
