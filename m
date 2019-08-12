Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0CAE89B53
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 12:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfHLKWO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 06:22:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33632 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbfHLKWO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 06:22:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id p77so10535599wme.0
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zoPZbXqPW78h/2uThaa7mn2LzRhBNLTRaQs9IxumQJE=;
        b=vJ2GlkA9v8yTNFNSxD1tYPMv6zm6aAZbc0eagMqBcoc0oVXHforLwDr+jURWjvN6jf
         k5X8u/x5nlBEex6MPfLs76eV6m/26tMxbrBcX42+QJ7ZM4mAP6i8fYu8SQ0H3b8JExAC
         GZ1YHoi+MhBvEE+cq5NnWJYuoI+39/Q7rgiyDN5mUiSeITs1GgBFoQi3YLJHh8q0MRbJ
         RFBv7xI+rinrgHJhfdJ/RsGUI6D3g6Hi/7Fq9MOnHM3Ia2zqXMAtbzveZ6MvNNPZvEdS
         Z6zV8fvBNCDe74jZ4wmksqFv8KlPMrQLCLZos3iEqE3yjLhQ33iF99G4dOJicHNjI2Kw
         sqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zoPZbXqPW78h/2uThaa7mn2LzRhBNLTRaQs9IxumQJE=;
        b=j/ivR9OShExWNFBvbvD1J6Acbnl09hkMZ8TmOGbX/k848hntDKvavbulUphwj/diqy
         LOhq5zmCguDvTQ5YFXec2l1Gg34mvpQqlI/Pbtz4ibA0rekeIfNIQON0kif3FPTAxD7Y
         BDDLMUJ/BFyRJ3aVK4klDwa/kVFULgkS7h8zRsEmabD2ixVk6jnJZ9UrGg5B8bXV05Dl
         r+z6laUsVvVIXE0k+5QVa9j/Wba9nztZMucodpKOgDfKPY3o8BC3uOrF6UH/XUmCr3BS
         J3Nhuzt9Dl5WM2QbFJNCpaEUDBvOyx0wKrsBlZxXscXR9MHRXcTf1tVY1iXxAVnMLgsO
         QYhw==
X-Gm-Message-State: APjAAAWyctBjRwkM9nQPsBE78ElNQFp54hdA3yxst6V0zoMBoxgAbV8+
        PYEWHn7+Tr/WgTEBp8mP3hAM7w==
X-Google-Smtp-Source: APXvYqxf3cQUHAep1BdMKN4uIH07FUMOkkx/TJ2wQi9MYR4nJmyC/s/FP0G1PMDE8ki8IyMk5k86nA==
X-Received: by 2002:a05:600c:22c7:: with SMTP id 7mr15775300wmg.129.1565605332156;
        Mon, 12 Aug 2019 03:22:12 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id o126sm14136234wmo.1.2019.08.12.03.22.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 03:22:11 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:22:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allison Randal <allison@lohutok.net>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Richard Fontana <rfontana@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Tianping . Fang" <tianping.fang@mediatek.com>,
        Josef Friedl <josef.friedl@speed.at>
Subject: Re: [PATCH v3 06/10] mfd: mt6323: some improvements of mt6397-core
Message-ID: <20190812102209.GI26727@dell>
References: <20190729174154.4335-1-frank-w@public-files.de>
 <20190729174154.4335-7-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729174154.4335-7-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 29 Jul 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> simplyfications (resource definitions my DEFINE_RES_* macros)
> 
> changes since v2: splitted v2 part 4 into 6+7
> 
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/mfd/mt6397-core.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 337bcccdb914..5f7070267c9a 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2014 MediaTek Inc.
> + * Copyright (c) 2014-2018 MediaTek Inc.

This is out of date.  Please update it.

Once fixed, please apply my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
