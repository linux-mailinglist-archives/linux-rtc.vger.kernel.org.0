Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B213D42F8
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Jul 2021 00:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhGWVxr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Jul 2021 17:53:47 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:36522 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhGWVxr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Jul 2021 17:53:47 -0400
Received: by mail-io1-f51.google.com with SMTP id f11so4347746ioj.3;
        Fri, 23 Jul 2021 15:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TH8NwjgGNKw31GPwobc3YtH8dzN1b3PNVMnoYDbP9Ac=;
        b=on/aNDOw50jRFf43Ch4+CQa6cQjDWfoW2+UdzbDjf7LRD92zue1r3Aaqk2HkrF8ljo
         GuWjWc2IhBj9t2eegTxHB+AzL4O/oJfQwKo3DIqJl3RRrWLE/pKCDou41p2pHJJPZwLg
         brGVykxccaAS4ZmUg9bIMX2O63zkL1gJN/dG2ThvN7oyPvDSHdCaZ+hkQRYOoPtI1djv
         x1XOGa62njUx9H0T/oHwWtH51yEkEhtZaryDEEG0bLnqP5L54m7N3p6AAxvAnE+6BjKj
         k9B1B5oniSMrmaAv1bK1k1tzBiVZn2fRo14zGmB2ul8lwIx+U9XbUG0oPoJDG1Kqa+TI
         pX1g==
X-Gm-Message-State: AOAM530z9YmtE/WpGOT7sx1SRr6m8C7bG5cK8X1UbQmR/utC1HtF8ACN
        TaRWj7KUY8E+2o4BNYFkwg==
X-Google-Smtp-Source: ABdhPJwzpsRPOsz04Ypu007vBvjX5yFZSviP6hLL5hNmsePLTO1V8PzlfehOcPfRXr/M+oL6QZguHA==
X-Received: by 2002:a05:6638:3460:: with SMTP id q32mr5887409jav.70.1627079658991;
        Fri, 23 Jul 2021 15:34:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z18sm16639874ilp.68.2021.07.23.15.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:34:18 -0700 (PDT)
Received: (nullmailer pid 2724681 invoked by uid 1000);
        Fri, 23 Jul 2021 22:34:16 -0000
Date:   Fri, 23 Jul 2021 16:34:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <icenowy@aosc.io>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
        Ondrej Jirman <megous@megous.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v8 02/11] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210723223416.GA2724623@robh.at.kernel.org>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723153838.6785-3-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 23 Jul 2021 16:38:29 +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding.
> The actual RTC part of the device uses a different day/month/year
> storage scheme, so it's not compatible with the previous devices.
> Also the clock part is quite different, as there is no external 32K LOSC
> oscillator input.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
