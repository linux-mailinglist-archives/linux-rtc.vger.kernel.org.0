Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8218842D
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2020 13:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgCQMaX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 08:30:23 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44853 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgCQMaX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Mar 2020 08:30:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id d62so21417106oia.11;
        Tue, 17 Mar 2020 05:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bWIGrmJckT1m6t9quae5+JZV9bgbsoWOVuE/IRPIaU=;
        b=GbK3DPScJAztlhsnTjBPGHhza6bHTGDnv99/0V6wI+g3w1wQV6KUZrDT4ggMpnhFdJ
         38L9n2iotYDN64hsGap7TdRdixmE5Bm8CIrRVhPPdtCM0H5aoXMptalrV5dgHnovVTRn
         YsQe5qqEduSFiw2qDc114VTKUUhp4a+6cx1+TYvTSKkqHuzPUbbVlU+aV6xRO5x6foDH
         JGzygqPRCNPyVAGqAux3yR6qrwVf384cVSne3yZAKz0sHo+J9sjn2vGl1GwwjpsfUaHf
         ssATK+G/6Xy0XEegiwG+ITC8GuuFnfD2PwB5Xa5To/Vah+ctDUxtB/6M6/u8TLz1Iocx
         9epQ==
X-Gm-Message-State: ANhLgQ3oCh7WizCCcM+QcxarEUWhSxx6jLElvLiJzNFZSHzN3N9IW3KD
        QV4+PeCopOWXli2EBW5YNn3b5+C+EcSPV/d8JiQ=
X-Google-Smtp-Source: ADFU+vuNAHmuooiafUqKBUMfEczzYmFc/BAx7C+JWZfkPiA2MFSi8dPCdNgJmpF13jUW4ASUOw2odywHhSz6CZpai2U=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr3061324oig.153.1584448221150;
 Tue, 17 Mar 2020 05:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Mar 2020 13:30:10 +0100
Message-ID: <CAMuHMdVy6J1G5P6BQ14D65=pRu-q=+kcN3RV8mjtaZcwBooZyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: mt2712: fix build without PM_SLEEP
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Mon, Mar 16, 2020 at 11:48 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> Move SIMPLE_DEV_PM_OPS out of #ifdef to fix build issues when PM_SLEEP is
> not selected.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-mt2712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
> index 432df9b0a3ac..c2709c1602f0 100644
> --- a/drivers/rtc/rtc-mt2712.c
> +++ b/drivers/rtc/rtc-mt2712.c
> @@ -394,10 +394,10 @@ static int mt2712_rtc_resume(struct device *dev)
>
>         return 0;
>  }
> +#endif
>
>  static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
>                          mt2712_rtc_resume);

That's 23 more unused pointers in your kernel image.

> -#endif
>
>  static const struct of_device_id mt2712_rtc_of_match[] = {
>         { .compatible = "mediatek,mt2712-rtc", },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
