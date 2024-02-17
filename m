Return-Path: <linux-rtc+bounces-658-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA6858E14
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Feb 2024 09:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763DB1F21FFA
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Feb 2024 08:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281CD1CFA7;
	Sat, 17 Feb 2024 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ed2fSRlI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F21CD2A
	for <linux-rtc@vger.kernel.org>; Sat, 17 Feb 2024 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708158384; cv=none; b=q84jy+21qBXJcgUZ9yoszyQYsBGgSRf9ssmBUQX1FS6/CEX/JpylMPetb6Vb9KhHQljnCxjIW19DQD0aUYXDbMnRIH1rt4+4Zdf7LbByKf8so9i9EQ7p7d62jSN1lvJi+vkENScpeADUdpqTawkHUsqrW/tLbdHWnZz77M/JfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708158384; c=relaxed/simple;
	bh=gx6a5edxbT5bsU+TGBXVp/954ZAEGJsMFBWLUR/YTOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e60jufMLt3A1TmjnVcy/BIdv/BBV6X8Gx//KLXyLvifoWex/eu2fl0huOpKRJMoKwCI95Xav9ONwP0zoNh4TtNnSMOE0gF9aEwvk5rbHK+VsL4UVGWZrVPLhZw77Zr2S2ys7PuETPT1ZYgHmnrbt6rtJCsc73fJQl+E0VWwsWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ed2fSRlI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a30f7c9574eso374644566b.0
        for <linux-rtc@vger.kernel.org>; Sat, 17 Feb 2024 00:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708158380; x=1708763180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgqfRlrvI7npTmu7xUZp6/bC7Hy4iB4qMNQqRvwmnc0=;
        b=ed2fSRlIQ9pGcNY7w4fCmZiV60kAwy4CvyBEQtmWZ5rntG3ut9icoV09Pu/2UiZ14c
         vSrrqLp3EljB76eS1ORPcFkkNLNpIYasBU5c2iPLT9SM7scG83AACfKJSNwcx8HgUkr5
         hS/veXxolba0yMpnixRl6mAC90AUPzA1LcDzRRFJhD6df9A38l7kGf0pcekslMTMDSt2
         jmPcr4gZn/JxfdUTt88OE5GC+VXb2WorXkuRHL1siBkL/s1qw+FnN7yKlgySCojtZiIl
         V07WOFNmTLJrJSK3lWQ8Rqw/DAQDHNTgy/gBUlj2j3LkjYctFMSPaGw1dSAw/vkDzuVE
         IJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708158380; x=1708763180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgqfRlrvI7npTmu7xUZp6/bC7Hy4iB4qMNQqRvwmnc0=;
        b=Kf3bGHbFZBFYD1vT40umdTcid+u/9gNLYr2CQ1p7RntJuITVfUGdMIXOHAz3S2Mkzx
         Col5b1imobbilb8x1qKiV490OMqvyoSWhYofSa242ImrTx/Ydif+eMNxkUV89hvA6GfX
         LgkMI5bEwwFvgE/qdrkdu86vWsMD/JhNRTtEKI1MAuSieNXKM5aZuqMWdIsbxl0HrZ2Q
         2h/+4+9kcxg6aTvjrcsSitddQaqDRmmT/fipWZaE5+TbY4W6kN2ipl9R45pkg7NNaXiG
         OTP4BhNKC1q50q2Cxp7d9kUhNB2maUmShd+IoE/yYwfb7dbPZtsEyG/YSB5bPf0LQwzz
         h2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIwpudtXKm11n/em1jG0GodZBmb6mUHcBwpODgiTb/3mWcYDw82KQjkM5JUhAbrvButtsdfHMr+SpxQ8+09MbvDaxodqpnvFSN
X-Gm-Message-State: AOJu0YzX84LE2MdClgpb2AnMYIWtpJF+vf0zPEReFz62LHFc+JKOhYa4
	P4zCNpSaOSCBq6SY0aOEGDQvqX24JHiJYztCDJQdP5awVq1jq2UWYC5MOSTmapo=
X-Google-Smtp-Source: AGHT+IHXM0ahWqSQ1c/R+HKkC1o1a+c9pA3X4VQztftU731Lcc4H4jfnC9a//q0eaq43fHbSK2TOWA==
X-Received: by 2002:a17:906:ae54:b0:a3d:bccb:a202 with SMTP id lf20-20020a170906ae5400b00a3dbccba202mr3541215ejb.40.1708158379852;
        Sat, 17 Feb 2024 00:26:19 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id cu3-20020a170906ba8300b00a3d014fa12esm763079ejd.196.2024.02.17.00.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 00:26:19 -0800 (PST)
Message-ID: <ebcfd49d-f810-4d9b-8cba-b55071fc7fa6@linaro.org>
Date: Sat, 17 Feb 2024 09:26:18 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: zynqmp: Describe power-domains property
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>
References: <94726c90ff519185767475f672d70311472ea925.1708073513.git.michal.simek@amd.com>
 <5a81f16b-8ece-4263-b424-4dd6cd6e386f@linaro.org>
 <ed59671f-6e0b-45a2-bae7-38f7b4b7e625@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ed59671f-6e0b-45a2-bae7-38f7b4b7e625@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 10:42, Michal Simek wrote:
> 
> 
> On 2/16/24 10:19, Krzysztof Kozlowski wrote:
>> On 16/02/2024 09:51, Michal Simek wrote:
>>> RTC has its own power domain on Xilinx Versal SOC that's why describe it as
>>> optional property.
>>>
>>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>>> ---
>>>
>>>   Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>
>> But Versal is not described in this binding, is it? I see only one
>> compatible.
> 
> It is the same IP only as is on zynqmp with own power rail.

Then you should have separate compatible, because they are not
identical. It would also allow you to narrow the domains to versal and
also require it (on versal).

Best regards,
Krzysztof


