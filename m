Return-Path: <linux-rtc+bounces-5954-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKxNAzmKiGlbqwQAu9opvQ
	(envelope-from <linux-rtc+bounces-5954-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 08 Feb 2026 14:06:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4D1108B07
	for <lists+linux-rtc@lfdr.de>; Sun, 08 Feb 2026 14:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 575F8300B753
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Feb 2026 13:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07083274FD0;
	Sun,  8 Feb 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7EhQkTh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1AB24634F
	for <linux-rtc@vger.kernel.org>; Sun,  8 Feb 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770555954; cv=none; b=GtfiVghOCDcunBa6YP3VK0r6ayk7wimKI8co3waOVJx3dAG3/5nv99jN0NhTe4xQObYRwtA++L/ACbsq/Ydwg9sCXvRnJMhBvgz6FZrW2KTunI9755FDyLE4Wb1dosyGLiJc23Uu1KG6XYss2gdFgOt3/fiySukyxRVSlix477A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770555954; c=relaxed/simple;
	bh=osT0EUva0gXZ1pK88EukUzwSiu7f4mThiV/KwigTGzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkseUiRZ2SapQ19qIFxgyZ1qL8r/0k2Zqp4YetK99+J1Y4l8M1aI0Xn5QDEn0ctSh9cxI21oB/u6E3zv6AzKZXC1hfGg9dg2ATwNKMmw3SC7VuRQAVzjAJlwSDEZ8mbFYgzR98uzzScVG04avAeO2pFDOngYNJZIj9Kz6njZIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7EhQkTh; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48068127f00so33136305e9.3
        for <linux-rtc@vger.kernel.org>; Sun, 08 Feb 2026 05:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770555953; x=1771160753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6ZaHSw9LpRz01vg6acbUDvWM+cc8+yuVQwbsTXMnoc=;
        b=J7EhQkThA2l+rof3AOzI/crRVbSKPsQ3H1oU5Cl77W8vHcmN64O4AW36/L0bBRuYao
         QA1NJCRLmSI7GzB51Sz1funRAp2CG3svzIxhcwGgnGFkx51hK+drRRm6aEagZYEZvBh8
         FgoJFbogl6kj7vZ88/Qg+r2GfszxFt2Eh5YPT7L2rZbtll8h5oEOuJT2pWOQuBX5dniJ
         W+3ZgdEuSqtruad4O3g75HBhtOWYQFXCfUzp9oyaGfkpmpEyDhmgEvNNSulny1rj5vd3
         xlLpRusLQNtvNGtiDwAr6zWXveOzhbRNtCmvfGKLeQugIS1CWKAk/6BdjmBR/a4ZFE4A
         TzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770555953; x=1771160753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6ZaHSw9LpRz01vg6acbUDvWM+cc8+yuVQwbsTXMnoc=;
        b=FJe2I/QbRvU29+PkyNs1O5yhH0X3UflFRAMY2m1Uu9jH/9ltpuNmloDiTQglM+c/6f
         iiS+ZUrVpxxPKZnwxy00BJSZsH5lZagIkK0s4XS5iEsY/Q4tf7D7RfhdlJR7gwzy9ZKU
         C62kxgdvNE0WI270896Fk0t59wMTI/m11AuEcmPtrrTi37IBQXqTfaHnHM7X6eIMLKN5
         70QQjaKz5/YORXaHze4gdGzRpEl28DJdS8tMcmN2UIA0vr/gPhYBHosdYayAn199w5fq
         xtGJJ7y16+8TfOd4TnCqR4qpKjPatMhPELnh3r1G0uhcHV/Bs8DS5ncKGsGnCi8GPN5g
         Z5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWVLkdLnImuTbilb96WgDLAvNONYn52zpl/pnrkZTofsQZA7vTdQukdgOu8xDDMVO+RZ158nkCF9UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaiKw779OipnH0TGbtL8CZP80Q/wqQgxt7oA7HpTM8SPVPm3U2
	LnEOy9JgzKE3WbkvRlxc29zYjkVpV22flR+L4gJlHP3TG7Z1iqy6OR87
X-Gm-Gg: AZuq6aJVwOoaBrFIwl34qsaE1zsx4WpDgRqsiCsKpLU0pj3wQs0yQVa9CkZCD/GJ/so
	E3M9z75SqLe2M1k6KtX8Wqf6LHtoTh4PbC5u6IaksJRpR2crCvlSlw5UAbO3T4/rpY81HG+spV8
	ozXNx7khpTlhTgGF899IOlIK924O41Lo8m6Hlr7Dxa/o/xBqc+Kbfk+xREvzm4fGq1tggrgbpsZ
	8A+i2ot1g048o0edszvNxGfA6l+fw9vu8KSTCdn3CCBtjYTIl96oli5H0buflWqT/bbGhjXskFb
	hOEPHT2Ran6e/ux/XgUSeEAIUt8waFLQTPuzZd79F6YBQ8MAzQOTpz3XBaw/J6Mj8AlcHxbobIQ
	5KBO9ysJHQCkkGATNYYBPAP3XEGKp/R3CPzTUXAf0eestzOUJ5gbx8H1LDOsWkh/Y2gPmcUrGU2
	34stVmZ7FtSu0ZtVcOHYUhOLE=
X-Received: by 2002:a05:600c:4f54:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-4832020df4emr103964445e9.11.1770555952781;
        Sun, 08 Feb 2026 05:05:52 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2110sm19201164f8f.3.2026.02.08.05.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 05:05:52 -0800 (PST)
Message-ID: <0033b0b2-1eb3-4486-abe4-62d25f10b22c@gmail.com>
Date: Sun, 8 Feb 2026 14:05:50 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: leds: document Samsung S2M series
 PMIC RGB LED device
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
 <20260126-s2mu005-pmic-v2-2-78f1a75f547a@disroot.org>
 <20260206133837.GA157817-robh@kernel.org>
 <DG7XJ6T9I7HU.1UVHH2QWX31O1@disroot.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <DG7XJ6T9I7HU.1UVHH2QWX31O1@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5954-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA4D1108B07
X-Rspamd-Action: no action

Hi Kaustabh,

On 2/6/26 14:56, Kaustabh Chakraborty wrote:
> On 2026-02-06 07:38 -06:00, Rob Herring wrote:
>> On Mon, Jan 26, 2026 at 12:37:09AM +0530, Kaustabh Chakraborty wrote:
>>> Certain Samsung S2M series PMICs have a three-channel LED device with
>>> independent brightness control for each channel, typically used as
>>> status indicators in mobile phones. Document the devicetree schema from
>>> this device.
>>>
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
>>>   .../bindings/leds/samsung,s2mu005-rgb.yaml         | 34 ++++++++++++++++++++++
>>>   1 file changed, 34 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml b/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml
>>> new file mode 100644
>>> index 0000000000000..6806b6d869ff7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml
>>> @@ -0,0 +1,34 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/samsung,s2mu005-rgb.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: RGB LED Controller for Samsung S2M series PMICs
>>> +
>>> +maintainers:
>>> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
>>> +
>>> +description: |
>>> +  The Samsung S2M series PMIC RGB LED is a three-channel LED device with
>>> +  8-bit brightness control for each channel, typically used as status
>>> +  indicators in mobile phones.
>>> +
>>> +  This is a part of device tree bindings for S2M and S5M family of Power
>>> +  Management IC (PMIC).
>>> +
>>> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
>>> +  additional information and example.
>>> +
>>> +allOf:
>>> +  - $ref: common.yaml#
>>
>> This looks a bit lacking. Don't you need 3 child nodes for each or
>> reference to the multi-color schema?
> 
> 	rgb {
> 		compatible = "samsung,s2mu005-rgb";
> 		label = "notification:rgb:indicator";
> 		color = <LED_COLOR_ID_RGB>;
> 		function = LED_FUNCTION_INDICATOR;
> 		linux,default-trigger = "pattern";
> 	};

Having label together with color and function doesn't make sense.
Please read label documentation in [0].

[0] Documentation/devicetree/bindings/leds/common.yaml

-- 
Best regards,
Jacek Anaszewski


