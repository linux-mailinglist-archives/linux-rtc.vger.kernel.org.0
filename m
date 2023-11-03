Return-Path: <linux-rtc+bounces-201-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808C7E0583
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 16:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 392A81C2092E
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 15:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785901BDCC;
	Fri,  3 Nov 2023 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c5UWdx0x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820191BDC8;
	Fri,  3 Nov 2023 15:23:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766F51B2;
	Fri,  3 Nov 2023 08:23:42 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B0DE0011;
	Fri,  3 Nov 2023 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699025020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g8ryr4CTwqaRwOZ9SeBJFG41MtR13B4b+uJQqQXGdSQ=;
	b=c5UWdx0xVoSeLiTM333DovqAx0WFjCsLznzPEiyd15hot3X0XOPEHUTOr+jRT4YzA+QhxC
	eZA7ccFmlGldmLzogsB+IGn86WFs5YfcmVoCihctZL/CUVFkeU563eukN/mcXsE5Hc/GIy
	2KU8NgRCEqzGTspBlGwyP0RZ3basdmbb15jjtVGvFLVpwFbRieGVTnikr2Fft1jSwLIJMo
	7bZS7Kw3cYBj3WSD8N3o9Rowl4MrAAxpw7y/EEbteZUr0rgAPde2I3zAPNTGqcEh8LpGfg
	WNtGLzSOG/nvN9eCE8HYmeqiSX2FmJs8Evf/7cvNZVRQ2HGTAvK98HCFVLtQvQ==
Date: Fri, 3 Nov 2023 16:23:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: rtc: max31335: add max31335 bindings
Message-ID: <20231103152334de221dfb@mail.local>
References: <20231103140051.43174-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103140051.43174-1-antoniu.miclaus@analog.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 03/11/2023 16:00:25+0200, Antoniu Miclaus wrote:
> +  trickle-resistor-ohms:
> +    description:
> +      Selected resistor for trickle charger. Should be specified if trickle
> +      charger should be enabled.
> +    enum: [3000, 6000, 11000]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@68 {
> +            compatible = "adi,max31335";
> +            reg = <0x68>;
> +            pinctrl-0 = <&rtc_nint_pins>;
> +            interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
> +            trickle-resistor-ohms = <6000>;

This example would need aux-voltage-chargeable to ensure the charger is
getting enabled

> +            adi,tc-diode = "schottky";
> +        };
> +    };
> +...
> -- 
> 2.42.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

