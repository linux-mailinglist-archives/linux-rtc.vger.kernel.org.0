Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB001ABC7F
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2020 11:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441405AbgDPJOE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Apr 2020 05:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503691AbgDPJNl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Apr 2020 05:13:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0779FC061A0C
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2020 02:13:40 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a25so3983677wrd.0
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2020 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AyKKf2vu9ets5qQ05mKeEx+H3HJdeMhyf7LDU6EPmvg=;
        b=h79u+RID/Tw8EjEr7PzOeW67I5riBs6/JV027laFW3VtXjta4zpbT4owqSzSYadzXI
         UooqVXoXGL1A8oAByZdeXkLIJKTO01hEePh4C5fzehOrUdnbfQ1pEs9kiyqYoA/KX+JH
         1qMRtfcJSHijAK2OGm7YZmCKbHczogdEeoL22Pw+vKfPbVBWs4ymX9eJohxZQNiYHrt4
         ev6JtRiaXOHosoQtEI6ZEvp9wcTaGhtxQIVftu4d8viJsibPKXtJvkzZsh+8sFdMla2G
         mZm9iRn+HrGu+Q6eydYFxopmA1r46j4zcJCjdDXVsTQRSFhEB8VLG7f5460IgaYT+mVk
         jnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AyKKf2vu9ets5qQ05mKeEx+H3HJdeMhyf7LDU6EPmvg=;
        b=U915G9cFq4bMbCq8efwZJJ8xwW5DFNA0HBAabWNbKNpeYlmZKxQdRDmuMPx6lAoyqa
         apC13Jt+3SjVnsEb1MN+GxE+OCpO7nutlHXt30KgclrEEHLzd1w6MmTtEhJP4slhXz9I
         xIqYC1iIHtt8TksoGB+X9UycowevkdyFmxSGOSiis8bEsbK5DvMpo0iXli7iNQlZ7+sA
         BQXH9ZB12liIsMJkQy5JkWrvDEEMdBuh2NyhGxfmWBI88iGFrVGTZ3DgBjMiumMX6Vij
         tndaiK2cYEQroBT3EUDNhe05ZdqV9t4VlVojb7MHcMbiVcuHjjdp+6tOKfrnoiM71OPx
         sX9A==
X-Gm-Message-State: AGi0PuYuTnbwuPLUYcDP1GG8HF6jNnENSz9GLyVKeW+VtsrdGHPng+/d
        uktBCmXPW7SWqqLZAsNNf3O0Jg==
X-Google-Smtp-Source: APiQypL6P5SXhhJYLq4NR+TEKXmQzYaSqAHnJaTlLyokBRKxP3wo+p/iZ1+/LSCv7ZJBVaCmcdxoSg==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr4801408wrw.139.1587028418328;
        Thu, 16 Apr 2020 02:13:38 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id b4sm21818100wrv.42.2020.04.16.02.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 02:13:37 -0700 (PDT)
Date:   Thu, 16 Apr 2020 10:14:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Josef Friedl <josef.friedl@speed.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ran Bi <ran.bi@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v12 5/6] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200416091438.GA2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 08 Apr 2020, Hsin-Hsiung Wang wrote:

> From: Ran Bi <ran.bi@mediatek.com>
> 
> This add support for the MediaTek MT6358 RTC. Driver using
> compatible data to store different RTC_WRTGR address offset.
> This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
> driver which only needed by armv7 CPU without ATF.
> 
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

Please place these in chronological order.  They should provide some
history, rather than a unordered slab list of random sign-offs.

> ---
>  drivers/power/reset/mt6323-poweroff.c |  2 +-
>  drivers/rtc/rtc-mt6397.c              | 18 +++++++++++++++---
>  include/linux/mfd/mt6397/rtc.h        |  9 ++++++++-
>  3 files changed, 24 insertions(+), 5 deletions(-)

[...]

> diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> index 7dfb63b..6200f3b 100644
> --- a/include/linux/mfd/mt6397/rtc.h
> +++ b/include/linux/mfd/mt6397/rtc.h
> @@ -18,7 +18,9 @@
>  #define RTC_BBPU_CBUSY         BIT(6)
>  #define RTC_BBPU_KEY            (0x43 << 8)
>  
> -#define RTC_WRTGR              0x003c
> +#define RTC_WRTGR_MT6358       0x3a
> +#define RTC_WRTGR_MT6397       0x3c

Why remove the leading 00's?

These are now different to the other regs defined in this header.

> +#define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
>  
>  #define RTC_IRQ_STA            0x0002

Like here for instance  --^

>  #define RTC_IRQ_STA_AL         BIT(0)
> @@ -65,6 +67,10 @@
>  #define MTK_RTC_POLL_DELAY_US  10
>  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
>  
> +struct mtk_rtc_data {
> +	u32                     wrtgr;
> +};
> +
>  struct mt6397_rtc {
>  	struct device           *dev;
>  	struct rtc_device       *rtc_dev;
> @@ -74,6 +80,7 @@ struct mt6397_rtc {
>  	struct regmap           *regmap;
>  	int                     irq;
>  	u32                     addr_base;
> +	const struct mtk_rtc_data *data;
>  };
>  
>  #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
