Return-Path: <linux-rtc+bounces-3206-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3404A35A81
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 10:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 354DA3A4DD2
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54B223F422;
	Fri, 14 Feb 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERMmtfFm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3677F23A9AA;
	Fri, 14 Feb 2025 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526022; cv=none; b=nQ9u06oyiDNbQYzjDnX3zTl5hwm9IuOeWEqV5u62vt1EyGvRixSwOCvN2fe3b9shLZFjudHcM6xOUqwCPw5i4z8O6ovzjCiiEU1NEacOPj0a5c9XWhjobvjiz92UqlsGcQiub58enSNf1AA/2aUBc9ALpWS8MxZLfX6C73sI2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526022; c=relaxed/simple;
	bh=p5vYy2mrK/o/VT5mJ7ApSVSVL8TdJfYkFtZORYT3q94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTRKCxhVjTZJT4T+xTD3JjQZqqevebNJBV68pzXgXz6cySJC9620VaqRjkgYBX4Vmv0wrM4HQ7qq7jy7E0QeuVcszGLtFEbYOnBsxQYHlyHe9ytLZq24LmhfvdTNTinYZEFzz3utzIUVMJflRGb4cUTqo6qAmGmOXbKd+15/wDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERMmtfFm; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7be3f230436so161680785a.3;
        Fri, 14 Feb 2025 01:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739526020; x=1740130820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ltnVdbgyWl/+t2lriesNcGGsbLyc+7ozvoFh97YkJ0=;
        b=ERMmtfFmbYZOmz4dmZfCebcSzFz0E/Bt+ZNTY9w1clPPKRtgIS9kzfS7m6h/779Tay
         7vYx0rIBnhxwWwTnq5QIUCc8s2Cj/WPC+XN3zAQUSJE/Q6M2djQnBLTe9n85kfiEoyIL
         5QeT0VFMF/aVgkOg0Y+GmwjQLW7nh+WSIkMZHDl9iZHXJkUZR25CCON7bcz8aieJR7xT
         txcOcn5D7/TfAwCLedr5baRD4UX2iW+z/r48yohNsDEUtpUtfsqBP3uwDMFeFOCahNLE
         i5Zj1ZftR805BR0EWp10zabXB15sGO2Q48QhDEoHRY36EpHLGk0uQBEo4o1UHf/ZyxGe
         X6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526020; x=1740130820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ltnVdbgyWl/+t2lriesNcGGsbLyc+7ozvoFh97YkJ0=;
        b=Qr/YRWVrJAlbBfyEJxQ/uNJvfJhY9XqR1d9+BhYM1nWlg+PA7eDMFk0CFKJ4JuWlzt
         j+UYgD2IgVJ5ACWUq2ge/LdDpw6b49ueqqjrhvLnwynGiH6W6u1zeAvuyYaZlPzR7ZdJ
         icTI/HKtup6Sp3bOMZEzgiZm15iPNHr3dB7+5tVqlhEwUG5iEkGpTs9rGq7t+VtwSDr5
         rG38mEbIQLBh2Q7y0F6DQ9GXm+EaTSZ1io4s86EjliCyQyQ3PMSR6vmhKe0Q5EHIgt5e
         lH7kKIxptLYb2ApatsRVzvANQBD4OVR0O/R9cMhbG8TRXiFBtA0f6+D9R5K6eq079n47
         lmsA==
X-Forwarded-Encrypted: i=1; AJvYcCUVQwiAZrF9CLjvj5Z4HaGtMSlniV/I9wCbE0eAUUqLkM6gJZ/CilruCcq4iFmXqrsTNM4Rt9TvNLZlIUTH@vger.kernel.org, AJvYcCX3uVnuYGF4ymXyiziPKNDWRVfmesG5QeeEG9FTnPF7W7E8zdvIdkEs1W+IhxWAIcKPPo/H/tDK3A4C@vger.kernel.org, AJvYcCXhNLzmRwONjIvcTWFhLimiJg8StWWrclU6Rk4WOCVdsX6BtLhWooTMnnnOdvLdEim0sHlazY8H57a+@vger.kernel.org
X-Gm-Message-State: AOJu0YzNh4D+wT+g4i5qTQ+ZJ5OUa1i9avIVfd6jYAzRFnsHBpdOnZWg
	YbQflNoSQc5L7DTLHBdPMFygKcxgp0kv7XRqtMZGGuWbIUo3oVml
X-Gm-Gg: ASbGncuYNNWNsCy3QhZSMRQ6CeWe0kpI9uB8zNosR0kVSmliYD5JmVOl6h5LIsPxkvx
	iaSvsEJICkAyRlIrzh+of/Yu/zfqpH4BGuLCfOE8NZCakU4owNIVgQ4tOrS/oZaVPk/15fU0Vyc
	DXE8wA0O9RL0qj7DMQphIFUy9WM04eGKg87KoiNBcR3jfam3tLug2hBFB3uuHURlNjQaXfENrzw
	J41uVhd+r4spNia1NymCLMtBrHAKhw6meAe+1Za9V6omMj5p3Ckryt+uNDyX/FaHtc=
X-Google-Smtp-Source: AGHT+IEAaWOHdRIBYEDb2EPJpgpRyzUZ58tWTfkhcKSw9SF80+/uXHiUKELTnqkLF3A1dKQoSa4BIg==
X-Received: by 2002:a05:620a:2d86:b0:7c0:7207:600c with SMTP id af79cd13be357-7c072076382mr937351085a.41.1739526019938;
        Fri, 14 Feb 2025 01:40:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c861552sm187614185a.79.2025.02.14.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:40:19 -0800 (PST)
Date: Fri, 14 Feb 2025 17:40:09 +0800
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
Message-ID: <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc@5025000 {
> +        compatible = "sophgo,cv1800-rtc";
> +        reg = <0x5025000 0x2000>;
> +        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&osc>;
> +    };
> -- 

Just for curiosity, Do you leave a way to implement the
8051 subsys, since its registers are in rtc. (You can
check the chapter "8051 subsystem" of the SG2002, which
can be found at https://github.com/sophgo/sophgo-doc).

Regards,
Inochi

