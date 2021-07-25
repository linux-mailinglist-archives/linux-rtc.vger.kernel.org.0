Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674E03D4C22
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jul 2021 07:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhGYFDj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Jul 2021 01:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhGYFDi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Jul 2021 01:03:38 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD6DC061757;
        Sat, 24 Jul 2021 22:44:08 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id jg2so5289486ejc.0;
        Sat, 24 Jul 2021 22:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QY+0BMkWlbBZLf8NjCu4UdB1W7Kp1V1Npts+uGib5k0=;
        b=OfKZvg5r05dTZaCPK0J/uk+0iq15RC9aVhh+9wIn3Do1byv+UFxgsOcGbtaLwKOvpj
         shkfpu7yLasiWRO875xuBO62BFWrWFuO12hDAb9oIitKl6xaeQ2eOIcnOq3kKyn5OHi6
         NHqT/DyjCwv/DuaZedahmVWF5bXGePbfEs5ECMtoLG9jQsAdWnhwhk3mAr5jYPVBx72H
         WpK5Oszt+rWg/JjqOyMhNNsDj2XrcVlb8ChRzP/klbouEavFxiQpqBaNg+aOgDnBHf40
         5/f6yhT4HkfaqkTHQltP/s7TgsLx+J/WyNWFnLlSzJssNNFZ6eLwsgpnEnHG4G2tG+t6
         CWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QY+0BMkWlbBZLf8NjCu4UdB1W7Kp1V1Npts+uGib5k0=;
        b=pUI9Vte/I+fAJb0CwKkVsIrlApHtsltLGfPxG4QidcHUhyyAfx+EFJ6ETHYHeYhTsT
         08WySgj3CgSeu6GjrfeCrWnkHDFG7bauxwJob9NuxMqPf4Z3pfarqZDq80Kjlv2LuJv0
         86tF3DGLcUP8Fr3mgTGGmRH62rStUZl6xv2BLz9HJgUeTSKL7savEKGwpC0cmkgk2Q5A
         LfjC5MyfxATKAHRcUXNNj0onsoHSaDAAxPjqGJJNXORxIinRpAZGgFpNUk48sutyk1ea
         DvC09XDMo1F9uGaXxeLIaVSfp1ht6jO0cmew5CJW9l5S303S+pCJrPhRwXMMBKI49vn9
         rlVw==
X-Gm-Message-State: AOAM532DZovYPvhs6w2z6XBkyBXIh22XOV3h3lEeTK5cqjmgHo6S/Amg
        J3kVrAuJkdgBl2INBfOGNs14wtRtFPBXmfgt
X-Google-Smtp-Source: ABdhPJznzroxcAGpmNL3owvGqD5iDjbHdakw9PGzF8T5rjlETybHcPm7OqrxGEby6yJN4NtOxlbqsA==
X-Received: by 2002:a17:906:24d3:: with SMTP id f19mr654767ejb.391.1627191847250;
        Sat, 24 Jul 2021 22:44:07 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id op23sm13069188ejb.7.2021.07.24.22.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 22:44:06 -0700 (PDT)
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
Subject: Re: [PATCH v8 03/11] rtc: sun6i: Fix time overflow handling
Date:   Sun, 25 Jul 2021 07:44:05 +0200
Message-ID: <2672991.hCPy0aSqvS@kista>
In-Reply-To: <20210723153838.6785-4-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:30 CEST je Andre Przywara napisal(a):
> Using "unsigned long" for UNIX timestamps is never a good idea, and
> comparing the value of such a variable against U32_MAX does not do
> anything useful on 32-bit systems.
> 
> Use the proper time64_t type when dealing with timestamps, and avoid
> cutting down the time range unnecessarily. This also fixes the flawed
> check for the alarm time being too far into the future.
> 
> The check for this condition is actually somewhat theoretical, as the
> RTC counts till 2033 only anyways, and 2^32 seconds from now is not
> before the year 2157 - at which point I hope nobody will be using this
> hardware anymore.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


