Return-Path: <linux-rtc+bounces-3171-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC5BA320C7
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 09:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85FE18847DE
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 08:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFC3204F86;
	Wed, 12 Feb 2025 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MzZw8gbu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4E204597
	for <linux-rtc@vger.kernel.org>; Wed, 12 Feb 2025 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348341; cv=none; b=D+znQwmMC8YUjboVTTJ6Y/iB9XuLhe4BGObfjP7DFUS8/0NcFi/maAZQoBtr4ezhQfvzyDwirKbyMo9gdJBl7Ze3gXbWXLMT3tVu5B6yRXkoN2CEEnAxhn7j/mLi9OzGXS9CgsSgtxHWXOrqn/5Ykf+xoO+uctdVYxa09FLTFCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348341; c=relaxed/simple;
	bh=YarSXhMi3MICiWyZ0jRRnUYvv8XeVcnEvxnut2kZOyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNzPZfuFRQRo0COsmqfy0K2+liytVg5KqczC3I4uHIzYXStkgKoqDJFzLw+eiUdN1rST87C6hnpU8b4s26H2Ceu8ZvL3vhlZRm0ILcH6lxNCY5sCmQSmFwjZ7BA1i7u2kt6RGRbHpTO74pFCxLczJ6N9VACAHUaCdvTd4GUb8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MzZw8gbu; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1231236266b.3
        for <linux-rtc@vger.kernel.org>; Wed, 12 Feb 2025 00:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348337; x=1739953137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ca3jOifU6KLMuLCZFV+VlIgaFdG1oVjtxMx89qkKmE=;
        b=MzZw8gbuqLVeL2UHvA5aKLgbE0gIYWGSISDZP8MAJ791yo/wtGJ7+ZTmRXtvZvv/1I
         k9RPd3JtvMfno2uQv1Rn+TaeyJYifJQTkYPu3XPdEdN0ZPTumzW3t7sMioUELOYsPSia
         drXfL8NnWsXSPezSKJ+hOfTZFHkANRAPcHxGxej8nia1kbkBxBlYA+3QrjMnu26tHrQF
         zq1r1B3xazjK86GtNihSzPuatJhGbrq0IMiauK8LrqNxOkYr8O3AbXrGODzwBeMRoZ1l
         DbPqI43fvhDFEs9DmaZdb2eg/SwiKKlZPMWU2ZyFsfN99XsWNqiq/b1i9Rx65RqlH4C+
         h9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348337; x=1739953137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ca3jOifU6KLMuLCZFV+VlIgaFdG1oVjtxMx89qkKmE=;
        b=kRA9tOE7HNQIf265CR1Qi2R623OqpEyp4sKU1L2Wq9XH9rhNBK1z1HxJWAGD6dlPt3
         kCQiOB7O2/QVnSrr8TVf/JbDMbccSD2b2gOIml7TGOT+Q9QBk4FOCQxDVCH9owGXG1eV
         11OIOhiUksafn8srlt8htGJHgv3dEvO4ZHNE8bh8u/t2FTS+eCCCurnMguLWLQb7LXus
         WpAUnCvlcKKFBNF72EgOBl1X90sovsm5qOW55OVgF98SBdupi3gl5ib9aj2BnkSlCVON
         JymlS5GFlkdm/6iiECuCheYVv5mjmSNUEDAZ95xgLbcHC9OmM0dL+njtzHcsDPrqj05U
         vVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUndLVfzrhWmss8SOtORfOmBUYW7W7a4koitOh3wdX2dLQx2jeo5TlW3DmCI/Ma0jqLBoji5wCfG5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhZuSxpa1sRusaUsM+zUYILKdEoKrYLPN8Hg/SHOYHZlZpb+m
	CkuwTVebN3J96iNAiBwDNf0DeX5F1n2+csqdLaE8i9EKIBCkATgJOem0a7OHBps=
X-Gm-Gg: ASbGncvnoQjv6g+MfCI9KXd3Jx0voflW7TVU6gPCTaytDwL6jSxxE/+88iRtggfeiSb
	egFYyh2EWT9k9kfAOptB9n1eMbPw5U8b14fYNNtehjAoSOSbBojhRrtCwIfF88hoNkXvHj/jRf6
	U8fJhkHfx6Z4MKfr9OQqftFqPpCRf5670tMVGPKhCBbJAv5tGTboIuxFFhexJjIhvNFAOm7Dhni
	yQY4dZoIJWk12bcmOcBEKdMY6D+rwZGS3wiVKtiPuEAKvgw7YOTYFUwvD7Fcq9UKJYtiQcPaqQZ
	o8AsVld98hvFYMpBMummeGP3
X-Google-Smtp-Source: AGHT+IHBLSlZ+tK9sv24mLWsqTARUiAJ4W3lRBwdQFx31Cj8hrychh4XqU6wPO/Gzkojw3c5V7eTFA==
X-Received: by 2002:a17:906:6a0b:b0:ab6:b9a6:a9e6 with SMTP id a640c23a62f3a-ab7f34a11a2mr161055766b.46.1739348337071;
        Wed, 12 Feb 2025 00:18:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5e15c76bsm8231120a12.42.2025.02.12.00.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:18:56 -0800 (PST)
Message-ID: <b697f8d5-79ca-4d51-b5ac-9dd51713c0ea@tuxon.dev>
Date: Wed, 12 Feb 2025 10:18:54 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] dt-bindings: rtc: at91rm9200: add
 microchip,sama7d65-rtc
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a0338f3d05ed43eeaf2121dd22a9f0dbf25f2fc0.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a0338f3d05ed43eeaf2121dd22a9f0dbf25f2fc0.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTC compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index c8bb2eef442dd..0c878331170b4 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -25,6 +25,9 @@ properties:
>        - items:
>            - const: microchip,sam9x7-rtc
>            - const: microchip,sam9x60-rtc
> +      - items:
> +          - const: microchip,sama7d65-rtc
> +          - const: microchip,sam9x60-rtc

Can't these be merged like below?

- items:
    - enum:
        - microchip,sam9x7-rtc
        - microchip,sama7d65-rtc
    - const: microchip,sam9x60-rtc


>  
>    reg:
>      maxItems: 1


