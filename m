Return-Path: <linux-rtc+bounces-6852-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dzlIF+DsRWoGGwsAu9opvQ
	(envelope-from <linux-rtc+bounces-6852-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 06:45:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E44916F371C
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 06:45:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bjKerupp;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6852-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6852-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAB793033898
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 04:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ACC36493C;
	Thu,  2 Jul 2026 04:45:16 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978F3655D4
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 04:45:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967515; cv=none; b=mSyse6PI32SV12Hq0OLjZNzC+y4ZvbJT7gRV0dVuXg8lwVe1uYDmCKNgPR5sGvk84Wdlfo3aqoJ6WDVKdkdaNyO4djAxmGnA96tUrcj6xfqQvN2Y0iW3Kq1Ni9WgfF0wAaI8F+g6U9CtqId3usb2TGqqquc4Xnln9VuWYUaYKa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967515; c=relaxed/simple;
	bh=zUFAH3NBQDpr7v3T1RkPoSIRDjtGOjb93jmULuNNKv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmnC6yC4LxNaZZ1gxkeOjjnjZlqTOpsimrcZHQlavkx2+Yc5SmztYZXY38g3m5KDDTdwOT7k01ZARcuoNM5Y4GrKhEtAex1rMcc3BFdebfPNBIZRAqMJc+uxJImWqKws7jrWH+dI5aITVmXlDmrR/WUknX2QZq9UZFSfQIiTOY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjKerupp; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so1138917e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 21:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782967511; x=1783572311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lRyE20bNy/13dqyToJ8rkPsR/Q6IsOETP2G+AoyHiI=;
        b=bjKeruppU6rKZUail3mmzZ7u/QU6eM1uFf/zjnc6LmhxkUA2gLDVR6pwEuxZKYx5Ml
         YK1sbvJWFMywc7/EYVVHnrjftbZG4vHlb9RZyl8sSdk6bhHyHOFe4YZdEegtk343qqso
         Vv4kbEAQMwMIljdMK9oYAHYHJkZgrCuJmS9UkTC8vUp0U5uQkWOoUP7o3jtH5qlNT/a7
         BakcFlnvi1mP75F8kiDeO9KNv5g7rIWTA2cYvJcddXsDFCGmUqC1YEqsfNJoIh8ytw2L
         5Ov1LmE3SGFFShk3ysOEZbBITKCedxrKaTSeRDHwAvY7ZQb3Uc1wFUh2wQ+SanqxnSDi
         t68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782967511; x=1783572311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lRyE20bNy/13dqyToJ8rkPsR/Q6IsOETP2G+AoyHiI=;
        b=mgjyE6IneKq9Sua2/iJnrv0u1jKyDwCrkCvuYR6/U5ys1kCerlP2o9uZq1vzaT1Jhd
         EKFrhDmXtTQcKUlnOITCURZVeeFA/rCal7vL4yPA6tPgxq5AQ2kQ9h/jQf0Jjl9eQMFs
         /ImSl9Bm0NUI43iOeUVvbSLFd/q8ELIcCY5CWKJg3fASv+ZbhnOCF+AAiSUvQse6yrOS
         Eh1ZrCYF04+Kp5o96bul7nt4+8WfDK/dmPpNMkGq398PBiAYNL2oQaclv8OdTF4Tdw0v
         YOYAUtzkkLNwi8ESfOUCA5nlo+m1GWrALOjnavMclu8/l1sNGdobyhmqEk8Gn/PYJDjq
         HuLA==
X-Forwarded-Encrypted: i=1; AHgh+RpmMEuiQqEOsYW1GsesouCJikX3CCJKWiwJJIm3bTD7I2oInGLcE7NmNAYa30MnctP9rwtCf7p5R6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ70SXJZS0Tp8DnGq5taayjlVu7BpcbaJjNs6qcNiEZzidQVJk
	a49FIuvjKhm2o1tzy9UbY4lrkAuNgryFNDZ0Oax4D6L1pqI4MNOG5AvN
X-Gm-Gg: AfdE7clkR0FczpzWnMoJp7qcrWuV9U7WCJOlkVxcSBKlD9N/s/7mBON0ybmr9V0U/aL
	AcBabwZ6UtT7XXGCFCj0CVojKupZEQGnp799miutj2PRA1qF1yIuok57WBvSKlJ2OOzDfuOF+Zj
	mLqFIOv/DqLuf6H5PntbJz/1D8ATzmV6MOpJCvl8RUivu8Z2SqVjOq6YUYW4HuZ9a9EiIc9ir/j
	oX6ChGyw89LStpx3yCqiK6kw3b2i0a2CPtMy9CRNJtCPYx+ljcFWOc4+OHqR0EcgOCIJbBHINAw
	a9EVfrBKsbpDx85VsIppXEgzFl7AhtHIT0NKAcS7C/YKuCezsx1FxvZ2ClcFBJmICdITnx6vgGL
	9M0WvZYl7XmNpKbhtaVjnDfnult9rMrs/iHOwkO0au+im0J/awslb0ccAlzVwgd6dsyExCno2Jv
	NTnEx3MHZ3PtWA5PJvkfWDko+Szzti7qhJxktP3yAkHkbZLF5jKcfNp18ooZ7CGjSZWFv53w==
X-Received: by 2002:a05:6512:628e:b0:5ae:a4f9:fa8 with SMTP id 2adb3069b0e04-5aec6794c52mr815888e87.21.1782967510545;
        Wed, 01 Jul 2026 21:45:10 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89916c5sm442599e87.9.2026.07.01.21.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:45:08 -0700 (PDT)
Message-ID: <94f359ca-9a84-4d84-b3aa-990b15937339@gmail.com>
Date: Thu, 2 Jul 2026 07:45:07 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: regulator: ROHM BD73800 regulators
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <67b42b5363533f11c22a6421417c3345f9872aec.1782909323.git.mazziesaccount@gmail.com>
 <20260701192559.GA1313239-robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260701192559.GA1313239-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6852-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mazziesaccount@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E44916F371C

Hi Rob,

Thanks (again) for the review!

On 01/07/2026 22:25, Rob Herring wrote:
> On Wed, Jul 01, 2026 at 03:41:11PM +0300, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Add bindings for the BUCKs and LDOs on ROHM BD73800. The PMIC state
>> specific voltages can be set in same fashion as with a few other ROHM
>> PMICs (for example with BD718[15,28,37,47,50,79]). Same properties are
>> recycled :)
>>
>> The LDOs 1 and 4 can use different voltage ranges depending on the OTP
>> configuration.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> ---
>>   .../regulator/rohm,bd73800-regulator.yaml     | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
>> new file mode 100644
>> index 000000000000..c427a04098ec
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
> 
> 
>> +      rohm,dvs-run-voltage:
>> +        description:
>> +          PMIC default "RUN" state voltage in uV. 0 means disabled. See the
>> +          explanation below for regulator specific details.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 3500000
> 
> [...]
> 
>> +      rohm,dvs-run-voltage:
>> +        description:
>> +          Set the default output state at PMIC's "RUN" state.
>> +          0 is disabled, 1 is enabled.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 1
> 
> Same property name with 2 different meanings. Not a good design pattern.

Hmm. They do actually have the same meaning. Setting the "RUN" -state 
voltage. Values '0' and '1' have special meaning "disable" and "enable" 
- also for BUCKs.

For LDOs on this PMIC, only the enable/disable configuration can be set 
for each hardware-state as the LDO voltage is same for all hardware 
states. Hence only subset of the property values (1/0) are supported for 
the LDOs.

> Also, if these properties are copied from other schemas, don't duplicate
> them. Put them in a common schema and reference it here.

Ah. I think this is a great idea, and I should've thought that already a 
few PMICs ago :) We have been reviewing and discussing these properties 
with you since ... maybe 2018, as I've added new PMICs re-using them... ;)

Thanks! I'll rework this but v2 is likely to be out only at August.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

