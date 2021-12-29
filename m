Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66C4481473
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Dec 2021 16:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240489AbhL2P1k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Dec 2021 10:27:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbhL2P1k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Dec 2021 10:27:40 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A600BC06173E
        for <linux-rtc@vger.kernel.org>; Wed, 29 Dec 2021 07:27:39 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t26so45093777wrb.4
        for <linux-rtc@vger.kernel.org>; Wed, 29 Dec 2021 07:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WHa8Jyh6c89t9dPID2nZm5LqqV4uIWhGTO8DKv0H6Ao=;
        b=PJOEOwqEqa2fEdtdWRkd1eiOel6ilsVpbyFJdZbhB7fzeELs8O2xsQIssnE4UEh+I7
         Lcl7EhwhdzV43KdE9doEGv/HmUAQ+IGnSDMS/H+41qwp7iTXj0uLSmIvfMLFCqTHCYpx
         8VFArzE0XbPkdNQ6ml8Fn9n+2LeZ8Kj3+JZgzuqtkVq+naSaO9wRfXB4TPKO3R8eNoY2
         lf3AOIhjJwlxHzRWCwql522offjA2wXLMsNG1zyTgS7Cwqqx3J22RhJkQVk1lHGFd44B
         uWXeaL8T7UQhehfYTJ/pR09w9TYV5PjxzgqpKtSm6Y4lnNrLapgSWFsjejGtfImF+4d2
         9Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WHa8Jyh6c89t9dPID2nZm5LqqV4uIWhGTO8DKv0H6Ao=;
        b=Y+VqvgBO9GiutTTZJSmsLtii2ddcpMfnaMijY/ZSmHQuPZtTXyxFVfgbxxLgBZEVJG
         95nt2hU+ECNcWtfU43JfjSTNyoPbKFIpp9+w26ffFxAQzbYvHW24whBB4Q5dszYqIp4m
         G7LJPyx+WURqjQHPtzmU8yDO3lOL75bsyAYw74yR+/PKIJilIBPPCXHep2GAhiw6Bmi5
         +Hb13kQS3ibc1iLFM8Ila0mqq11F72RyHzmcEO2ECULiIVAf1+m5ADqChNX6w4FdeII6
         1DkwAZbAu431+ZDQmLwHtQUR5Fv1ivw/csB+vuUA3Ooqrf5+SWv0nLqSGSHQNchoiz+3
         M23w==
X-Gm-Message-State: AOAM531eSLEmTJ3aQeKr15XVviCDSu5A+fKb7SW8qLZ6QAPLlYTYjMW5
        +E9RGNHmaBeZZj9Zc/khCDyOWg==
X-Google-Smtp-Source: ABdhPJxUsRB6IangB9deRG2yXTmRk0Pg7TrNIFOe0nWjvnXVOUPrpq4N2LGQiDWxSUY8ra+GTM++8w==
X-Received: by 2002:a05:6000:1112:: with SMTP id z18mr20750612wrw.129.1640791658229;
        Wed, 29 Dec 2021 07:27:38 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id g6sm21576891wri.67.2021.12.29.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:27:37 -0800 (PST)
Date:   Wed, 29 Dec 2021 15:27:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Fix typo "DA9093" -> "DA9063"
Message-ID: <Ycx+Z4qpbDSIqBSX@google.com>
References: <20211216164037.2888316-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216164037.2888316-1-alexandre.ghiti@canonical.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 16 Dec 2021, Alexandre Ghiti wrote:

> The device described is the "DA9063", not "DA9093", so fix this typo.
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  Documentation/devicetree/bindings/mfd/da9063.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
