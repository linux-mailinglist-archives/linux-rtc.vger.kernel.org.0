Return-Path: <linux-rtc+bounces-338-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E31437F297E
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 10:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3CA2828D4
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64DC31A84;
	Tue, 21 Nov 2023 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0f4/oIA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F51511A
	for <linux-rtc@vger.kernel.org>; Tue, 21 Nov 2023 01:57:51 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3316d09c645so2473446f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 21 Nov 2023 01:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700560669; x=1701165469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ya3n3aXDnBMpa9iCsGsDw/lmArvm/c671drEFUNQoo=;
        b=f0f4/oIAQqebDHWVkydaOtoZ7DLL4dVAAIfY0zSvYqMTN9Md4omqWNXW9+vQD72dgN
         YL+ABS4NbcNk5rmLbJ+kK5FWPgzgn/v/gmV2K1Yka73gVMlZjyWHhwEKhxWal2ZI3NDJ
         ZKF9ZRcHbU8jboGkvTYp5sbYAiD7gTd01ARCHmUgh12Vy/zZ4GAsnI9FksVkManSn06i
         ftqdrMfciFMaoEnKdO0ZAN1W2Q3HECGigxXRgu/Otrk5zOAsZC3Zur7av3g8wsSMoLyz
         u5u4yo8JM8GzvcWocfRK/FGO7y6U0ydZLPDsnq97zpmzntRPeV7m55OCn6mO4fZXrBzr
         ONSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560669; x=1701165469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ya3n3aXDnBMpa9iCsGsDw/lmArvm/c671drEFUNQoo=;
        b=tVD4ErRvhMD9gPJu1CvUTlbzyNWcwG6MqpIWt4SaA8TKUGOLldMz6HnPyeRpcBlRdJ
         Aqosejk8qrTCOJKJd3Lk6r7qg+Y79Wv5AMmctnVFAN+Y2waorTAaVUy9DqNdxX5W78DK
         wN4uQop2bYm0xrbeuFPE77K+FKiSDPyYDNMDMZGli213MJmXByy/FsfFiMnMbg+s3fY9
         dhO7fFvblTZ0VSp+mJhsHy6aDEbDco54lCEI6uMx4bRZ7RMBd3zymqCWu7Dp7ArjC8ra
         FsNJca9s6iVtVMcB7Ilzh+2gn2nHS/TZe95Wlknb/yj2LBiYOjUUDZatOLtjxNbD5+2D
         I1Dg==
X-Gm-Message-State: AOJu0Yynq3np565evaxdwbBKEzPycOri1xmir+nRdN1AItPM3j/et4OM
	iKoWNF6Q3eEerTREoMDl88WJ6Q==
X-Google-Smtp-Source: AGHT+IF5jKaAaWuAYYIRaovptlC1ZuGRLPzcyaZZ1TLyF9C2pvMBO3pkBU9sYd5hnyBTx/DGMQAeWA==
X-Received: by 2002:a5d:558d:0:b0:332:cbe4:110 with SMTP id i13-20020a5d558d000000b00332cbe40110mr2068623wrv.33.1700560669375;
        Tue, 21 Nov 2023 01:57:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id m17-20020adfe0d1000000b0033130644c87sm13954510wri.54.2023.11.21.01.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 01:57:48 -0800 (PST)
Message-ID: <84a12a2c-3f64-4517-8d38-14c8516e70d0@linaro.org>
Date: Tue, 21 Nov 2023 10:57:46 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: add binding for Sophgo CV1800B rtc
 controller
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
 chao.wei@sophgo.com, unicorn_wang@outlook.com, conor+dt@kernel.org,
 robh+dt@kernel.org, conor@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
 <20231121094642.2973795-2-qiujingbao.dlmu@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231121094642.2973795-2-qiujingbao.dlmu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2023 10:46, Jingbao Qiu wrote:
> Add devicetree binding for Sophgo CV1800B SoC rtc controller.

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.

> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  .../bindings/rtc/sophgo,cv1800b-rtc.yaml      | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> new file mode 100644
> index 000000000000..fefb1e70c45c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800B SoC RTC Controller

What is a RTC Controller? You have multiple RTCs there?

> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +

Missing ref to rtc.yaml. Unless it is not applicable but then why?

> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-rtc

Blank line

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false

unevaluatedProperties instead

> +
> +examples:
> +  - |
> +    rtc-controller@05026000{

The names is always "rtc", unless this is not RTC. If it isn't, please
add full description of the hardware.

> +      compatible = "sophgo,cv800b-rtc";
> +      reg = <0x05026000 0x1000>;
> +      interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-parent = <&plic0>;
> +      clocks = <&osc>;

Why do you send untested bindings? Review costs significant amount of
effort. Code was also not compiled? Warnings not fixed?

Best regards,
Krzysztof


