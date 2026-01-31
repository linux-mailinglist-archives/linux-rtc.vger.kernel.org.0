Return-Path: <linux-rtc+bounces-5925-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LWkOjRefmkjXwIAu9opvQ
	(envelope-from <linux-rtc+bounces-5925-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 20:55:32 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E20C3BEF
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 20:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B35E73010D87
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 19:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2224336C0B9;
	Sat, 31 Jan 2026 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rmw5E5Of"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7736BCEC
	for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889330; cv=none; b=n8X0w5Zej7zsTn4LpbHZKzCPOIakU1RZRYSQKEnOt9/kaE6XPWlIEUwYMiowwzFszTKsiXaQZgFIr1Lq9TWfv1CptIFkEYdOob2zqjfTm5qsNqKBP2WQm1T2No45hnvlSUwze8BYt6CxCw3dgIoN+skRIVdqAmjb+D+ymBFImQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889330; c=relaxed/simple;
	bh=t24mKOVNxxmWMKS1t9FekxYrZBCi//zHUHXDdl8G0I4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ToBKrWDRQe/npEKfoddc4GnGHIlAc/iiNiw9mbYSjhqcrc3fDngkEzFW0kcdrE2TNnlxmeR0Qj4Lr28hJ1YYh2yOhbXETeeg/Ehq9fTzI6NCSVooiFusXj25HyccNQ7/5LJG4zkYdimBN4l/pv3KqFPSNzmdqbd6gh+00e0QesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rmw5E5Of; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c93313721so2127736b6e.2
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 11:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769889327; x=1770494127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+VFD3n9uqCeuR5oa2hiu8NEEffv6cHN447B+eVXKTM=;
        b=rmw5E5OfI+f9amD6CdjrhJUpCNx27t7LETFfGMwZRE2lrMnm+9y2OQjwmxPrPW3man
         V+6nlU0IVqBn+5Th+W5/mcOEgfotdTkizpd2otLJePaCosTzUajbyhOjOr03lyvDqS1L
         0vGmSifl5cJkBqZKsOoRj7Ni7bioYTOOF+lhA0tesl//JzQduo+CUjDj4rbSKrgb7CpN
         NG8VoLCp2bpkgTW7tN+JFY0GA8HV7zzcDFzp/LKq/NFzgTcHbwav50ItqfJBXsGFtsXk
         oHeBuJ63edbLWvskebiTUHsHfVdTs+Wz7SVoouNmPdwCAO0HOuudFCchDS1w8pa1xZTF
         lefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889327; x=1770494127;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+VFD3n9uqCeuR5oa2hiu8NEEffv6cHN447B+eVXKTM=;
        b=P08+qDDOSi6YVv28ybrrVWFWEQiIUHSrMmdyqrj9X9e+Az5WdBYORtRf3loc8nNyh0
         t/Vdv0GZYdPuTw7PPKxWT5VFWYDk9P/i9+l/W7z1ODalHkBd+Mk0ugDQqVrf5spAY3x2
         ZvBbYzGithHnh2g7Qw7hqzAeSZVOaLgV5+zso5WXg4i0ojVjiRzgAtO8OiYvD9gVZsgr
         rFgclFyFpwF8Poa7+1dJ4xgAgWWROCvqds95TKBDTXIaFeBDAeU0JqEERCNlBmbPwiJG
         hYeGPZPrO8DeutR6mIZVj0JRUUXKvnyacGySutwUtwW8ys51BL/R7Hhj/99hAV28fTZW
         k/fg==
X-Forwarded-Encrypted: i=1; AJvYcCXnAxbhONLffuvBjw8AOOOwLgYGPVY1/G/ElDbD+tVuBIhgKALYEolJDSK8IpvR1EZkUWEVZTkq9B0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbkdbr53175XWfNVj6+dfKSPtEMg8G8JlNZZA4wuts95nyEn8/
	7FjmBSl8HMhwPzG1+YjrxogAD2zAncmuXkO5jPWPJoN24Ru6d8z8BA7JStHWiDHTutU=
X-Gm-Gg: AZuq6aIFhQQWXBVPCOpg/uQQLHKoFpJTmil5K+dqfjSGPWbGzECmDhX/xnbE0RkTd+p
	FvZgD9ydo6/DUkg1HOWV8+N3x6Po7J6geuITUpN2LaIv/256wgd7p1O2tE+uE87+ChiPZU0o5ON
	Usx6CU23IJ3bIYzLPedaTqkBdbYow2cS9W6C12GdxEmQfeEKOXY6phtBoCxDCEpfdDie0yg1Z9T
	aPxlx88zwz3uyyhvu0yM9x42ROBdNdKBN+a/d0h338/An7sLU8BvWfbdXr2k8EuVYxd34lCXwpm
	WVSJ+YLKOQdIiL8DaoZjptRQanyF87lFSfUt2Cq7HGMZaTPJVq6yQ1K9KzQZvFLG0QfgIBX4aRa
	SPP1IcuQxHaRAVll+KZpsTnNAybZ5M+FaPtbG+rN2D1VGkbblG+yZVrCwwLMcBz80zm1g3MvB8f
	WfpHuQBPlzR3N4SHswGMOvx512F7s4CRuLACAOV323bNhnQUOnuVJSE87qU+j2
X-Received: by 2002:a05:6820:2228:b0:663:8c2:feed with SMTP id 006d021491bc7-6630f3d4c04mr3300269eaf.83.1769889326973;
        Sat, 31 Jan 2026 11:55:26 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f9a49769sm6775854eaf.15.2026.01.31.11.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 11:55:25 -0800 (PST)
Message-ID: <8cedbb9c-9f72-43ae-a23e-705b3feb85fb@baylibre.com>
Date: Sat, 31 Jan 2026 13:55:24 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert
 to schema
From: David Lechner <dlechner@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-2-clamor95@gmail.com>
 <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
Content-Language: en-US
In-Reply-To: <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5925-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,analog.com,bootlin.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42E20C3BEF
X-Rspamd-Action: no action

On 1/31/26 1:46 PM, David Lechner wrote:
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
>> Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
>> from TXT to YAML format. Main functionality preserved and added compatible
>> for CPCAP regulator set found in the Mot board.
>>

...

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - motorola,cpcap-regulator
>> +      - motorola,mapphone-cpcap-regulator
>> +      - motorola,mot-cpcap-regulator

This is what caused me to get confused on the order of the later patches.

motorola,mot-cpcap-regulator is a new compatible, so would be better as
a separate patch.


