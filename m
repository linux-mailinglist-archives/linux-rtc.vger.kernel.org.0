Return-Path: <linux-rtc+bounces-5269-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF9C35597
	for <lists+linux-rtc@lfdr.de>; Wed, 05 Nov 2025 12:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F0E03A6AD8
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Nov 2025 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514B330FC03;
	Wed,  5 Nov 2025 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugo+/H9y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1D30F545
	for <linux-rtc@vger.kernel.org>; Wed,  5 Nov 2025 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341766; cv=none; b=OHLdIOVZTvZUipG8n3pSLXtBcA+NXWG4S3Znh/ZBW/IrAnwgP5VuBjcdsXpfAgxd2IHemKdrTh+1ElFrzCopguPQtpziPkkvPrUWLqsqscc7qAkWYxs3vMo3otcjXNUEIRNsXqArYyf6MskUIP8ziXnVzkHndDuXth2FmbZaddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341766; c=relaxed/simple;
	bh=Ii9b2rpzXiRDukDeUtY2WS5XvNAk5U97MkCbAXQdp7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxjfYkKHGgZWhzgtpA0pbquSYuQD/H9QDtjn6JPiPYyc5+EAj42x9arVIGFFvZhsDyhx9yz+6O5SkIQTn7hunq0oAAVKVBpozX+ibC+XNNMkovkAn3zedWSRBG/MpfLrvturt5pW4YNdEuxUKn5VzlPBIWDpViifUW2TGSNZFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugo+/H9y; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-375eff817a3so64466961fa.1
        for <linux-rtc@vger.kernel.org>; Wed, 05 Nov 2025 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762341762; x=1762946562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lgjq5frjKtchDAt0hCN8TCDb53mEX1KChcG+cIgj+As=;
        b=Ugo+/H9y30ONhr7fDfdxbpsqWR3tRjLh+BuyplYG+qinlo2qxVVE4FuU4lqg9t8UmP
         fVDVTXoFX4dBwApTOCOGf3JNHagxzSd5IcYye46YRifeue4oQvK+rCDY6250s2aOUHg5
         fWNdaQqGIKnqGL+6iwoCI4B1KwMjvSghMySRVbLo/w8XC1vtrbeE+e8rvaXdbSppm6Pu
         jwzcMBE7OMaVCmpZm+PQVU/4EMvbFWk7ZoQe404b7k5sOktFJtHcSqzL3FIgWmRkzwO0
         dAicFKMGSMh+zzlQdFh553R+WyaxAPatOLu++DAI9JeRl9GL5PnvoTJduTUCYgVMQAlm
         q8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341762; x=1762946562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgjq5frjKtchDAt0hCN8TCDb53mEX1KChcG+cIgj+As=;
        b=IiYoZ3sctGOCjeY1u9gG9FmiisdIfjQcUA3qptyPs6RchQY+obt50SpyGjfV99fACS
         PLdFXq/tYPXAivMHmovJ6XBmS4PiuTnjTTG4JOCpf0kDyaePfNAlfE9GSwgOumahq3q+
         Dzk4eZ7WhJj+rT7XtUjzdkczhn9wVLGBkXrWRyyku1EGsggom5tSkNu8cYJ4WTppYOdp
         RZkvva3iCdwnrTtP4S4z+Djp6b5MSsB5slqjl/XqcL2OXVd/BPBXJ8kTV9kdKT+CFzXL
         esP50rRq+laHma7cz6jGbA5XYJrSZqTwFHvPrb08mvg6yyPYC2m0mVhDj2NvrDLDn2h7
         ZGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2oRM1rlR7mxaS1RQzaYL1QtjARHBtw0FqxKhRC+l1MlCOFD+KT/0znYQ/LDTJsve3KNUZTqqCHV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKkseoD9Ll3QqAdTkd5KcKoy54oYvBSTgrPaNr2D594yCGyq0q
	CgIpNbc+U9Kiwlz3WSWoToxDnCfwoIuWq5/Lev8InvoVfzAbZKBdvIpM
