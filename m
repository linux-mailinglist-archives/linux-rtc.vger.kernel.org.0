Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B111ABC48
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2020 11:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503287AbgDPJKo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Apr 2020 05:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503420AbgDPJJ7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Apr 2020 05:09:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB2CC061A10
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2020 02:09:56 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so3764123wmj.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2020 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AkzX3Dcs3nD4u98CC4pQCRsVTQrys7ElI/8/pjZK+Ts=;
        b=wb/ou2IL7ZL03YQ8OAV+Os2euU0E17M9a0KwoQ3V3isxo7+xI1+LSfhg5vSw6QDiT5
         PsrEZIKgjxOmO31HznVmbOHJL0WiBxEdRrUVX8PGl+6aFMMKj+Ok3aE5PJnZLvTAR7uI
         vGLCAgXDlm9SWpL6LlhpelL2R0kMbpm8ccCFbNZs9pJWVok28OUT2dVDc0jLwk1ecNu2
         F3LojeUezoSXKQKiaoF94+HsBfCLyTeSTcf13SDqUTYKpELlLnEGHIWeaFAXVEXVx9Ze
         VdpFDYBagqARwZ2Txck/ZqK5qn1jwast8Gxgr8rEKOIaDNo6PJlLDAZamY6dNhxapVdn
         0hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AkzX3Dcs3nD4u98CC4pQCRsVTQrys7ElI/8/pjZK+Ts=;
        b=AZwQB8GPykWqL37mZist97OaAExk1mNl7cdco6cjQAYaWy7QGaN5Exj4f9r8n1t5zX
         cNm6bh1Z+PWEgsUsFw/cjlP4qdZwzKubVAQSVZMOFQY/Tb0jaC5c/wX92hGGaY3PVg5P
         fV/Ep1KHFVZg52B3PfY8pF7AC7no1T9ucysvSpr04wHyZaVsP3eo69JU95NqFUUyKgKB
         fdqNg3IeNF26a1TPlr1U1DQYgJFSb5mJ+aBwW7WxWIK0gTJmt8edRAQYSmREp2xifOpP
         cm8i7V0VjmG6ZxM9obFvPL2yAJP/3VzUr9r8gJu8rMPQYKq+/G46I3l8pGAUFqGpK7uv
         V1uA==
X-Gm-Message-State: AGi0Pua3VF8qGB621G3AqqEoCC4wvsqdFmelj79w7/1K//ByxD7bTTSU
        nouJRp7RQniCzBiGgcU3AdlV+w==
X-Google-Smtp-Source: APiQypJvFDcKODT9CxRfCRMCE4sQZDVimgniJ+YY4tbASMLPFOZ6+nm+DuXIWSzcnSgUjCRLXlPPcw==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr3989576wme.126.1587028194753;
        Thu, 16 Apr 2020 02:09:54 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id h5sm7933704wrp.97.2020.04.16.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 02:09:54 -0700 (PDT)
Date:   Thu, 16 Apr 2020 10:10:54 +0100
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
Subject: Re: [PATCH v12 4/6] mfd: Add support for the MediaTek MT6358 PMIC
Message-ID: <20200416091054.GZ2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1586333531-21641-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 08 Apr 2020, Hsin-Hsiung Wang wrote:

> This adds support for the MediaTek MT6358 PMIC. This is a
> multifunction device with the following sub modules:
> 
> - Regulator
> - RTC
> - Codec
> - Interrupt
> 
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6358 MFD is a child device of the pwrap.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile                 |   2 +-
>  drivers/mfd/mt6358-irq.c             | 235 +++++++++++++++++++++++++++++
>  drivers/mfd/mt6397-core.c            |  36 +++++
>  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
>  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   3 +
>  6 files changed, 715 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h

[...]

> diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt6358/core.h
> new file mode 100644
> index 0000000..a304aae
> --- /dev/null
> +++ b/include/linux/mfd/mt6358/core.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.

Nit: This needs updating.

Once updated, please apply my:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
