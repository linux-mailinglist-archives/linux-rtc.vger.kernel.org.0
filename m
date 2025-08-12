Return-Path: <linux-rtc+bounces-4675-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E673FB2349D
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 20:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA7884E466C
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 18:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E62FFDE3;
	Tue, 12 Aug 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="YS/4WtQ3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4D2FFDD9
	for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755024097; cv=none; b=ALjX7RU6WwfCGY51ZoJ+6VUD4UCs6zPB6KE+wDaEKeesJh7m+Zff77/7i+TYd1GoYI1HCNSEj7r4LWdYfnqjoawnnfkm+QYMYZIBhhm++B6XqZAho3Aa72miUREsUmo160NbP6Z5OUDK1GIE7/e3NbTfXML0XcLZj3gho+6cIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755024097; c=relaxed/simple;
	bh=gLRMsIvCv8IG45hsz/MkPHRnEYM5tUj2cZW2pTMmcKs=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=tba9NG5Y1C3uCy2BtwjtZoTR6uKUNdigysveWEizSg1tuuFgPJhtqxpnYCUv0SJpV4NIvlPRR1V4hXB9kOZbyB3Ufu8hmjtWsBGYhZkLbgIZhCByEGej9yPk621+5lw0ZGwN4/uWM+uPkhKMqKTy3em2nktIVmWzt5p98AkeW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=YS/4WtQ3; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: fe89f747-77ab-11f0-84d2-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id fe89f747-77ab-11f0-84d2-005056992ed3;
	Tue, 12 Aug 2025 20:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=/3M4lDWEC7hP7KuGM7cE06jKWy9RiyUcvF4Xfh1YCsk=;
	b=YS/4WtQ37lFKvMGEtTp+8J4iVoj/Mq6NfwVVO2Hji77xVOzkuyl4bLguvP7hDn0a0VBukuhuyh7zg
	 KuSNcRQ0cF9eiYdxero+cf/vvpFXONKl/C4j6QblGLmueCVZtFoJ+beNVYOwgqKIo0APWVAF0E0xIr
	 +zWQ1Kc9EKGU9pk6YL6qHPLq+bFhkvuv7Cao1XStZfQSIM8PbBly48L6CZxD/52naH0FsVuqTsESEV
	 GK7tcNnnSNIlsMSG2AOzDjjjCqfP7QDAAloanNzAQXQO6em1wzP6/kTR1oxnGau7xQH/z3oKjUCsXC
	 ZGHURoLZp7tcuKrw9ujHd4j6Qu9vSfQ==
X-KPN-MID: 33|1+wkTmLP+rbkYDZSTRx2TNyahSDVBKcTrCDARRxfA37PcVf4d7uR4kLyDmD0fdK
 jzy4QDeFgZUc7eR6T4tH+4zkNo/16Oy1xT2hMauxbMwo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|M/4jMQFXP+rTo5MG/gkkhJmKuNihgybGQtzZ0C9WJAVb6Xo5AJP0id5rm9zQv/k
 kmwbNz08Bnlb8DMOJ3Cb94w==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id cf6dfa05-77ab-11f0-8d53-00505699b758;
	Tue, 12 Aug 2025 20:40:25 +0200 (CEST)
Date: Tue, 12 Aug 2025 20:40:25 +0200
Message-Id: <87wm78l6xy.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Sven Peter <sven@kernel.org>
Cc: j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
	lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alexandre.belloni@bootlin.com,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, sven@kernel.org
In-Reply-To: <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org> (message from
	Sven Peter on Tue, 12 Aug 2025 18:25:15 +0000)
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org> <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

> From: Sven Peter <sven@kernel.org>
> Date: Tue, 12 Aug 2025 18:25:15 +0000
> 
> Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
> but most of the PMU functionality is abstracted out by the SMC.
> An additional RTC offset stored inside NVMEM is required to compute
> the current date/time.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewd-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml         |  9 ++++++
>  .../devicetree/bindings/rtc/apple,smc-rtc.yaml     | 35 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -41,6 +41,9 @@ properties:
>    reboot:
>      $ref: /schemas/power/reset/apple,smc-reboot.yaml
>  
> +  rtc:
> +    $ref: /schemas/rtc/apple,smc-rtc.yaml
> +
>  additionalProperties: false
>  
>  required:
> @@ -75,5 +78,11 @@ examples:
>            nvmem-cell-names = "shutdown_flag", "boot_stage",
>                               "boot_error_count", "panic_count";
>          };
> +
> +        rtc {
> +          compatible = "apple,smc-rtc";
> +          nvmem-cells = <&rtc_offset>;
> +          nvmem-cell-names = "rtc_offset";
> +       };
>        };
>      };
> diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC RTC
> +
> +description:
> +  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
> +  but most of the PMU functionality is abstracted out by the SMC.
> +  An additional RTC offset stored inside NVMEM is required to compute
> +  the current date/time.
> +
> +maintainers:
> +  - Sven Peter <sven@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: apple,smc-rtc
> +
> +  nvmem-cells:
> +    items:
> +      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: rtc_offset
> +
> +required:
> +  - compatible
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +additionalProperties: false
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
>  F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
>  F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> +F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
>  F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
>  F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
>  F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> 
> -- 
> 2.34.1
> 
> 
> 
> 

