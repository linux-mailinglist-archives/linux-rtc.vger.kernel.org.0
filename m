Return-Path: <linux-rtc+bounces-6853-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BFO4CKfvRWqbGwsAu9opvQ
	(envelope-from <linux-rtc+bounces-6853-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 06:57:11 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A576F37CA
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 06:57:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=srgtvfhF;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6853-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6853-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C98C83005EA1
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 04:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586FC3644C9;
	Thu,  2 Jul 2026 04:55:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B083546E4
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 04:55:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968153; cv=none; b=JEQBM5VkFK3iNdmvTfCOdbCw+DVsDMhTvAb9AHwHDkYOHVLfgS3TfaM2lFmirpvbM2ZD4TQrh/HCpgpBQCLhnHiE/iNs3vEFszM7stBO4XBiW02XJ4oU4IUTlKZwMMBuLeVK5rHadrSZrZGgP6V8OyGd5gi6rPqCLWXafhfJ8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968153; c=relaxed/simple;
	bh=GSS4EZh7oBQIXtndY45bpUY9Co6B5hnpvR7DwawWloc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcrTAK1n3n1E+4Y7jmemIOquTo0iPZFqyewGzz9gKT5T290YnldvlWDIr5EqNoJOrE9IEmKfygb6dVFl0p6TAcYyvAsVZQJBHrTBtsoRwbVHHdmQqeRzgxnmxuz/7vrvxYKcJ9l/q12qsXQ85LMPtCNSfllxOixlj5FC4m9f6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srgtvfhF; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso1391683e87.2
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782968150; x=1783572950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMGAtiVG2tLVc2K86tjnvaWkLMJ+BxBeHK0dLBsStdY=;
        b=srgtvfhFk392LBY/6lVHEi2vmEXVgmIWyyUnQ/EFsiDv8xWaThAuywIYyhMplm5LVx
         CHWityjtWP9UhcEcM1B5laazeZBU2Lp9gFAGAKtDd5szXMniofUVWypUHz8vbHhgNF3k
         0kQ0MLMTUGqeD5G8JOws2OIK9upTJQOT/lWX9BqqYRzteKwjR1fCFfYAejA13JFdsnEy
         /jDb7q/mnxu8ACzGqPQKFY0QE6NFGbZc3AHRcJO2nViXJQ/q6vhXKGft3Y5YnneODMhH
         bB3AHdjUBo5zVWJxYA1U/HWW1H+jOCW4fqscw1fwHKxFnnlGX365zbc+Yuw9+NeN+j9l
         tCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782968150; x=1783572950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMGAtiVG2tLVc2K86tjnvaWkLMJ+BxBeHK0dLBsStdY=;
        b=XHflWXdhds7zAg9bDJYFRvTvuuJpCfa13+zjhH68iSpt7/HEZHQe8qM3OYbeldIIq/
         5SSdro9zFwqzu4WP6zKQeQzZ57VtTIt7oTRSip6ZJ7/avRwUojDL34L7mbGIg1Ya1NR/
         QkRgMMJ2nIhH2V14P7adDPaQNjhwELhgEX7SY2+6a1GeHpBPLzY67spXCaoifjkW4AvV
         RO496/bvrQV8+KrVFDMgvkq5brmjzK3IbMnCK/GLFKpdddtQRQh1/1MIamhZzUOqqc0z
         DZycCeVB6nMhmuvP/aTNz4mrqqbNZ3FXDq/lATNNSWtsUS2/sxqCQbRXEUn9V08IBfqt
         Jz5Q==
X-Forwarded-Encrypted: i=1; AHgh+RouHW5jL4WTO04OcSx8iRFFmLDOYJfHcgCXP08xP/40opMW8ASY+WRVis0sDkeWJQRMtOHUTzuV8Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7hVTj1rIZWZwXTxBexEGWP6DILSFfYZHeI+MEHWyWbeHRrwkd
	+J+03+Ut3E1f/ndd2l8SQKHSN2KZmm2LKc7xKCjXH0TDyXudhad3PrZ4
X-Gm-Gg: AfdE7cmv1fWpivqlGCjF4jQZt0cB+AW3W7nE4QRj//Q75rEeS9MEIReHt+nnHT2Z+ao
	J9ViZECFraCAm2nslNQOXArwxDb18I9FHx7jkyEG/YdIIUEsrDDEkbWbTDUg5pRSXXi8WBb8TmZ
	zme3hMlUcoFGb5tfgwZ+wmxmmDlMMV32xEbT/Id6lFBe+eYreBw61GbtOBm3Otk1ie9WLHqvvUv
	FRUL7FhHSbEKLxv9QmdMF07dlfAdZ5YlpT+EQyGvKLgf5U06s6WobfduqpBqfFleewPPAKynPgI
	3WtfWtSYTp0lBMcbeby8IxBFQH6bZdwQw363FxcS9kalzAeejoTvz7NzC8RhVsV8wdKVTBEgijZ
	n7L3UKWgSk+1rHcEfrY5pWathE2hBCNiT96wbcSS3r19MqWWMGVOSM4SyHW0lWzpW5sBrKd6k4L
	1qdoNcemxnC7K5AFcUw7sqwa9SyQ9WqOmi6sT1JtCX+Oyp0kGrMf4GfofmhVcQAqUPOVqFcg==
X-Received: by 2002:a05:6512:4502:b0:5ae:b489:95c0 with SMTP id 2adb3069b0e04-5aec8026071mr740640e87.16.1782968150042;
        Wed, 01 Jul 2026 21:55:50 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a3a8sm430135e87.31.2026.07.01.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:55:49 -0700 (PDT)
Message-ID: <96afdec2-db03-46ba-96ac-f52b13a92d5d@gmail.com>
Date: Thu, 2 Jul 2026 07:55:48 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] regulator: bd71828: Support ROHM BD73800
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <1d00359236272fd1fab0dfbcb9119d2f91aa0d23.1782909323.git.mazziesaccount@gmail.com>
 <bf744d4f-eabe-48e7-92e4-b147b8d79d91@sirena.org.uk>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <bf744d4f-eabe-48e7-92e4-b147b8d79d91@sirena.org.uk>
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
	TAGGED_FROM(0.00)[bounces-6853-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 70A576F37CA

On 01/07/2026 16:01, Mark Brown wrote:
> On Wed, Jul 01, 2026 at 03:42:35PM +0300, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
>> +	nproot = of_get_child_by_name(nproot, "regulators");
>> +	if (!nproot) {
>> +		dev_err(dev, "failed to find regulators node\n");
>> +		return -ENODEV;
>> +	}
>> +	for_each_child_of_node(nproot, np) {
>> +		if (of_node_name_eq(np, LDO1_NODE_NAME))
>> +			ldo1_use_high_range = of_property_read_bool(np,
>> +							"rohm,ldo-range-high");
>> +		if (of_node_name_eq(np, LDO3_NODE_NAME))
>> +			ldo3_use_high_range = of_property_read_bool(np,
>> +							"rohm,ldo-range-high");
>> +	}
> 
> Why do we iterate over all nodes rather than doing additional
> of_get_child_by_name()s?

This series has been sitting in my "TODO" -folder for quite a while - so 
I am not anymore 100% sure as to why. I believe I've thought that the 
of_get_child_by_name() does (internally) iterate all the child nodes, so 
using it twice would cause code to loop through the nodes twice. So, 
looping through all child nodes in a single loop probably felt like the 
right thing to do. Furthermore, I've probably written the first version 
before I found out the cleanup.h...

But yes. I think you're right. This can be made much leaner.

>> +	if (ldo1_use_high_range) {
>> +		d[BD73800_LDO1].desc.linear_ranges = bd73800_ldo13_high_volts;
>> +		d[BD73800_LDO1].desc.n_linear_ranges =
>> +					ARRAY_SIZE(bd73800_ldo13_high_volts);
>> +	}
>> +	if (ldo3_use_high_range) {
>> +		d[BD73800_LDO3].desc.linear_ranges = bd73800_ldo13_high_volts;
>> +		d[BD73800_LDO3].desc.n_linear_ranges =
>> +					ARRAY_SIZE(bd73800_ldo13_high_volts);
>> +	}
> 
> You could just do these updates without the intermediate variables.

Yes.

Thanks for the suggestions! I will fix these for the v2, but it will 
probably be out only during August.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

