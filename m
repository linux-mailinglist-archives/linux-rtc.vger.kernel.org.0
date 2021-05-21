Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB40638BBB7
	for <lists+linux-rtc@lfdr.de>; Fri, 21 May 2021 03:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237119AbhEUBlL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 May 2021 21:41:11 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:46666 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237113AbhEUBlK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 May 2021 21:41:10 -0400
Received: by mail-oo1-f47.google.com with SMTP id o14-20020a4a384e0000b029020ec48a2358so2148827oof.13;
        Thu, 20 May 2021 18:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=twIIkTMnAszhUEiU17DepvUWRNVDKbFl4+4yGD34k5k=;
        b=IFTIgrxA9FhPDyIn2Z/WxKtmcyV5NZg1tPY3chg+OlQgAe6tOCwFRA6L91DpIQxqqA
         peqhIow9MYjyXDwm8wwnGOmgNJGI9XXM2m34ft9Vg1vrwSRkBxvFGjIRlGwl4PS4zFXn
         KSJbDy6hp8F4HTd3daoZWh7jIiGXVuHsxXhMqNbrvYwOC0HqxWXn4ukEsKZ2OmnM+OkH
         CzoNCud0g3cDJFpZt1GZQ9sbzmmDcD2qthU29SlyaGSyByYp2tZtcrIIlhQMtv6Fu2pb
         Vf+TkYDtxBLipuWtjw1SaAsXqtIuX985iaQIounXPR5J2qLxo0VS7ZCmxpOqCxKIYqxf
         V7Ww==
X-Gm-Message-State: AOAM532uDmaaTEf2UQ+33XCUbOwXLxMasW7sJUV9EuSUnsnMfme46K3s
        gtwed24kmXqOO4hbuIiyTW7NMA4Jkg==
X-Google-Smtp-Source: ABdhPJywIEAjV6PJzo8otOaFuoJTJP8F5lzBvqeWyHUM5mp/ztXEA4AwjUCsGAT4m4e2e6pn3Bu5gQ==
X-Received: by 2002:a4a:88f2:: with SMTP id q47mr5943925ooh.30.1621561186891;
        Thu, 20 May 2021 18:39:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n11sm615941oom.1.2021.05.20.18.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:39:46 -0700 (PDT)
Received: (nullmailer pid 2460455 invoked by uid 1000);
        Fri, 21 May 2021 01:39:45 -0000
Date:   Thu, 20 May 2021 20:39:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210521013945.GA2460400@robh.at.kernel.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519104152.21119-4-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 19 May 2021 11:41:38 +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