X-Gm-Gg: ASbGncvXczviWzoHFyRZgWcZO9TcKQIH+ueNPEpRlLdKWExO0f7DTPREvFloyitaszM
	zRb/myJKdtpEtAB5/1/xz49N3Oj7sGYOFBUs62cLcGtcTaR9GVH6tSCLTPg4+z1z5QN9jbaavpQ
	QK8QDnF3cR8I9YlC6g2U+ygwyeWrXj4TR18lyrZPqSsPx/46siXRdm3oVFthkHbM5k2q1WYV4Ur
	+FwhKGn0iduH90cQxu99Uee0A3kyKD3lpMvhAi8rX2Tl6xWgMRs2U4t/Uf24kjKuF7WmwU5JrlD
	6rWsDCqFS0/zrdu7p4nN2tBHdT/rpx2+NOpP0i7JxjSp9iNXxDRMJTnijx6bshAyb9i0rT0N5hN
	kaWl8AoPjA6+uhHM9+z5yHjIlS8B9bHLqHJhvlXfmI4jFcwN9AsiAPhPFstvmBLPO1bAwsW6Rcn
	LqJQefNOW8FzTLW0Dw2c9T0mW+DPhOVS6JXbWPJrXeVu6MfuUDOxkgmXNcQw==
X-Google-Smtp-Source: AGHT+IHpvSjuUZgOT3CU6iwhd3QH+qr/blJkYgQLVxgzQhufOUjboKrykT4Eu5lvIJTa8VYLu1Svkg==
X-Received: by 2002:a05:651c:4006:b0:37a:3b04:1a1b with SMTP id 38308e7fff4ca-37a513e604fmr6509411fa.12.1762341762189;
        Wed, 05 Nov 2025 03:22:42 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a415c8070sm14290231fa.28.2025.11.05.03.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:22:41 -0800 (PST)
Message-ID: <1aedf1a8-ddff-47fd-8afb-dd60dc42e12b@gmail.com>
Date: Wed, 5 Nov 2025 13:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] dt-bindings: regulator: ROHM BD72720
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-leds@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-rtc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <cover.1762327887.git.mazziesaccount@gmail.com>
 <48fe6e2642db4484640b173cd71be1b245929122.1762327887.git.mazziesaccount@gmail.com>
 <176233320981.143013.4115240062372455834.robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <176233320981.143013.4115240062372455834.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2025 11:00, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Nov 2025 09:35:59 +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD72720 is a new PMIC with 10 BUCk and 11 LDO regulators.
>>
>> The BD72720 is designed to support using the BUCK10 as a supply for
>> the LDOs 1 to 4. When the BUCK10 is used for this, it can be set to a
>> LDON_HEAD mode. In this mode, the BUCK10 voltage can't be controlled by
>> software, but the voltage is adjusted by PMIC to match the LDO1 .. LDO4
>> voltages with a given offset. Offset can be 50mV .. 300mV and is
>> changeable at 50mV steps.
>>
>> Add 'ldon-head-microvolt' property to denote a board which is designed
>> to utilize the LDON_HEAD mode.
>>
>> All other properties are already existing.
>>
>> Add dt-binding doc for ROHM BD72720 regulators to make it usable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>>   v2 => v3:
>>   - drop unnecessary descriptions
>>   - use microvolts for the 'ldon-head' dt-property
>>
>>   RFCv1 => v2:
>>   - No changes
>> ---
>>   .../regulator/rohm,bd72720-regulator.yaml     | 149 ++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml: patternProperties:^buck[1-10]$:properties:rohm,ldon-head-microvolt: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml

Nice! I'm not sure if anyone has said it but these bots are helpful :) I 
forgot the type to ldon-head when switching from -millivolt to 
-microvolt. I'll address this for the next version.

> doc reference errors (make refcheckdocs):

Thanks for including the make -command to the mail! I didn't even know 
about 'refcheckdocs' target.

> Warning: Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
> Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml: Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml

Hmm. I suppose this is because the MFD binding is added only later in 
the series(?) I suppose we can't help it because the MFD binding 
references the regulator binding as well. So, this is kind of a chicken 
and egg problem?

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

