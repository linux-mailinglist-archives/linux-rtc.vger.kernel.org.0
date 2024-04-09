Return-Path: <linux-rtc+bounces-986-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C317789D343
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Apr 2024 09:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E65CE1C20E00
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Apr 2024 07:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8A37E107;
	Tue,  9 Apr 2024 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbKZSQwv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A477D40E
	for <linux-rtc@vger.kernel.org>; Tue,  9 Apr 2024 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712648084; cv=none; b=fAmdV/UF6FHXomLwD9gGv+wCUN/S718mILaKQTZOPrDvg1j3FKsz+sp9zxu9rAboxPLN65FIDMmeQElVlMLc2ZxgOHtSquxF/wdw1EorkZrlXZX/nxTjBmeliF2zwEF1Pe0xSCTymaXkkDDsWFu1kJcmtpIpWXuGa7M9kKNX/8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712648084; c=relaxed/simple;
	bh=Zn9We7nG0KOrahpJoC8wNBsRJDzSoyddT08Z3u86haA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVDmYR4xEe2CRCAQBxO19vh47l6r++tBsF05WxLXEVNtQShxaeA5vmf3nLygmhalqT/JZwu9bjD/XcwFgIWPoToR2q8vkpwOB1/T2O8WfihvyxdjjsL48UvJhy9AYF/JOoT42Mu+VDX2hl1h4Q7f0GV9b/W5KKo/BjFW4rUXW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbKZSQwv; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d82713f473so90394121fa.3
        for <linux-rtc@vger.kernel.org>; Tue, 09 Apr 2024 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712648080; x=1713252880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FRyTTwxxanlSdbeoIwcG1rBViaA/BhY0KriVB+zcm+Q=;
        b=ZbKZSQwvew+OFT2Lsl6pNC6FaA7OVaMeXsLMdMvYzAC3pffMak1yoiQx2q3AetdbUU
         NdgJH6iALfAsj+bxLx54LOsMP6+Q4RpFzNqLjU7f9W51RMyok3OQVXJnvkE11IxEQdB+
         fC8R3LBvOpCgi2JHr+FV4hxb7PzDRlfpA0xpoyjtUXNOSTmxfzEvBMqIZWwD7B8cUTPO
         1DQDmgddr+d8hxUnK8pKjMJ7SxXrnXzS/uX5aBrPsbwMnpixcGcSB2DsS64aAM/0OeXS
         8B664za1w7Rmw44oePlhPFe6184ZXOKEoqXvG6AmQhpkgq5Yth/vz34b5VSRSA2Cl+6D
         oHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712648080; x=1713252880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRyTTwxxanlSdbeoIwcG1rBViaA/BhY0KriVB+zcm+Q=;
        b=hHNH69DNGIRK8tnMiH3W+5bZGsm7E2gxJwiH0QEasSuWk9E1IgRzQJu8NK0E3UeKCE
         dBTClw8F989DqrCOBBSFLsHjtL6BwF3XqydWT0Ur/5sTDLq7vsjLxgnYDjOe9DiTP97u
         1YnyGwTJHGsQTw3y1bb/kgMJO4pW0TYH0Pg4Vov+K0GlPBx2oFBEWhxmO3wTVondNxmT
         HJqI1INQZmSj/iAnGaTOUGPGfStLovOVxR3emik4UERkW5YVOpNkBB3M9ngUBwJKk0zz
         V9yKW8gvqi6emHMNx0vYp0tYdn/7rBJC2iQ93QPYUGS7ntKfWd1YhUZH8eMFw13CJYYs
         GrPw==
X-Gm-Message-State: AOJu0Ywm44CXJx5An1BZzzOpdF2hlB05PZjxIPG5MjyjY9wL67yy7rL8
	yYj0amoA1HrWYsDDBJlWhgMeQ+uHC6qDeAq47qrM6Mc0U3sTXpvoSh9W3NMzrpM=
X-Google-Smtp-Source: AGHT+IHXrvYECgBV0YpuV401AjDDvmT4ubIU0z0vmHPZPHrU28LFcflkZb0oiqFQzeddYLz/BYBx1w==
X-Received: by 2002:a2e:854c:0:b0:2d6:f5c6:e5a1 with SMTP id u12-20020a2e854c000000b002d6f5c6e5a1mr8618580ljj.12.1712648080467;
        Tue, 09 Apr 2024 00:34:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c3b9e00b0041690a1c9desm3780342wms.30.2024.04.09.00.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 00:34:39 -0700 (PDT)
Message-ID: <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
Date: Tue, 9 Apr 2024 09:34:37 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2024 17:53, Javier Carrasco wrote:
> This RTC requires a compatible, a reg and a single interrupt,
> which makes it suitable for a direct conversion into trivial-rtc.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
>  2 files changed, 2 insertions(+), 15 deletions(-)

This one no... and if you tested DTS you would see errors, although you
need to test specific lpc config, not multi_v7.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Anyway, you *must* check all DTS before moving anything to trivial.

Does it mean all other bindings were not checked against DTS at all?

Best regards,
Krzysztof


