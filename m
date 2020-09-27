Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E924279F83
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Sep 2020 10:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgI0IKI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 27 Sep 2020 04:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgI0IKI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 27 Sep 2020 04:10:08 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81C0C0613CE;
        Sun, 27 Sep 2020 01:10:07 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id r7so4103965ejs.11;
        Sun, 27 Sep 2020 01:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=reM919V5YhA3/SpytTV6JS37CjmVptV+Uj1ygsM+7qE=;
        b=gYYFjDla0MAkDoyZMn+Q/Uy5MK2K6Re7g3PTt8p9tIbXPjVzVLZN6600uI/zN/mdlB
         NkCo8ZbinXyTS2FpqSEBGPj6CFMnK8VDR1aGrzVxPMKKYRzTQtKPNAgYI5ZpmKCxxjvw
         tBY6n98b3NYZbPQ/RtihEghk4D5o1n1Y70IKAqZ668KYdpxnlOyZWo2UDcSL+gqRNe5s
         Ul/K8Nwl4iywWVGhbE39tE6U8e0dZgKDoSeXQh/1FdltPb/uKlRv8d4CAVEP8+znFwsp
         53cLKjD2LGI8Ar2adLjRv/Sz3XewVM7IjW8IjKx5/Rj4l51tO1Nwk5I8+Y+Y0MJw1Yu0
         Gj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=reM919V5YhA3/SpytTV6JS37CjmVptV+Uj1ygsM+7qE=;
        b=IbLAhGvUmteh2/L1ZNMhXGZlLHdxbW8YCysKvtwI8Tc3AgRxrujLCDzcxSCOk6wg2C
         vZfdybFhu0ekf0Imc01lFdZZZFUk3SHmllDd4qC4B14RNhvD0XaSdywXI3V8VXqFGiwK
         pb0k7k5/cGrmjDp/C7XXYfCj1RWMa4akk5rdeY0w8N25CsvcdMSWs2G3HA2d70j3+B1d
         QJh3Ay2OepQ5z/VTS5sSu3kQootL8VwzArHnx8uo1Ot6UxiBx5z9mENOvELBP03gTHGv
         QuXgD3UC3jxW/GVGVF5xoMj1+O7cpYVUkU/7HLKXDDOJSmRWep6O0YRLIrUDwr3tHBly
         /23g==
X-Gm-Message-State: AOAM531BtqkRcNCRJI/3Td2b5l2NBKIo3x9Pbvodq3CWHdbN/lVcDXEQ
        I19G8uc4jJXmRoKWWpxoTxbVsGN+QolgmCkFmHU=
X-Google-Smtp-Source: ABdhPJw5SWDLYXdS4VprIHLH8KkhCFfZBsW2pZFxeCyX+bIWlrn0NYttj4ToSAVDccWb8ETVrw9CXGr8U1i4W87ps8c=
X-Received: by 2002:a17:906:c447:: with SMTP id ck7mr10263244ejb.358.1601194206501;
 Sun, 27 Sep 2020 01:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200924074715.GT9675@piout.net> <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <20200924105256.18162-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200924105256.18162-3-u.kleine-koenig@pengutronix.de>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Sun, 27 Sep 2020 10:09:50 +0200
Message-ID: <CAH+2xPAVvMpTgT3W=0AsKy=9jkS8qd6eB65Qebw51YKRQshaGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] rtc: pcf2127: only use watchdog when explicitly available
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-watchdog@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den tor. 24. sep. 2020 kl. 12.53 skrev Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de>:
>
> Most boards using the pcf2127 chip (in my bubble) don't make use of the
> watchdog functionality and the respective output is not connected. The
> effect on such a board is that there is a watchdog device provided that
> doesn't work.
>
> So only register the watchdog if the device tree has a "has-watchdog"
> property.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-pcf2127.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 5b1f1949b5e5..8bd89d641578 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -340,7 +340,8 @@ static int pcf2127_watchdog_init(struct device *dev, =
struct pcf2127 *pcf2127)
>         u32 wdd_timeout;
>         int ret;
>
> -       if (!IS_ENABLED(CONFIG_WATCHDOG))
> +       if (!IS_ENABLED(CONFIG_WATCHDOG) ||
> +           !device_property_read_bool(dev, "has-watchdog"))
>                 return 0;

I don't think the compiler can remove the function if
CONFIG_WATCHDOG is disabled due to the device tree
value check. Maybe it can if split into 2 conditions.

if (!IS_ENABLED(CONFIG_WATCHDOG))
        return 0;
if (!device_property_read_bool(dev, "has-watchdog"))
        return 0;

/Bruno

>
>         pcf2127->wdd.parent =3D dev;
> --
> 2.28.0
>
