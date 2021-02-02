Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8419830BDB2
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 13:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhBBMHd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 07:07:33 -0500
Received: from mail-ed1-f46.google.com ([209.85.208.46]:35049 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhBBMHa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 07:07:30 -0500
Received: by mail-ed1-f46.google.com with SMTP id g10so4331571eds.2;
        Tue, 02 Feb 2021 04:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6abidnGHa15Gx8W1zIwgQF+KmfT0LbfR/yfssT4cxWE=;
        b=NGf1hp6ucqaSt5ECYJn2R6cxSNC5tZfHBByfxPfUkYJlFCcWRcBRkw2gVzNwEv0/pN
         8gSNtPqIdvVGPmCLMiXQlOOi/brAACbkQ7i7SrZ6ExLHoR+hvdDGSTsLLkUITWmrwMAu
         Sf4fOqi9yvrI5unfDXrZlQPQ1LohcdzO8GLzMkgZRm9SFECHl11CPjXjX+iwm66yl/Ex
         b2+0T7LZa88FVscnZa0W4pjfJ6JmPUs7mwqPBBxiL5AfHJydgLE+hARcxL9gZiDYHtOI
         bJKqdLBYrivZ01qv4Zsc9ZUiq8YYV0wrEUab9BGvkJTxpvTStm+Jr9eGDwVqyi9sUNbx
         OIkQ==
X-Gm-Message-State: AOAM533YAeXNTISAP8f+J2trqMiPlCkdUxFBasJ3OmsGSYL67Olv6W7c
        Zq66ZK1RkbZfPWuRjlSA/t8=
X-Google-Smtp-Source: ABdhPJx9A0SsibYdZdG1ZhPfG9XOPzZNowtWMTPTptLNvfi1m/j7ob0OgHD8Qrho1IZ8oVC/y8ha2A==
X-Received: by 2002:aa7:d8c9:: with SMTP id k9mr7089489eds.366.1612267608773;
        Tue, 02 Feb 2021 04:06:48 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id w24sm3303274ejn.36.2021.02.02.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 04:06:47 -0800 (PST)
Date:   Tue, 2 Feb 2021 13:06:45 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: s3c: quiet maybe-unused variable warning
Message-ID: <20210202120645.2ycd3txtgmknavuw@kozik-lap>
References: <20210202112934.3612726-1-alexandre.belloni@bootlin.com>
 <20210202112934.3612726-2-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210202112934.3612726-2-alexandre.belloni@bootlin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Feb 02, 2021 at 12:29:34PM +0100, Alexandre Belloni wrote:
> When CONFIG_OF is disabled then the matching table is not referenced.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
