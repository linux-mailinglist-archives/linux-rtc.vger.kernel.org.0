Return-Path: <linux-rtc+bounces-3197-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58596A35148
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 23:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4A2C3A6F7D
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 22:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FA726FA49;
	Thu, 13 Feb 2025 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOtQy7LS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DFA26E156;
	Thu, 13 Feb 2025 22:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739485806; cv=none; b=qzFqLxqyPDqvq1kOvYT84qHlW+UF6duzgRz5X1pBrq07cfhsxJ4UAIkxu/aHY0ZONnwR9EhGCUWX75yhrDMF0R1RsoR6j/UpmLoFacm/DB8tDzOq11ra0LxuOQWy+yMY+Uhk6o+szdJAIIzGqKX5yAETXHvR3enh+YxyjNx/uvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739485806; c=relaxed/simple;
	bh=K6WgcIpyeh4VCAjdJVyHzN62WGWQKJ1LafETnOr21F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGynxg+XWKY6CCxVXlYwnoD/sUA1JGBasjmKGz1Iird0Qvxr3WEhDVg9jCoCxFX3uBDXRN4e0y4ek0yPNTG3N8ig2FLc0bkJfLoWENgrh1hRvTsCYBMQKf0naMEbfO9jQFG9lfN2arx9jDUXT5X5GADNsUVOdxJYIy8DQsgAvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOtQy7LS; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c077c9cbb9so115851585a.1;
        Thu, 13 Feb 2025 14:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739485804; x=1740090604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShXovPaITATOcaXepBbTHEqdpsA8xygI7qSwseEtmVA=;
        b=ZOtQy7LSZY2y6Ov5FPSTNJ/N6yTawdM6YvLCGy8ewRwiN24DINFvpB5h0q2qD5RiVk
         oHLAU/jlL4uV9EyNcloGmgIN4VgGLgYJ2LyXTHNr/QMJ5x57C10BLf7QZxoBAQcx7ViK
         WQKXaxdv3TKg/ofEe4cHKMZc7DoAgf0yHFLy2E69Dzq1ONAH/1qy0ucj8UVLZrMpvQfL
         WovhAN2kC3U5KI0n7FaF0zbSRMgw9y3IJLq850nGeuk7jGuAh+AtPuPOCTsrYG6cABBz
         Ce1uTmRLeffMCSkPxKk5xsBgpetc6hzQQWFNeg5FK/AqdodKJGbc2AsqtaGUFblDGNHv
         aJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739485804; x=1740090604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShXovPaITATOcaXepBbTHEqdpsA8xygI7qSwseEtmVA=;
        b=Ni+u9lDkCQr2+2kNNi21mWIXnII4gebEGcxWM/3/6dZR3bDbj1ondE6wgEZjGqbEPI
         Cw6pZIHqlGJOP9RxJmeNlyJXGHabRJpuy/pa/r+LWxW5vENXbNQiilBQow2eptl7BsuA
         ZgxDkJC89rJvNTA0vcG4Yf0YQ4SACtPuu+Al2iDE9qz1SfrmZvzgq0drxpOUPIGuyrWd
         wCieC8jE/r4evBrSjogFZeDuY+EPjIWiVotzwyXQhT910qOZCBvUxLPuae9A+B+YTYOo
         UfvaXY19yHuzbgrJRs92cUx3GDusj1xwp0VJ54YKB8M5m/xsPZ2cQR28frFLcNRMX6d3
         47Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUaD6JRk/34tzyeFGvFn1IbI59KtzCz2DueiZvo2wQHarPv7707FcX/mZ0++XdOnzbC5+spF6X14jMS@vger.kernel.org, AJvYcCWlcylqTknuhAB9WbcwdFqeQyozk0IHe8pSDXAQb8ViIyZg+1kKcMuTG8sADBP7o+4ywZAKoUcPzT7iLjHu@vger.kernel.org, AJvYcCWspwm41yhZL6XRbxv0SEdmey8z4B8VpxqvDsIFec11AXW/q0m+0EV5mQwHPf87E3CkM+g8sfGNpL/b@vger.kernel.org
X-Gm-Message-State: AOJu0YyKuyKZeoNikrblpC96QmEZlCqT9YCJDW94xralU8qXGIWDhhO4
	XdmhmkzwoA662AKiXUgKLTUT3nyCCWEZJU27iGEfGEzEW2ehkHLe
X-Gm-Gg: ASbGncs7qCjuOOk8lSsIhX+Vgwav27rCtxUZH0EnIZGds3cOIZtFG+sVDEcN3rogNL+
	nv/BZYFUXiSdfjwjVVAuI/uk/LJfJ3xRcKBfPTzgJznL9HGBZyLzTHx8SmfVM7xNyGmWscQuicn
	9dmh8gPY4wFYZqY5LQnm2qJv+K4Cw4hhWlC7hPyH//pfplkcrHqmWY9ruXdhozd1c9kqSn8gBla
	p4Yc7FeY08EQnPNNRy9A9RJlnJvXMFlQ6nndWuNCNVcy/YGLrQYFnnkAa5f5hCb6vc=
X-Google-Smtp-Source: AGHT+IG45Dds1F1x6ndc483I9NQk+Amp3qv08smVydJSJhtH7qqr6jURVIBwtKjriGlCosvlZ5CFfA==
X-Received: by 2002:a05:620a:6841:b0:7c0:78ec:1ece with SMTP id af79cd13be357-7c07a9acc99mr761190585a.7.1739485804152;
        Thu, 13 Feb 2025 14:30:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c6088ccsm139655885a.33.2025.02.13.14.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:30:03 -0800 (PST)
Date: Fri, 14 Feb 2025 06:29:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
Message-ID: <afskjc2sltch5vqlegrliq32bpoejmzgko6vovfgj33sx6aqla@omeqr7mr77za>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213215655.2311793-2-alexander.sverdlin@gmail.com>

On Thu, Feb 13, 2025 at 10:56:45PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> new file mode 100644
> index 000000000000..b36b51a69166
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock of the Sophgo CV1800 SoC
> +
> +description:
> +  Real Time Clock (RTC) is an independently powered module
> +  within the chip, which includes a 32KHz oscillator and a
> +  Power On Reset/POR submodule. It can be used for time display
> +  and timed alarm generation. In addition, the hardware state
> +  machine provides triggering and timing control for chip
> +  power on, off, and reset.
> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +

> +properties:
> +  compatible:
> +    const: sophgo,cv1800-rtc

Now I prefer cv1800b to cv1800, using wildcard to provide base
compatible is not a good idea. This old design should be changed.

Otherwise, it looks good to me. With the compatible change:

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi

