Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C012034E4
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2020 12:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgFVKcs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 06:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgFVKcs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jun 2020 06:32:48 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5955C061797
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jun 2020 03:32:47 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a6so14151019wrm.4
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jun 2020 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Fa4dCMlEWKxhwtDN8DZa0EBzcvxNGKcUrvu6R1FLLEY=;
        b=avt6c0ad9r5XtZvoCZsUT9m85JMd/pwM+nH7ld0naOBpha7Jkf6u2MGebUC3u2YD7V
         BDMYT+W6hKu/qxgMRTn8CHo4T/t/p+Q2j01eq0Y9+DFvdvgJESLEr2x8xDLexqabk2ir
         +nJJ3xS2rK0L4H/btmt7xfl/v8d/xT/Ehyl6qt6PI75AxA5zoQuH4BxNZi9cajCv9N8Q
         IZNJM4mQnHI3shXQNuuv2UAuIO0mocUXa1lpdH3nQh4ZlwjVC6/JjrDHP455EuaAAx5I
         A4/2mDw8nJMH3QcaFeNdsNrZIuyFYh+mUzdkNEDU05xhWWV3wTzZvIyFtvOXZx1igV3j
         Ow5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fa4dCMlEWKxhwtDN8DZa0EBzcvxNGKcUrvu6R1FLLEY=;
        b=A2TSuZgithrB3ReooNTFfd7Jr82+IyKw3jVlrExy9Xx6XTbeu6gcXy3Rc1UI4jUpE8
         LHErKn/z2CXcNxcgI7KdgckI2C/dnS9MTlDbAdRlDbS7BGGygZXfdjpdM6rvx1LIA6mj
         sUbt6oFHrgKTUbH63G7N7aUnUUvf3Ig7A4xYo9tpwz7W0tQi6MfwrFfYbIt3LDxzhO75
         X5Z86vPRJxSmT8ZdVyXHH4nZBEmu/oLxeBsQ8ZoLlMK/W1xvMGgegwv/K6uF9tlD2qIh
         DUwnkfiBLgH1AfEdMJYCHh+KIw7XNocGHulnDTYVwnafKWTiOLB1Rf33f22+yRYgl73c
         DzFg==
X-Gm-Message-State: AOAM533FPhwSnHIvvYClHvSrp8Qh/fKPY430kfaihUrjupm6gMPNUZmn
        iVywwlcWeqKox15ar51SQvvAWw==
X-Google-Smtp-Source: ABdhPJwX0G/3q4eO7PMMGrf3/EarwYht0K/sahtWaIUqU5krFYZCMH4KP6m8xJqZ1qD6hZbalCZVPQ==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr5666137wrm.193.1592821966276;
        Mon, 22 Jun 2020 03:32:46 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id j6sm15810066wmb.3.2020.06.22.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:32:45 -0700 (PDT)
Date:   Mon, 22 Jun 2020 11:32:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Josua Mayer <josua.mayer@jm0.eu>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 01/10] DT bindings in plain text format
Message-ID: <20200622103243.GT954398@dell>
References: <20200620223915.1311485-1-j.neuschaefer@gmx.net>
 <20200620223915.1311485-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200620223915.1311485-2-j.neuschaefer@gmx.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 21 Jun 2020, Jonathan Neuschäfer wrote:

> For reference, here are the devicetree bindings in plaintext format.
> (Not for merge.)

This would be better placed inside the relevant patch(es), rather than
in a separate non-mergeable extra/superfluous patch.

> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../bindings/mfd/netronix,ntxec.txt           | 58 +++++++++++++++++++
>  .../bindings/pwm/netronix,ntxec-pwm.txt       | 27 +++++++++
>  .../bindings/rtc/netronix,ntxec-rtc.txt       | 17 ++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/netronix,ntxec.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/netronix,ntxec-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/netronix,ntxec-rtc.txt

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
