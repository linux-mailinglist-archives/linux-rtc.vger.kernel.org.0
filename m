Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC815DFA4C
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2019 03:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJVB5H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 21:57:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44479 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728375AbfJVB5G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 21:57:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id c4so265162lja.11
        for <linux-rtc@vger.kernel.org>; Mon, 21 Oct 2019 18:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6QN3nnW0+A0dowl9op/8I6W9n72eo8Hv8IOq47JkQq8=;
        b=isB6qw0CQw4y7FqNSDgnAJzt2Sxmc5rXvjXMoZlwVPULp+bmp+Z1T7hmd28gXdfyEU
         vOuRWeM2qkZfd3iBd3KQvI1YA6ufZWcgyUyfEtI/3LjiS5xW3USWnFMXr5duQ8mNyonW
         tNkFSME4Qq4pNL/RqrI0jU9YlN4oKo9cMp1Ldc6NYGXwU7cA4Njd32kXAJfiiigF3Oe2
         YoOeqGznO4Y4PnHb8wEbfu/KEQxgL82gQMFywcoJef+NvtFLOkUeWzmWMfyiKEumnNu1
         1o8jy3NNhmneDdZ0sHg7doLfejd2JPCs39eTlZbgkv2XeO1sk+KiGdc+J5jvj5IDR0dB
         nO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6QN3nnW0+A0dowl9op/8I6W9n72eo8Hv8IOq47JkQq8=;
        b=Gmc5jq21VRp66/Bc1CyABg6whnuWCbdU1pGTGacGaVt56RPhU+wlx8/BbLnuNH7NYo
         BehMmR2a+0BxhQYLvW3SHBjBLKQ7ZsN5vMZ2hEzEzHL24Ofm6IrOJAitm2Fpo6q3+qss
         ZX/znGRHZSnwWGS+6fJi+WGZtYs8tLCNnVFyIYhzu9Rqpl9d7YKa86ZJDOE7Rm0uQvhZ
         4m8b71G+iP+/OqM3r+kc/1iTxCL79Aerk2ucoitKBQgfKVZKQgy8XNw1Ysl7+3v8DuVW
         Dsdp+1n3HEcrUnibgB52VLHtm/y1TdwMvQgkBOor7wbz7Vxf2yf/taDyKNhMYOUmWMkp
         sSKA==
X-Gm-Message-State: APjAAAV+1IxxW0HkNZbdszmkN5FsxsHgMapgYSZ2CQ1z6q22WeVt4oos
        avb1vC4ulGHtFQzlTH820Kkrmt/4UCn2li1HHaUzBQ==
X-Google-Smtp-Source: APXvYqy6bQ4RxV9PElCFJFr6AFk7WMOoSEl4j++Pyqx5CD45fQwJyALy+e7gj9vIQmrhVGZGMa8EzOY3f/sLMolOMmI=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr15681426ljg.165.1571709423316;
 Mon, 21 Oct 2019 18:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191021155806.3625-1-alexandre.belloni@bootlin.com> <20191021155806.3625-4-alexandre.belloni@bootlin.com>
In-Reply-To: <20191021155806.3625-4-alexandre.belloni@bootlin.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Tue, 22 Oct 2019 09:56:51 +0800
Message-ID: <CAMz4kuLtCWC7s3Q8QRuOYE6PR186CDNQMvLNTSiVuHhGyz4Jzg@mail.gmail.com>
Subject: Re: [PATCH 4/4] rtc: sc27xx: remove .remove
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 21 Oct 2019 at 23:58, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> dpm_sysfs_remove() and device_pm_remove() are already called by
> device_del() on device removal so there is no need to call
> device_init_wakeup(dev, false) from the driver and it allows to remove the
> .remove callback.

Right, feel free to add my tag, thanks.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-sc27xx.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
> index b95676899750..36810dd40cd3 100644
> --- a/drivers/rtc/rtc-sc27xx.c
> +++ b/drivers/rtc/rtc-sc27xx.c
> @@ -661,12 +661,6 @@ static int sprd_rtc_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static int sprd_rtc_remove(struct platform_device *pdev)
> -{
> -       device_init_wakeup(&pdev->dev, 0);
> -       return 0;
> -}
> -
>  static const struct of_device_id sprd_rtc_of_match[] = {
>         { .compatible = "sprd,sc2731-rtc", },
>         { },
> @@ -679,7 +673,6 @@ static struct platform_driver sprd_rtc_driver = {
>                 .of_match_table = sprd_rtc_of_match,
>         },
>         .probe  = sprd_rtc_probe,
> -       .remove = sprd_rtc_remove,
>  };
>  module_platform_driver(sprd_rtc_driver);
>
> --
> 2.21.0
>


-- 
Baolin Wang
Best Regards
