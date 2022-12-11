Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8EA664962D
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Dec 2022 21:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiLKUVM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 11 Dec 2022 15:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiLKUVL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 11 Dec 2022 15:21:11 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3790CE1F
        for <linux-rtc@vger.kernel.org>; Sun, 11 Dec 2022 12:21:04 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b13so15332004lfo.3
        for <linux-rtc@vger.kernel.org>; Sun, 11 Dec 2022 12:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7f5NzHuOcAIwmcmsuh5pOa0xk5poE64Ee61v4Fe2d4=;
        b=kufHZz4lbm+QSHZGTI+kO6SkkXmD1KpjtDE3mNz4C/ZYv4IM5WqwNYQc043cXwZLNJ
         7g5picfkptV9bNzdOABk439OaSCxEdJt/DTkbilB+XhVd1cM5iK8KXMK4OOwq+Ayo00m
         904Genl8uhsTUJbjzPRnGYiFvG1Cwqdi7a944ts8YlHgDNgjZJZy+i77aOoGjnqL+6cu
         JGZyJJA0obc7yWq0FolC5qD6h/9ro/J5HscUpcH+4U/AAhzGKBvOObPDGayyRKORODBw
         xvrqPf2OUnPzVEhG/a/h5W8TfLKdRY/C/XDQhQ9+dpnk35jLa7fiPRh1Lg2woiDAHTof
         AhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7f5NzHuOcAIwmcmsuh5pOa0xk5poE64Ee61v4Fe2d4=;
        b=Ko4BVP+6B1LhhBXXrjhOOQGj6BJMZd8ytlt5HpV3un+RpzdDnWB04bQdGisDMHW57a
         tCU/fIxn4l7xYY06SgvSNGnCICdr34xcXDpcw9MZ5rUmVEeheaTNfkVlC2UdgEOPm44y
         xNlihvRFforhsKX42B+vTU4Iqvr8w41AbyH5oCyeFOUIPwJyAxYDzPwCBauWLhsm7m8B
         KHLbisPFsXn5rtK0O43/mf9K63mXH4+TwInopkTzyTqVMsLOc6+7VGF+MS8ZdwhUo7xX
         c9MUoMmQuqyBNype5P5irrOGzafKXUGAfP2AXmx0ULG7KlGQb3YLSZk9h7yFSIzgXJXW
         zvaw==
X-Gm-Message-State: ANoB5pmaWKmzSJvx5gw8oskXjc1Pysi/B10KI/qlvdTMVt3dGG+xBeqX
        PHIEBJCTMvB4Fh+dWcV2IUPdHg==
X-Google-Smtp-Source: AA0mqf6HZ8azPjxjMMPyM0g9pFr57Vgn5ZhCH28QMkoCpipMMzlId3AdWm6HadW/bfF4vhe54vE8hQ==
X-Received: by 2002:a05:6512:104f:b0:4a4:68b8:f4be with SMTP id c15-20020a056512104f00b004a468b8f4bemr4416504lfb.4.1670790063328;
        Sun, 11 Dec 2022 12:21:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u9-20020ac25bc9000000b004b561202ea2sm1335100lfn.182.2022.12.11.12.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 12:21:02 -0800 (PST)
Message-ID: <da4bc2f0-552b-5c8c-f8b2-97e84c5520d2@linaro.org>
Date:   Sun, 11 Dec 2022 21:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: m41t80: Convert text schema to
 YAML one
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221211030054.672717-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221211030054.672717-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/12/2022 04:00, Marek Vasut wrote:
> Convert the m41t80 text schema to YAML schema.
> 
> Add "#clock-cells" requirement, which is required by clock-output-names.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Add maxItems:1 to clock-output-names
>     - Skip wakeup-source property, comes from rtc.yaml
>     - Mention the new clock-cells requirement coming from
>       clock-output-names property.
>     - Rename rtc-m41t80.txt to st,m41t80.yaml
> ---
>  .../devicetree/bindings/rtc/rtc-m41t80.txt    | 39 ----------
>  .../devicetree/bindings/rtc/st,m41t80.yaml    | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t80.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> deleted file mode 100644
> index cdd196b1e9bdb..0000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -ST M41T80 family of RTC and compatible
> -
> -Required properties:
> -- compatible: should be one of:
> -	"st,m41t62",
> -	"st,m41t65",
> -	"st,m41t80",
> -	"st,m41t81",
> -	"st,m41t81s",
> -	"st,m41t82",
> -	"st,m41t83",
> -	"st,m41t84",
> -	"st,m41t85",
> -	"st,m41t87",
> -	"microcrystal,rv4162",
> -- reg: I2C bus address of the device
> -
> -Optional properties:
> -- interrupts: rtc alarm interrupt.
> -- clock-output-names: From common clock binding to override the default output
> -                      clock name
> -- wakeup-source: Enables wake up of host system on alarm
> -
> -Optional child node:
> -- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
> -
> -Example:
> -	rtc@68 {
> -		compatible = "st,m41t80";
> -		reg = <0x68>;
> -		interrupt-parent = <&UIC0>;
> -		interrupts = <0x9 0x8>;
> -
> -		clock {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
> new file mode 100644
> index 0000000000000..9977c8954307e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0

I missed that one during previous review - why not dual license? I do
not see here any text (hardware description) being copied. Is it because
of DTS example?

Best regards,
Krzysztof

