Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF8728466C
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Oct 2020 08:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgJFG6a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Oct 2020 02:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgJFG63 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 6 Oct 2020 02:58:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E33C0613D3
        for <linux-rtc@vger.kernel.org>; Mon,  5 Oct 2020 23:58:28 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f21so1742023wml.3
        for <linux-rtc@vger.kernel.org>; Mon, 05 Oct 2020 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hye8oZPllXv0LLz+UWG2B82nJ6IN2QnHfKrsEX8XCOU=;
        b=jn2dIC4KneJcMCE5DY3o93rmWgdTmK7NJWwKNWGocC7HbxwqveIdxS9nVru8ryq+P9
         s4//ef94qJ6Y8ujWnpglPZlIlD6sJ33blfTKKcaCdwJolql9IFEUfzJMHCTe1JnaG8Iw
         b+YeHxV9DI6DSD3tgOAF3IaWem5VxRfAN0ODuGo/qw2A8ReI6qDWtdlFFibEvRuFiEoQ
         dhilbFbgvuG8V67ydtdAffL1xmKMRbv76Ctys34uqkoMVb3gFX2RETn3H/bHFtSxghuV
         ji7JhUukKOJOEajfS3LrzYX2Rf2L6FpU2JZ9jHfMZk5oQaZMZKMZfy/k1RR5/u729NJu
         K0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hye8oZPllXv0LLz+UWG2B82nJ6IN2QnHfKrsEX8XCOU=;
        b=Oc+s8+tL4qD8NvfH3hKB/KhepF675jR0HuFh8sMDAxlMWWEsf6r4eZvJ/XThc3BVD8
         JbR9jzdRJWVZtmPqfx00cuAI47Rk1MHCbCSKiRkuKDnvadATXARPlCtxvwu58OtAxQoE
         qPP1uCiiA0EswVDYm4AcE4tDCkK09qUP9Iy81kiXjBB6mObitAMg4GzcI3mV0QQnVVLd
         itptqID/qLFoWjcCMD/sifqWMC/eVp7xseP2tFLmhNh6y6X+WovGofYFNkCeSwDlIdQc
         cUrkK+QanpHx+KJSIYCksGS4o9yU1XJhPdyjrrgPz4o0uWKPe6POxd+rdhtfOu4yNb+1
         jrWg==
X-Gm-Message-State: AOAM530rHhrQKtXbfjkCzEBqAXGs5QbLwOSMr+1v5dAi+rjAJy480EFG
        wispbMGafY8j7DdxGmfJK3cOVw==
X-Google-Smtp-Source: ABdhPJxsvKtzCqkv4fxGZg3y/AIgf4rU1S8D4EatsKLRXGnqjE4r6Ftdz8iBdl2gfcmAi+GG7YDezw==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr3211564wms.77.1601967506851;
        Mon, 05 Oct 2020 23:58:26 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id u12sm3158245wrt.81.2020.10.05.23.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 23:58:26 -0700 (PDT)
Date:   Tue, 6 Oct 2020 07:58:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201006065820.GY6148@dell>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 05 Oct 2020, Rob Herring wrote:

> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
