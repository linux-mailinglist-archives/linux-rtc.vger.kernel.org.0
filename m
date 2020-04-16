Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C16D1ABBBB
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2020 10:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502765AbgDPIwS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Apr 2020 04:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502961AbgDPIvi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Apr 2020 04:51:38 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3A9C061A0C
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2020 01:51:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so3909598wmh.3
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2020 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aQURq1REwHEPMxWj0A/UhXFxGHBPx1Zt6Uxv60umXok=;
        b=iTUUxmnxUoqM1iP5zj7BbzhwKQK2NqYbdVMK0rIh0CiAAy9/it6DIt1DL4Ooif9/bE
         Pul6F77qct+LdTVwj/1QFZe9JzU7U365RE9K2ngJq6+qZ15SxAPXTQR3XQRAdySjswRR
         9JYky000loQpUPX3wnZRvPFFa45uhJxKiqbju2/rslkJy7h3NmXl0ZIYzg2ZbfnCQ5dc
         AsNg7kMa9TiJe/4kUyOORB8GNBgxQrV21VfhsiPqvwyuyliDY3hqDbicfevTFn5hB8rm
         ++qfzQ5FGFbm9rT/GFdYCl8cOGCJR7Yj/AL+Xc5pcZgU+6DZeOb6aSyklfhfqZMu9KiT
         XbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aQURq1REwHEPMxWj0A/UhXFxGHBPx1Zt6Uxv60umXok=;
        b=GOiyJkH5xCBtDcpJRXpX2iXaDEpfVHriCEda/lXUeFNOkp/1KadcuiTCw6zwBlaK8t
         qJQv74T+7GE+VM5CyZ5WBIT4dMtpOiZps5xPNAUz5sIx2AoY2yjKedhaWEipNrHXLwY4
         wkJ2fb0IR3oK1Oct2513Ygxf05MDA3hKF1g3Ri/Uk3b+VmgnTbJ8HizrN1zIg+e7ldPy
         2Tg6sxUoRa2q8Y2uVsOYuIHI3/ou0KkYVMiju8XGPbXdJkdx9To7LSl+IWuhQOXFLpAN
         KZFY8VnAMThQ7NlhMaZy6e8dv9QJEQECgSAi0+YjRub7RuWfDaJvVSeV0bOZ0acDNNwy
         H0Ig==
X-Gm-Message-State: AGi0Pub7Uoq2rziLjmI0lwK+stm8ji4oT6iqUb6xzZV5pQZu9+yJ9xGW
        WNHggESI3qhef2yDjfBjqjDVaQ==
X-Google-Smtp-Source: APiQypKU3qRZVCXuxnBOouk3e3DEAX4zubXTv+zywdpux61f+2SAQwvIpImS075eYrYQxApgGH0znw==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr4036229wmi.52.1587027093347;
        Thu, 16 Apr 2020 01:51:33 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id q8sm2740501wmg.22.2020.04.16.01.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 01:51:32 -0700 (PDT)
Date:   Thu, 16 Apr 2020 09:52:33 +0100
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
Subject: Re: [PATCH v12 2/6] mfd: mt6397: Trim probe function to support
 different chips more cleanly
Message-ID: <20200416085233.GY2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1586333531-21641-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 08 Apr 2020, Hsin-Hsiung Wang wrote:

> Add new struct members for mfd-cells and irq initial function, so we can
> call devm_mfd_add_devices() only once.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
