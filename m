Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1804812097E
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 16:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbfLPPU0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 10:20:26 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40565 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbfLPPUX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Dec 2019 10:20:23 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so7752672wrn.7
        for <linux-rtc@vger.kernel.org>; Mon, 16 Dec 2019 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yKFHERdNdPN6Ex8JOu2in3qBAjlasmuEZDq7sRDudK0=;
        b=GW+qXcq4BZ5dkIThObt2lOqawmLIk3OWXTb/8HhvjYhT072tqZEPE5CZw2zJVCuca6
         97PO7Bucb15eOo9VR5dF8osj4RSOlIeLX8dELi2xEhj+uiMZIrr8ldSDwNd26lrbapFG
         U1/x43PLG29ouKCNZ63dCgsxfaGOPqSYNesWjbPMg/tsXCHHgFF/MvK7b8gFdVfJK0T6
         qT3lq19j8new3QRUhZc03HP3qQq3iq4uRkcCSV+0ZY0/4+lYd+tXPuRysNY3gX2QKAG/
         WVORCiSTVnvWKKlgh3q6OmERq1GOtnmorsvYfRGuN6kVfxIsC+TiIb91EkGIxzLdXHTM
         aIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yKFHERdNdPN6Ex8JOu2in3qBAjlasmuEZDq7sRDudK0=;
        b=uHU4L7An2yz1d4JrzGFMCkdz4TW+W+jhAputRSf0UilpOesoo8QzxftjKpsgo71EeJ
         m+0IIpwQGyNyIU5UimbFkC2VJooX5+Ir/S40JKcLZ9GVVpazmRfIgX9XcyZRgaYWBN6d
         hAMP9ogybnD+xkTRhEKDP1KhOHwu8ncR2EIII8tfvcy4GUrz0hAgM/8topw93LimjJHg
         MlKbU5NTO5wrIYZvtKaDLQuFLAZSdBXfwEbM6O/5fEoC44HAQ/1paiVYYmorEywp+00J
         lm8UpFciUVJ/x6Qlv8E93zt5c/OISpNyb56gE5PI1ThKB/gDR+mlYFQ6ILHdNo24QjU5
         eakw==
X-Gm-Message-State: APjAAAV++K4ZTR/3Xpi97Xdqy9h3D4hoUywXn4dNYow87NwbNI4GiPcw
        bBTsW3MYQjis1hskVq1Wd1Z9zg==
X-Google-Smtp-Source: APXvYqy1jbVR7FkN0kaR1W+4ZJ9ENvko5dMwnYV5wp0d91OQNJTU1+OxRy+dD9MAF1z6WCEDFVuptw==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr31600584wru.170.1576509621307;
        Mon, 16 Dec 2019 07:20:21 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id l2sm20713536wmi.5.2019.12.16.07.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 07:20:20 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:20:19 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josef Friedl <josef.friedl@speed.at>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Ran Bi <ran.bi@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v7 1/6] mfd: mt6397: modify suspend/resume behavior
Message-ID: <20191216152019.GE2369@dell>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1576057435-3561-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1576057435-3561-2-git-send-email-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Dec 2019, Hsin-Hsiung Wang wrote:

> Some pmics don't need backup interrupt settings, so we change to use
> pm notifier for the pmics which are necessary to store settings.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c       | 30 ------------------------------
>  drivers/mfd/mt6397-irq.c        | 33 +++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h |  2 ++
>  3 files changed, 35 insertions(+), 30 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
