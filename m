Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B24F38D42A
	for <lists+linux-rtc@lfdr.de>; Sat, 22 May 2021 09:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhEVH1j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 22 May 2021 03:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhEVH1j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 22 May 2021 03:27:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE34C061574;
        Sat, 22 May 2021 00:26:15 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z130so12251646wmg.2;
        Sat, 22 May 2021 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oye/WdclhJDwP8mPkPCr9y4H1Z7zAK3xEJR1qvBeaso=;
        b=GDjzLdq47HCYuvEWQ4b6OsetImXmuisYOOQ/Cs2rqsaU5xIMzazg2ZyVBwVtTwtfAc
         TY9bP0852THvyYYutJ6qFm3gMjrUSVc87+YlBbo2Ev63mhbk7tnS4QfU1QvM3roGOSjF
         v6wxwxgH3o7gAah1WiDaXISCEqUFjNPfc9GHvHkdg6TKZB9lbg7QiOlyugIg3ZJFVDv/
         MVPgSrdfhuw+XDjQHV9xlL4bOqWmnM+1/w+e6/1r3+0YPuTPZfaj8+cURvmNIjcwM193
         LAyuN5P2YjXc1TR6UUyBwk/M7GJ7oOUDlLXDNLvzU1BwvuSchXJoDEL+OAn/Ipn910e4
         ZnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oye/WdclhJDwP8mPkPCr9y4H1Z7zAK3xEJR1qvBeaso=;
        b=Xvl3L8RaLowmfdeRGpvNjv30ZTSbg1hu+b5oYMXVylLsvWZQmMpvGVK5JiZ/v5ROay
         ymgc9L54MmFPkz7l9VKSS/NJV25n3zohGg6liDnBCXFGXyRbjaXY382Ifa7TdafAi42c
         JdhbU1QlVpq++FFHveVWG39f0lrSD3Jeuf8GzMqil6aLNqHTX9OmCQrTi44ZgGbEs5OO
         4lXJeynF+H59kXYgzxO8uD6Q0Zf43iDLd/k0YLRZXg9FElLkMIrXEJtxgzARegI7ybBq
         TF5viK3CsKtnaHMZ3x2yvi5mrQ13DIEITBpcg3HfFWXeAUyJkWOBZBsDv4M073iKky2+
         dstQ==
X-Gm-Message-State: AOAM533pT/PcPG9yib3ydYsNOBoLOtFt8U8XD2m/CTfwHGoolDBZKHEV
        4/kYFH1trsW17ziPdH1BfBs=
X-Google-Smtp-Source: ABdhPJzewLyrbdH2kx6GO+S9lB4qsB4HBQ/ZQpVFtt7r3rnL9WrC1zhP3+rIYl4JM/D/IIEo7ShgJw==
X-Received: by 2002:a1c:49c6:: with SMTP id w189mr11727864wma.108.1621668373488;
        Sat, 22 May 2021 00:26:13 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id k205sm1781849wmf.13.2021.05.22.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 00:26:12 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 04/17] rtc: sun6i: Add support for linear day storage
Date:   Sat, 22 May 2021 09:26:11 +0200
Message-ID: <5920087.Glgd6ahW17@kista>
In-Reply-To: <20210519104152.21119-5-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com> <20210519104152.21119-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andre!

Dne sreda, 19. maj 2021 ob 12:41:39 CEST je Andre Przywara napisal(a):
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
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Change ^ to Signed-of-by. After that, you can add:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


