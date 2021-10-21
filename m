Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1DF24366D8
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 17:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhJUP4L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 11:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhJUP4K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 11:56:10 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F3AC061764
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 08:53:53 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so132275wmz.2
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RiUvh0ktpqCA7fZqTGI1aV30cE3yIMDtrq4XdFWDz3c=;
        b=nxj/lswM3BP8tKL+rxtxFVguaNRMLh/Hjxrj5bltEa6eCcDJl12Ha/csvdw8STAA5t
         jnbuCfkdwo11Hx3ctxt+jRCXDWDw473brc53wDYCah3M2OfH4v2GWfSZcwuPD85T1HPl
         hWKnWcdZ+mHgfHJl+TlL+tePN56EN+xf580Y5sOaylG0M85HywFn5fHnb67cJo0nCtIa
         un7to2Z0IuBebbI9xQgF3V1C4vZXLt+0gfUYZOgo4n97bZTTkDO6USGQ7EZN3zabiiKa
         VtClWI0F0OjUZaPsZF/jHMpCc6hO2MKNM1pjLT0rIdNUdR75woY7SkTeNgZ0YYbkrCZG
         ZG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RiUvh0ktpqCA7fZqTGI1aV30cE3yIMDtrq4XdFWDz3c=;
        b=4/QymfUYSfazMXkzeAlXbHKr3qJScFiGRHJJVgyAu1QspwTCNAqiZCG33baCNni/JR
         VOTORG2utWbChLK5RHRUzyDRMyTDqxJLn2jJ7YKib9y7STX3g/ufQSz8Qi0Uc/xQUzvo
         jt3uJc9COyhcADBv8bSX4f7kYQVWEXLvubrg8DQdWAYGPajGmvOKS4Yq/ptK+6HLAXqM
         9l2YApnGxeTssMOGW355zFCoE76+E5PZ8dYX5PzCH0xvCY3lgyCZeig2rX/meJWtbzKg
         obuWT3ct7gDn+izz0LM0Yxc+YhxzJBO2dofozBvtQ1jrCWt8Q4v3xBHbeYYYovUqnw+Y
         BRfQ==
X-Gm-Message-State: AOAM530v80lTE2P6bNE6ckfNsj9F0pGFx90JBuPFm/L7lokyPPbgu6s7
        7lnQUgsUa2HvSb19RcQocs94bA==
X-Google-Smtp-Source: ABdhPJyoyHKkVFQ93CGd5H00pN/2DftHR/6cPv38ILBCxFjUmjec2Asvge3c71IyKbmo65Vu90PmbQ==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr21967132wmj.65.1634831632452;
        Thu, 21 Oct 2021 08:53:52 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id n11sm5217954wrw.43.2021.10.21.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:53:51 -0700 (PDT)
Date:   Thu, 21 Oct 2021 16:53:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/9] mfd: max77686: Correct tab-based alignment of
 register addresses
Message-ID: <YXGNDZCMHYjr2B9s@google.com>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-2-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019145919.7327-2-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 Oct 2021, Luca Ceresoli wrote:

> Some lines have an extra tab, remove them for proper visual alignment as
> present on the rest of this file.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes in v2: none
> ---
>  include/linux/mfd/max77686-private.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
