Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3F03D4C28
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jul 2021 07:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhGYFLC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Jul 2021 01:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhGYFLB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Jul 2021 01:11:01 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993F9C061757;
        Sat, 24 Jul 2021 22:51:31 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id l6so5147514edc.5;
        Sat, 24 Jul 2021 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHRp36bG7u+FDs07iyp7QzfPeLS/I55OgAKDF8o9L94=;
        b=FZOPUJR1gQbr22sAT5Saa+mI22aj6qruvYvSs7/wIydCI6ebW1KtLYSILQMlvbenhB
         EjO8eU+szBhrfNefXbiPc1J3lIi5BV9cECBAdd0EhZMkNMQ4c5zJuYVrEHKTjGVcX3cK
         dKYDJs7neavGxXy8QYHzo12oBgHLhwLKivtOdyDH6kRbKKCIfKoWE5gAUEp5mxmu4jrI
         bfqGo+G00yWMtsC03MdGaMklz7VgAGPEH7brzWu/CC/IBGbJeuXzR1820u5TDq1O/hHP
         JoDY9kswbb1IZ0lbJIWW+56YREJWNcta7618eFGWNlHkDi9GJW8URzW+uKbhdfRtHsPY
         Yynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHRp36bG7u+FDs07iyp7QzfPeLS/I55OgAKDF8o9L94=;
        b=DimHVUDU61ZcoY9SQB6knAEWQbJPStns6RT0SWSucItTe7TjzvuleA7H9Nmskd89ub
         Jp2hBxexxhOnsg+wKauRlpaM54LdbczYaZcFIlFgUCmAjmGvoB7d0Jzd/1r6mPOsGCom
         gQNp15uK/pyTwq7cOC8di92UWTqIdJSqdyNiETUfCkyObYD69iE+VNaNpAi0QBuYx21K
         MIYJAzKxyYkDOfnoK2GxVtGNFmyb3l9nV22k6+J2mLo6Rapdmyf1Yuc7M1DfU2+5PIt7
         i6ncJ83FFF2C4w9G4YKt72kpNQql4/RHaMpeWF0HkDziUezvipM/jGdtSO5sFXBgzpzl
         IBlg==
X-Gm-Message-State: AOAM533Zsp7LojjLE3EXt1P2xlQAvaBAC/1AT0bU8SIsePSrfBgqyl9e
        knzyqxiN9ZJZFgE5z990vBQ=
X-Google-Smtp-Source: ABdhPJzBif2Cr3WzuHeQVHxcmoB882c4Z1w13ZVQVWoBKMdPjMB6SiODhbMqbZA2/zvIzxObdMgnCA==
X-Received: by 2002:a05:6402:22c6:: with SMTP id dm6mr14793005edb.228.1627192290109;
        Sat, 24 Jul 2021 22:51:30 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id n17sm135390edr.84.2021.07.24.22.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 22:51:29 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 04/11] rtc: sun6i: Add support for linear day storage
Date:   Sun, 25 Jul 2021 07:51:28 +0200
Message-ID: <2045295.MUk6NRVmsd@kista>
In-Reply-To: <20210723153838.6785-5-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:31 CEST je Andre Przywara napisal(a):
> Newer versions of the Allwinner RTC, as for instance found in the H616
> SoC, no longer store a broken-down day/month/year representation in the
> RTC_DAY_REG, but just a linear day number.
> The user manual does not give any indication about the expected epoch
> time of this day count, but the BSP kernel uses the UNIX epoch, which
> allows easy support due to existing conversion functions in the kernel.
> 
> Allow tagging a compatible string with a flag, and use that to mark
> those new RTCs. Then convert between a UNIX day number (converted into
> seconds) and the broken-down day representation using mktime64() and
> time64_to_tm() in the set_time/get_time functions.
> 
> That enables support for the RTC in those new chips.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 66 +++++++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 22 deletions(-)

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


