Return-Path: <linux-rtc+bounces-459-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42DB823D8C
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jan 2024 09:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08905B24031
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jan 2024 08:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1081B1DDC9;
	Thu,  4 Jan 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSKbKoFE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E901DDCD
	for <linux-rtc@vger.kernel.org>; Thu,  4 Jan 2024 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5563944b3dfso304278a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 04 Jan 2024 00:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704357360; x=1704962160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sL6z7rPJZ7ZYtTvRNsIO9pmwqe360wzTCPhehlw+mBw=;
        b=RSKbKoFEgGhWZe7tdPUPFlZ+QjeiptJkieFiy6V4wCXc56AUonJp+ZxRrnpBBatOga
         id7OqZErrsOr0JWCvcc5BqF7AgHzUyrVu38VjxWQSneRU3NFljmxxS69EbDcwCHDvl/2
         0Ds9ilFJSAbi1MGqhywrPLjOWL8WwWFLOhKOFpC/u5cUGyRu1I/w5U0wmcLNIUd8TdoV
         msTHZlpFTsMjDBwFukS8w3T5942FfDaLnlnOGhralnAvskHr52mn7FtatW5+LsgF83BT
         7gsL7JkhP0PLH9fE3PAGSHWRIqeLdNrzkPQCYBdH4Va/JUQ+qaEPYoUgbTrftpE7ICOg
         LcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704357360; x=1704962160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sL6z7rPJZ7ZYtTvRNsIO9pmwqe360wzTCPhehlw+mBw=;
        b=ptQiZtQKJRuODzpZivJ4W+53oJhtKjlrtL4DQNWeh6eF1dkYA/6nhfwbpn0apy5RhP
         BQKd6Vc5vKz+5WzDEiV3QtSlS/+37e2/QDCHA73216lriOduJ2C19aWPsthAVJQpT8xA
         sLOhWNJzYqQyvBksj3GADVYHAbQ0PIHrgchmpHa69vTRXDfZppCfAX5mN13GxPjBFflX
         GxSV1rLrUOxM3Qbd0oE89P1aAlhFIs6g6ipVdNn3+1f+9i18vO2BYPrWAtbN4t+hEb0z
         jO0RcngzTouSrN5NVxiqeBYAl6Pt/TirwHTFCDdeA6m6yVQSup2nsY6WHntrjtrObdEk
         M9Wg==
X-Gm-Message-State: AOJu0YyWPDm3p+Yxr0cDHOpD0xXd8Iy1ql0uf48fu0CWR963qDXQsa/d
	xSdOAbFyvgFZqNkmCgWbW+2AIVr0NQ8V4g==
X-Google-Smtp-Source: AGHT+IHb3T1dKnvT011cXVSf8/HGOa2+4TO5EEjTLaqkcVcyxNo1b54qtsKvFhLDdMyVHZqBig0jXw==
X-Received: by 2002:a50:9e0c:0:b0:556:e4da:618b with SMTP id z12-20020a509e0c000000b00556e4da618bmr176006ede.10.1704357360567;
        Thu, 04 Jan 2024 00:36:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id y11-20020aa7c24b000000b00553754bd636sm18503253edo.35.2024.01.04.00.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 00:36:00 -0800 (PST)
Message-ID: <942d79d0-08a8-4cda-90de-57daa44d9dd7@linaro.org>
Date: Thu, 4 Jan 2024 09:35:58 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] dt-bindings: mfd: sophgo: add misc MFD for Sophgo
 CV1800 series SoC.
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dlan@gentoo.org, inochiama@outlook.com
References: <20231229090643.116575-1-qiujingbao.dlmu@gmail.com>
 <20231229090643.116575-4-qiujingbao.dlmu@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231229090643.116575-4-qiujingbao.dlmu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/12/2023 10:06, Jingbao Qiu wrote:
> Add devicetree binding to describe the MFD for Sophgo CV1800 SoC.

SoC does not have MFDs. We already talked about this.

> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
> This patch depends on the clk driver
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR20MB4953.namprd20.prod.outlook.com/

How? Really, explain me how this depends on driver? Because if it does,
then it is clear NAK as binding cannot depend on driver.

Wait, this is v4, not v1!

Include full changelog.

So you just ignored all the comments? NAK.

> 
>  .../bindings/mfd/sophgo,cv1800-misc.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800-misc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800-misc.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800-misc.yaml
> new file mode 100644
> index 000000000000..6fd574a2a945
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800-misc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/sophgo,cv1800-misc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 SoC MISC hardware block
> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +
> +description:
> +  This hardware block is an independently powered module within
> +  the CV1800 SoC. This hardware block contains RTC, Power-On-Reset/POR.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,cv1800-misc
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  rtc:
> +    # Child node

Drop, it's obvious.

> +    $ref: /schemas/rtc/sophgo,cv1800-rtc.yaml
> +    type: object
> +    description:
> +      RTC for the SoC. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml.
> +
> +  por:
> +    # Child node

Drop

> +    $ref: /schemas/power/sophgo,cv1800-por.yaml
> +    type: object
> +    description:
> +      Power-On-Reset/POR for the SoC. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/power/sophgo,cv1800-por.yaml.

You do not have any resources, so no need for this child.

> +
> +required:
> +  - compatible
> +  - reg
> +  - rtc
> +  - por
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    misc@5025000 {


misc can be anything.

> +      compatible = "sophgo,cv1800-misc", "syscon", "simple-mfd";
> +      reg = <0x05025000 0x2000>;
> +
> +      rtc  {
> +        compatible = "sophgo,cv1800-rtc";
> +        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk 15>;
> +      };
> +
> +      por  {
> +        compatible = "sophgo,cv1800-por";
> +      };
> +    };

Best regards,
Krzysztof


