Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFEE460C49
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Nov 2021 02:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbhK2BgV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Nov 2021 20:36:21 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:42524 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbhK2BeU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Nov 2021 20:34:20 -0500
Received: by mail-ot1-f45.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so23274106otv.9;
        Sun, 28 Nov 2021 17:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yuIIzswFUnhvz0vYtUmOo6fxmiYVeZ1BcocfPx8Cer0=;
        b=TmIzQ2EIMcX38nRJpXNpOJSaLTr49uqxbzqHHxYlGx0tk4+ECz2jxxJLiSPm5OhPyV
         wjnj3vSU2f8LYt7vh6jMFJcX/CxRezV3jVUmnjP/+9+QYu/PjFU9vnXxb2vgmf5IRPfK
         Vb5xu1sU5erz88yatwOLVFyvB5iC2J5EPjFcRsyGUnuqYD3ZTe2hziun1NPBd9HOemRx
         OTGFaZRx8e/HOZ8w3Qdm6MLEUZrXeVq/Y0nH9tcB86fwpvq3WThJHOeVNCjA64TG+vfK
         K/c7vm4+5FEkRRE0QIT8WyzBoQaKbDWSNMhR32oSJPur7q198rHpSAmi21QQ7yrrMe19
         nTyg==
X-Gm-Message-State: AOAM532IUmJguNmvxkvc9Na88vGtCNiUzilZRAbDIwoYFzWRQ4JEnOLz
        ms2b5N0SMIjabgkOrMGloA==
X-Google-Smtp-Source: ABdhPJxNqsJLNITH3dadj8Cskxno577tzHZOr8BseIopy2fnI1hRPHMJoCRM9iNy5zKKsWm9ZaB2/g==
X-Received: by 2002:a9d:1727:: with SMTP id i39mr40387654ota.48.1638149463653;
        Sun, 28 Nov 2021 17:31:03 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id g24sm2421582oti.19.2021.11.28.17.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:31:03 -0800 (PST)
Received: (nullmailer pid 2978665 invoked by uid 1000);
        Mon, 29 Nov 2021 01:31:00 -0000
Date:   Sun, 28 Nov 2021 19:31:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vincent Shih <vincent.sunplus@gmail.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        wells.lu@sunplus.com,
        in-reply-to=1635834123-24668-1-git-send-email-vincent.shih@sunplus.com,
        Vincent Shih <vincent.shih@sunplus.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: rtc: Convert Sunplus RTC to
 json-schema
Message-ID: <YaQtVDilgRqQu4KL@robh.at.kernel.org>
References: <1636439898-7358-1-git-send-email-vincent.shih@sunplus.com>
 <1636439898-7358-3-git-send-email-vincent.shih@sunplus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636439898-7358-3-git-send-email-vincent.shih@sunplus.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Nov 09, 2021 at 02:38:18PM +0800, Vincent Shih wrote:
> Convert Sunplus RTC to json-schema

You are adding, not converting.

> 
> Signed-off-by: Vincent Shih <vincent.shih@sunplus.com>

The author (From) must match S-o-b.

> ---
> Changes in v2:
>  - Removed the header file of dt-bindings/clock/sp-sp7021.h
>  - Removed the header file of dt-bindings/reset/sp-sp7021.h
>  - Modified some statements after removing the header files
> 
>  .../bindings/rtc/sunplus,sp7021-rtc.yaml           | 56 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml b/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
> new file mode 100644
> index 0000000..e74e015
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) Sunplus Co., Ltd. 2021
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sunplus,sp7021-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sunplus SP7021 Real Time Clock controller
> +
> +maintainers:
> +  - Vincent Shih <vincent.shih@sunplus.com>
> +
> +properties:
> +  compatible:
> +    const: sunplus,sp7021-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: rtc_reg

reg-names is kind of pointless here. At a minimum, '_reg' is redundant.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc: serial@9c003A00 {

rtc@9c003a00

> +        compatible = "sunplus,sp7021-rtc";
> +        reg = <0x9c003A00 0x80>;

Use consistent case for hex (lower case).

> +        reg-names = "rtc_reg";
> +        clocks = <&clkc 0x12>;
> +        resets = <&rstc 0x02>;
> +        interrupt-parent = <&intc>;
> +        interrupts = <163 IRQ_TYPE_EDGE_RISING>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6c1a535..c6774d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17949,6 +17949,7 @@ SUNPLUS RTC DRIVER
>  M:	Vincent Shih <vincent.shih@sunplus.com>
>  L:	linux-rtc@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
>  F:	drivers/rtc/rtc-sunplus.c
>  
>  SUPERH
> -- 
> 2.7.4
> 
> 
