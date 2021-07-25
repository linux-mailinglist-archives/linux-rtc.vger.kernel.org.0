Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEFF3D4C59
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jul 2021 08:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhGYFh4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Jul 2021 01:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhGYFh4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Jul 2021 01:37:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28312C061757;
        Sat, 24 Jul 2021 23:18:26 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id he41so10229942ejc.6;
        Sat, 24 Jul 2021 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H84xqmHa11HAMqr9XluZ8mJDnlXU0Q8/GhOSAy8zvbM=;
        b=cmQOMOf2zHkdTV4I/WOFI3ckqJfmc0ANzqy+eZw5qW+Nt6w8J1fEHJOxe4RHIbuXAR
         2tWnXZMKI7qcJdKAJeLBtnqFveIzRAmW5Dq8+RSzHTWCtkqA9XQYdOS88imW/BIYt2x8
         nNMOeNSwJJVdz5e6ADwVsy7rSWdbW73lRwbz7x8oxQxrL8JrxXcD/jYy/AOcC58KZqmJ
         KDeGPw3KhZDFvLIyETypvOJ9vF2Jx9iwuyIIRBSglTHdDjVc9h1zKkZo2tIyllDz/mdH
         uCV9iMU6SBDknoDJlE0lhEqOMGi7jsSsPO5tSWlIuFIagF3osnOtT7iU/kVmTtkIndX5
         aoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H84xqmHa11HAMqr9XluZ8mJDnlXU0Q8/GhOSAy8zvbM=;
        b=RlVx2PqDb7OJatqZDLpAxA3fYUCUHS244bs2VBR++WWT/gfDf2/DO1I3Evp9LFxrLe
         54BuQUw2HXNv5tJNcHlqpsmDb5PEHq6ysATjfeLJ74gqKgL3zxqcyv7/BZQ/9nYSZ8f4
         XUJLhkzVKRSbPyNSPVh93ppJukt4snxFXzT+zBxwaLfX2EbhkWg3ATmfsRcHttR0f9jb
         uYxznZJnBdhFvkRLKyGKIg1SZ3H02Je2VboetYnOXRS39Lc+4LgOS9A+8udJFQniW0IG
         tbQnLY+o6pDYeEaa32VRDeiTlfMm6km9cFlWCdnocvHhw2xgDZiPNEgf4IiWY5IMJges
         cShw==
X-Gm-Message-State: AOAM530gU7Aqy8P62YGn3vB585yShmvfi1vDRT1sE08PIZdp+9hzxANO
        arpCbqjZSkEfUsYVNlEhbvE=
X-Google-Smtp-Source: ABdhPJxmktaNZZWpA+AkVzso45vOYilURFR4DO15pvLqar0nqql5+tqf/hzTtJ+kgzkAffPjCdcAuw==
X-Received: by 2002:a17:906:58c9:: with SMTP id e9mr11821418ejs.144.1627193904701;
        Sat, 24 Jul 2021 23:18:24 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id ja13sm13028177ejc.82.2021.07.24.23.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 23:18:24 -0700 (PDT)
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
Subject: Re: [PATCH v8 06/11] rtc: sun6i: Add support for RTCs without external LOSCs
Date:   Sun, 25 Jul 2021 08:18:23 +0200
Message-ID: <3166830.bveH9cQ5e6@kista>
In-Reply-To: <20210723153838.6785-7-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:33 CEST je Andre Przywara napisal(a):
> Some newer Allwinner RTCs (for instance the one in the H616 SoC) lack
> a pin for an external 32768 Hz oscillator. As a consequence, this LOSC
> can't be selected as the RTC clock source, and we must rely on the
> internal RC oscillator.
> To allow additions of clocks to the RTC node, add a feature bit to ignore
> any provided clocks for now (the current code would think this is the
> external LOSC). Later DTs and code can then for instance add the PLL
> based clock input, and older kernel won't get confused.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


