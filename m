Return-Path: <linux-rtc+bounces-1205-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A3E8CA97D
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2024 09:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD0C01C20EEC
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2024 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513195337F;
	Tue, 21 May 2024 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4ADaoeW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8C951C5F;
	Tue, 21 May 2024 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278345; cv=none; b=PsWo2+Oht6ax8MCHIersHz9VKOiEoqNePowE44I2hqsYofO3VAIrclwAgohSRr2Bo+P0nVyTczyCDQtc+hoP+Ygfw8yQfCj/t31fQKmP05G5D5Jh90Z6YywKN2CUB7z0ZBeHjqVNamAOl84dFd6J8rIf02DkhuHtoXi2bVbRnb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278345; c=relaxed/simple;
	bh=FS9DQ4RsdW/wKyzu3gL+ApzVoigUb1QeBR3iqUhplBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JU7d12E/Emgmd3p2rK3IfTlYxRUS9y+r8KPK60e0MAA7Jjr3cDaUiR3PHIgo2NBQhRsLFb9WSaQYoiU6HDriUCfZY3lJf9IDJK306tKg0NOvRkSBq5Os1mJXMJ6uv6h5PNjNxHYsa43CzpdmT0UkQNid0OqV5pQ8maMqCKdsJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4ADaoeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340CEC2BD11;
	Tue, 21 May 2024 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716278344;
	bh=FS9DQ4RsdW/wKyzu3gL+ApzVoigUb1QeBR3iqUhplBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u4ADaoeW9KYO81+dk8O/RPfZbUlxYU1sC3CmI5IYqlMrTenR7GbfRFt5iXb+Fk+vU
	 vA7MVcSDS0Dq3aQL484kTd0aIuV1VKzlXEOv9S5XDxaXnBxM6T+DQ53VlbEkBYh9sm
	 isDbq4TrDixPxLoKp2Me3eG3NnhleNdi5tn6bSCXGGUq09oMZgDhp7AKxtKl1Mv3gU
	 Dk6TOej3byUHBnsEaCtw1ed0gdDvbBpTO7TzNj0jCQKT0yY1/Q/lhRT11fovEOxtXm
	 B7/Yqa86vMdnjmvMG7g2ezj51XbcZV0cW0ErRaYxs+13IGyXzEoPvp7vO3mmKCISxA
	 zw83S48gfee3g==
Message-ID: <a3c76bd2-f453-4320-8675-66ecb4bc6fc8@kernel.org>
Date: Tue, 21 May 2024 09:59:00 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt to
 yaml format
To: Frank Li <Frank.Li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20240520214614.863539-1-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240520214614.863539-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2024 23:46, Frank Li wrote:
> Convert dt-binding doc "rtc-fsl-ftm-alarm.txt" to yaml format.
> 
> Change example's reg to 32bit address and length.
> Remove unrelated rcpm@1e34040 in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     make dt_binding_check DT_SCHEMA_FILES=rtc-fsl-ftm-alarm.yaml
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       CHKDT   Documentation/devicetree/bindings
>       LINT    Documentation/devicetree/bindings
>       DTEX    Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dts
>       DTC_CHK Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dtb
> 
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 36 -----------
>  .../bindings/rtc/rtc-fsl-ftm-alarm.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> deleted file mode 100644
> index fffac74999da6..0000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Freescale FlexTimer Module (FTM) Alarm
> -
> -Required properties:
> -- compatible : Should be "fsl,<chip>-ftm-alarm", the
> -	       supported chips include
> -	       "fsl,ls1012a-ftm-alarm"
> -	       "fsl,ls1021a-ftm-alarm"
> -	       "fsl,ls1028a-ftm-alarm"
> -	       "fsl,ls1043a-ftm-alarm"
> -	       "fsl,ls1046a-ftm-alarm"
> -	       "fsl,ls1088a-ftm-alarm"
> -	       "fsl,ls208xa-ftm-alarm"
> -	       "fsl,lx2160a-ftm-alarm"
> -- reg : Specifies base physical address and size of the register sets for the
> -  FlexTimer Module.
> -- interrupts : Should be the FlexTimer Module interrupt.
> -- fsl,rcpm-wakeup property and rcpm node : Please refer
> -	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> -
> -Optional properties:
> -- big-endian: If the host controller is big-endian mode, specify this property.
> -  The default endian mode is little-endian.
> -
> -Example:
> -rcpm: rcpm@1e34040 {
> -	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> -	reg = <0x0 0x1e34040 0x0 0x18>;
> -	#fsl,rcpm-wakeup-cells = <6>;
> -};
> -
> -ftm_alarm0: timer@2800000 {
> -	compatible = "fsl,ls1088a-ftm-alarm";
> -	reg = <0x0 0x2800000 0x0 0x10000>;
> -	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> -	interrupts = <0 44 4>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
> new file mode 100644
> index 0000000000000..69b44e9920033
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml

fsl,ls-ftm-alarm.yaml

or

fsl,ls1012a-ftm-alarm.yaml

> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/rtc-fsl-ftm-alarm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale FlexTimer Module (FTM) Alarm
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,ls1012a-ftm-alarm
> +      - fsl,ls1021a-ftm-alarm
> +      - fsl,ls1028a-ftm-alarm
> +      - fsl,ls1043a-ftm-alarm
> +      - fsl,ls1046a-ftm-alarm
> +      - fsl,ls1088a-ftm-alarm
> +      - fsl,ls208xa-ftm-alarm
> +      - fsl,lx2160a-ftm-alarm
> +
> +  reg:
> +    description:
> +      Specifies base physical address and size of the register sets for the
> +      FlexTimer Module.

Drop description, redundant.

> +    maxItems: 1
> +
> +  interrupts:
> +    description: Should be the FlexTimer Module interrupt.

Drop description, redundant.


> +    maxItems: 1
> +
> +  fsl,rcpm-wakeup:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Please describe the items (see syscon-like phandles).

> +    description:
> +      phandle to rcpm node, Please refer
> +      documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +
> +  big-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If the host controller is big-endian mode, specify this property.
> +      The default endian mode is little-endian.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - fsl,rcpm-wakeup
> +

Missing allOf with ref to rtc.yaml.

> +unevaluatedProperties: false

becauase otherwise above does not make much sense... unless this is not
a RTC?

> +
> +examples:
> +  - |
> +    timer@2800000 {

timer or rtc?

> +        compatible = "fsl,ls1088a-ftm-alarm";
> +        reg = <0x2800000 0x10000>;
> +        fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +        interrupts = <0 44 4>;

Include proper header and use defines for GIC and flags.

> +    };

Best regards,
Krzysztof


