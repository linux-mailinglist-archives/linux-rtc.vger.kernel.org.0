Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37803D4C5C
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jul 2021 08:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhGYFjD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Jul 2021 01:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhGYFjB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Jul 2021 01:39:01 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30013C061757;
        Sat, 24 Jul 2021 23:19:32 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id nd39so10255808ejc.5;
        Sat, 24 Jul 2021 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIck5SP4jVyfyWHtCecWh4zwWfVoUNkaheu5z8koPZc=;
        b=pbmdZNVOUXjTfsjVf7qh9TY96niljMTq8JtgWGdK1iU9EefgYORGr0cXPQnqU6+CdZ
         NmKki72S8t3AJqXnDCk0kVRNq+BMXQjQo/B7oRLd6q+fszBQBYlfrlSLcFYaIZLz4qSF
         pF+F60DHdwebN3hHmCD0BTnctZb39MVIzxTHuV10HfH2B/oovZU+j5B2dz5l94GyeL5Y
         WEKeTE2YpkU6qOWhPRfK0vvlHpxxC/dXszFW54zTAEMivZ1jQumOSXIMzr2kdVM2BlJw
         kgLNDtiqBHr1u2voncGVFngewh8uN5KZYhndfX3Pix828/gwAMMPvuf76noaTuJq1WgE
         FiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIck5SP4jVyfyWHtCecWh4zwWfVoUNkaheu5z8koPZc=;
        b=lqBTNJ9nW7zIB0xgTvwk6rTiLr/KoGcmWcNyM9eMdhFQrCbOEgnrylr44EjVGlxcEg
         t7Veszy73mTLfV7qrJO4Nb5SGOQXb3M+v6fcmkVXOSbsy7UXjsmioP/0Qru25+EqTOt3
         4BFfSfMUPluBQyAxjqNrGDVQkiFNc6TpQLNQ4QenJ1GNl5woDmzI8s2ysDeZ3F7Sb1v3
         tEWSTTMu0T32aBAiFadm9PXgJKJXLK+9mgzeTTYF1iy9PKW0tpuXDz/VnpsmI8Mjs0t7
         W40iLsr51Tes7iQygEwH6Jzz8AmFOxDe1HwHvOqU5KLNummhFuut+AONN4wypF/B8239
         vb7w==
X-Gm-Message-State: AOAM530wMwFbOkak3sh+amxJfLeZHYxwpRvxbc0Bqj7IqXSpYROvKWUm
        wkLO1JegBc7PdAfehsP5LJM=
X-Google-Smtp-Source: ABdhPJwvaKADTZe2NCTPumx3xxOdd0DnpUqQmexiZg//uPwwcIGHPmJOE5GWDAHKXF2CZbAxRNEAmQ==
X-Received: by 2002:a17:907:1ddb:: with SMTP id og27mr11612506ejc.540.1627193970835;
        Sat, 24 Jul 2021 23:19:30 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id mf1sm2352365ejb.51.2021.07.24.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 23:19:30 -0700 (PDT)
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
Subject: Re: [PATCH v8 07/11] rtc: sun6i: Add Allwinner H616 support
Date:   Sun, 25 Jul 2021 08:19:29 +0200
Message-ID: <3759037.3KSXBDaA9l@kista>
In-Reply-To: <20210723153838.6785-8-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:34 CEST je Andre Przywara napisal(a):
> The H616 RTC changes its day storage to the newly introduced linear day
> scheme, so pair the new compatible string with this feature flag.
> The clock part is missing an external 32768 Hz oscillator input pin,
> for future expansion we must thus ignore any provided clock for now.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


