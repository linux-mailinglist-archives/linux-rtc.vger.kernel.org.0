Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391573D0FC8
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jul 2021 15:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238104AbhGUNBb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Jul 2021 09:01:31 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:37843 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238587AbhGUNBK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Jul 2021 09:01:10 -0400
Received: by mail-io1-f43.google.com with SMTP id r18so2389800iot.4;
        Wed, 21 Jul 2021 06:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=KEcNM05hAV/bUpQFjkQJfyPHgSoI0NrQQwwCVIQKpSI=;
        b=H2OdpDdiBmG89qhcyO13IWRISCB0KKehfi2gw1oLUPDdzi3qLg3rF2+9jyKp4LGtDE
         nLEw/VxBRaus9hiY5Nn90J6m0yeL66n8hbJdC8SdpZlVv5tCYfInab6NeyuEtRW+Rlez
         Nnrmxn2b2O3OE17qgN4C92hBM6VW/B9IxTNDV6NIaboE5m7VKHT5jSmYTCuKNHvuUpRc
         a436I0Ir8aNNnuBQsHcJvRzNL6ST5MeC5pro4bdUMWW5AhMUgGMPWUHFhbuRPOVWsHnV
         vmrQkAQrA/o5F8vCn5mc6/UFHVdReisLPaQ5dr9ud0XTgKoozAyedKFq7Ve9XstCgTip
         dpGA==
X-Gm-Message-State: AOAM533c9qXNwbBvMv4e945iaqtwM8/CgvfbX9U8cZeCHqGRQwVKI2Jq
        7HqAdV+KBTpY/fDDdzF+mg==
X-Google-Smtp-Source: ABdhPJxzRF5CTTIes7TdGyv5ZT/q6dcuiCWSwD4gd9FEJkUAjaXUzxiU/o0bwQ1dNmuQg5mOv5C1ag==
X-Received: by 2002:a6b:b2d7:: with SMTP id b206mr26848213iof.155.1626874906364;
        Wed, 21 Jul 2021 06:41:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m184sm14330857ioa.17.2021.07.21.06.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:41:45 -0700 (PDT)
Received: (nullmailer pid 2187177 invoked by uid 1000);
        Wed, 21 Jul 2021 13:41:42 -0000
From:   Rob Herring <robh@kernel.org>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     devicetree@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210720172251.4504-2-romain.perier@gmail.com>
References: <20210720172251.4504-1-romain.perier@gmail.com> <20210720172251.4504-2-romain.perier@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
Date:   Wed, 21 Jul 2021 07:41:42 -0600
Message-Id: <1626874902.819807.2187176.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 20 Jul 2021 19:22:49 +0200, Romain Perier wrote:
> This adds the documentation for the devicetree bindings of the Mstar
> MSC313e RTC driver, found from MSC313e SoCs and newer.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  .../bindings/rtc/mstar,msc313-rtc.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.example.dts:23.46-47 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1507685

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

