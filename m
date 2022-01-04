Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C2F484869
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Jan 2022 20:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiADTWP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jan 2022 14:22:15 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:39819 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiADTWO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Jan 2022 14:22:14 -0500
Received: by mail-oi1-f178.google.com with SMTP id x10so55996103oix.6;
        Tue, 04 Jan 2022 11:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JRiVRwzlVWu3f0MpK5XFZrd6UQn9D4B49HEAJbwjMZY=;
        b=rZSSVkifq4L7fNAoRmTjF3WNU8Sm8cXPsTBi+iqlJXGJ41xBlzHvbZ51jxfw3zTWb7
         Oq/aaXMUgPamDCyGZQBHgc/tjvKygvKVnYSkRYGM+jwfcl41fqwCIB4/i6NBmZPFlzCj
         xBoZqaqu1LppfkIFdOYzi8WrqaaNf0SBolW5PfWtkOSxAofcjSKAzkwq2HP6gdNRJsoP
         0nhKfUYNK9ZQJJz0LlM0jXv5geYgtlG62hcOQ+rOB2If3qSXVchw5JvMfGg3R7+FUXhA
         L+Xxy3lr8WaPgMhBv0pRH5mN0hL7QWZLATV7F1pgNRdI3TJxikCu8mD6DE2KwtP1Yjdl
         RpTQ==
X-Gm-Message-State: AOAM531SqjYqUN4A/djBDrf+q3OL+JpAu+9QbXmb8+KqgstS2AYsSMlS
        /SfMCENIBhNFeb4yKwH3ka2uPJ3Kaw==
X-Google-Smtp-Source: ABdhPJz/OsNaCowamgaEWmzLgqCyLS6uFrW0XR36+1t8ecctd5oTZGLAJmN+6uz1TZ5UbRanZq3D/Q==
X-Received: by 2002:a05:6808:1a1e:: with SMTP id bk30mr38159816oib.26.1641324134236;
        Tue, 04 Jan 2022 11:22:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c4sm7934113ook.16.2022.01.04.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:22:13 -0800 (PST)
Received: (nullmailer pid 1253841 invoked by uid 1000);
        Tue, 04 Jan 2022 19:22:12 -0000
Date:   Tue, 4 Jan 2022 13:22:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Message-ID: <YdSeZNXTafDI2OdD@robh.at.kernel.org>
References: <20211217170311.2796798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217170311.2796798-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 17, 2021 at 06:03:10PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the DS1307 (and compatible) RTC bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
>  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 104 ++++++++++++++++++
>  2 files changed, 104 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> deleted file mode 100644
> index 36f610bb051e..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -Dallas DS1307 and compatible RTC
> -
> -Required properties:
> -- compatible: should be one of:
> -	"dallas,ds1307",
> -	"dallas,ds1308",
> -	"dallas,ds1337",
> -	"dallas,ds1338",
> -	"dallas,ds1339",
> -	"dallas,ds1388",
> -	"dallas,ds1340",
> -	"dallas,ds1341",
> -	"maxim,ds3231",
> -	"st,m41t0",
> -	"st,m41t00",
> -	"st,m41t11",
> -	"microchip,mcp7940x",
> -	"microchip,mcp7941x",
> -	"pericom,pt7c4338",
> -	"epson,rx8025",
> -	"isil,isl12057"
> -	"epson,rx8130"
> -- reg: I2C bus address of the device
> -
> -Optional properties:
> -- interrupts: rtc alarm interrupt.
> -- clock-output-names: From common clock binding to override the default output
> -                      clock name
> -- wakeup-source: Enables wake up of host system on alarm
> -- trickle-resistor-ohms : ds1339, ds1340 and ds 1388 only
> -	Selected resistor for trickle charger
> -	Possible values are 250, 2000, 4000
> -	Should be given if trickle charger should be enabled
> -- aux-voltage-chargeable: ds1339, ds1340, ds1388 and rx8130 only
> -	Tells whether the battery/supercap of the RTC (if any) is
> -	chargeable or not.
> -	Possible values are 0 (not chargeable), 1 (chargeable)
> -
> -Deprecated properties:
> -- trickle-diode-disable : ds1339, ds1340 and ds1388 only
> -	Do not use internal trickle charger diode
> -	Should be given if internal trickle charger diode should be disabled
> -	(superseded by aux-voltage-chargeable)
> -
> -Example:
> -	ds1339: rtc@68 {
> -		compatible = "dallas,ds1339";
> -		reg = <0x68>;
> -		interrupt-parent = <&gpio4>;
> -		interrupts = <20 0>;
> -		trickle-resistor-ohms = <250>;
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> new file mode 100644
> index 000000000000..df0b55938bda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dallas DS1307 and compatible RTC
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dallas,ds1307
> +      - dallas,ds1308
> +      - dallas,ds1337
> +      - dallas,ds1338
> +      - dallas,ds1339
> +      - dallas,ds1388
> +      - dallas,ds1340
> +      - dallas,ds1341
> +      - maxim,ds3231
> +      - st,m41t0
> +      - st,m41t00
> +      - st,m41t11
> +      - microchip,mcp7940x
> +      - microchip,mcp7941x
> +      - pericom,pt7c4338
> +      - epson,rx8025
> +      - isil,isl12057
> +      - epson,rx8130
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Looks like some platforms have 2 interrupts?

> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clock-output-names:
> +    description: From common clock binding to override the default output clock name.
> +
> +  wakeup-source:
> +    description: Enables wake up of host system on alarm.
> +
> +allOf:
> +  - $ref: rtc.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - dallas,ds1339
> +              - dallas,ds1340
> +              - dallas,ds1388
> +    then:
> +      properties:
> +        trickle-resistor-ohms:
> +          description: Selected resistor for trickle charger. Should be specified if trickle
> +            charger should be enabled.
> +          enum: [ 250, 2000, 4000 ]
> +
> +        trickle-diode-disable:
> +          description: Do not use internal trickle charger diode. Should be given if internal
> +            trickle charger diode should be disabled (superseded by aux-voltage-chargeable)
> +          deprecated: true
> +
> +#  - if:
> +#      properties:
> +#        compatible:
> +#          not:
> +#            contains:
> +#              enum:
> +#                - dallas,ds1339
> +#                - dallas,ds1340
> +#                - dallas,ds1388
> +#                - epson,rx8130
> +#    then:
> +#      properties:
> +#        aux-voltage-chargeable: false

Why is this commented out?

> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      rtc@68 {
> +        compatible = "dallas,ds1337";
> +        reg = <0x68>;
> +        interrupt-parent = <&gpio4>;
> +        interrupts = <20 0>;
> +        trickle-resistor-ohms = <250>;
> +      };
> +    };
> -- 
> 2.34.1
> 
> 
