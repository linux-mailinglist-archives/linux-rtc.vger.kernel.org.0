Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D09A41B538
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 19:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242181AbhI1Rhw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 13:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242163AbhI1Rhw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 13:37:52 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D922C06161C;
        Tue, 28 Sep 2021 10:36:12 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id s137so8772498vke.11;
        Tue, 28 Sep 2021 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XkS8nuoSDEWyzTbDLAQmajCu1bd0dDfm3L8LZr17AM4=;
        b=KM5gWIHK9gZtVqbX8A61yxJekzaKsVLgyBgiSrAGMoAAA7JNgrg2jv05G/3jl44THH
         ujnINPcXZCdc1g0dbDKUFwMZwnVaUJ/GRFBsTEu+dmRdOSy1b5SRV/2ccqJbWnE8CInu
         xsQg8412qpriqhe3n7390/Ch1/5iHtlGhqvI6pscHeHuzC15GUZGrVxi2AfrIJ9zxLoo
         JEzvwr1onohQwDjI6PABRR/cHqOR2L7zocM/gBdlpDYj2UwUeTbiTxKyjKKge5s6oL7F
         ud/tC0IohdPxi0q8SUSOTSpKLi5SvoN9+UnyX93VgIfG7lg/HibrU3nSz3qK88RfCC8E
         NKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XkS8nuoSDEWyzTbDLAQmajCu1bd0dDfm3L8LZr17AM4=;
        b=5RKwlfHlrQEnDb0fJO341Q3Tjd0/q+aVhf6G4Exae8nfoZYQWZq69KDMJewWptk+GX
         QF23R1vLFMmJTVVAs9F5UyfDLCLEjRBWw7ABMi+zrj+5ukVG4p94lepl9eXVE1wcBgf9
         Dpic0/0Vam3urkiq63xA/Bd6YXHy1D6hiGgd9jYBKR9HCh0YEP9o6fMnER/aZ2bXWPkD
         s2TxQDW9z/fzoFAlKibGHKVHm3X3Rclq0DrdaMFSgKKvgnPnsygjbgj8AfuOx6MbwEII
         qGZADifjOp16TRL9Q9Ze9i75El/EAz9xJSGsMbMRQLrPPhcvczcJsGpHCPOJ/o4GWvhB
         glug==
X-Gm-Message-State: AOAM533ZxPrIDtXz+Mn8bZX7JIk7U0n1uQpIesMyZS3gJScwCi8gwM1Z
        kWb/OakFNewGXVcEetkMNYKKIIFQT+G1J7kf+oFSGz2aL02iHg==
X-Google-Smtp-Source: ABdhPJzqSDHfpdpcT6UeO53NXofjG0BZqAEkms73wNoOcLKfw52xSoKOnNq4L+MZVaJ46RDGCnDlxxgoph/1xBPQqRU=
X-Received: by 2002:a05:6122:16aa:: with SMTP id 42mr5480455vkl.22.1632850571446;
 Tue, 28 Sep 2021 10:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210928134654.991923-1-colin.king@canonical.com>
In-Reply-To: <20210928134654.991923-1-colin.king@canonical.com>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Tue, 28 Sep 2021 19:35:59 +0200
Message-ID: <CABgxDoK+kv+NHEmaoV6YtsLpZPYYjx2k5DNaMVZCwe=dyacQtA@mail.gmail.com>
Subject: Re: [PATCH][next][V2] rtc: msc313: Fix unintentional sign extension
 issues with left shift of a u16
To:     Colin King <colin.king@canonical.com>
Cc:     Daniel Palmer <daniel@thingy.jp>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,


Re-tested with rtctest and rtc-range, everything passed.



Le mar. 28 sept. 2021 =C3=A0 15:46, Colin King <colin.king@canonical.com> a=
 =C3=A9crit :
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Shifting the u16 value returned by readw by 16 bits to the left
> will be promoted to a 32 bit signed int and then sign-extended
> to an unsigned long. If the top bit of the readw is set then
> the shifted value will be sign extended and the top 32 bits of
> the result will be set.
>
> Fixes: be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Romain Perier <romain.perier@gmail.com>

Thanks,
Romain

> ---
> V2: Fix identical issue in msc313_rtc_read_time too. Thanks to Daniel Pal=
mer
>     for noticing this ommission.
> ---
>  drivers/rtc/rtc-msc313.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
> index 5f178d29cfd8..f3fde013c4b8 100644
> --- a/drivers/rtc/rtc-msc313.c
> +++ b/drivers/rtc/rtc-msc313.c
> @@ -53,7 +53,7 @@ static int msc313_rtc_read_alarm(struct device *dev, st=
ruct rtc_wkalrm *alarm)
>         unsigned long seconds;
>
>         seconds =3D readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
> -                       | (readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) <<=
 16);
> +                       | ((unsigned long)readw(priv->rtc_base + REG_RTC_=
MATCH_VAL_H) << 16);
>
>         rtc_time64_to_tm(seconds, &alarm->time);
>
> @@ -122,7 +122,7 @@ static int msc313_rtc_read_time(struct device *dev, s=
truct rtc_time *tm)
>                 udelay(1);
>
>         seconds =3D readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
> -                       | (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 1=
6);
> +                       | ((unsigned long)readw(priv->rtc_base + REG_RTC_=
CNT_VAL_H) << 16);
>
>         rtc_time64_to_tm(seconds, tm);
>
> --
> 2.32.0
>
