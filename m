Return-Path: <linux-rtc+bounces-5928-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5nnNERNhfmn0XwIAu9opvQ
	(envelope-from <linux-rtc+bounces-5928-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 21:07:47 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D522C3D36
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 21:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 152FF3010179
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 20:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F766374179;
	Sat, 31 Jan 2026 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x1U/1PC8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E933AD8B
	for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769890063; cv=none; b=PV6KLU6LdJ8wowPVM0itHL9pvwz/7Ay3vtfBP56r3cafZbQgHlHb4eKT5LZ95iTY0uirs+p5bOy17USRSlppCyWMlpNk05W02FRSI49mMfd0zLixJojtNBAp9N3QvuapbW2ySicFd7E8rtcR8NC7ahPf9xcDDa3krq1AN2TcY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769890063; c=relaxed/simple;
	bh=xS3e8ju4KxAE1UqhUQJUikGXCG5dy7ygEKTrRJaBpbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ5pzGa/z/2Zo+zhlUNK5+MXTJLgy+/VWdbZfj4VdwlgsrpaGYwsYQlYnHFqY7KcCHd/gU0+EmDUE+yRRurs52RIIFlUkSygn+qpkZHxeS/4HoMMtuLwvKnY+5o/+FO4QXbHbUIHR/f1wBrdEnP2JnayN6C8UW/s1+uc2bMsl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x1U/1PC8; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-663170b9472so833381eaf.3
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 12:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769890061; x=1770494861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPQweXePAIgWPUeP+4oPc8F9cW9X2kvvTvA2qMgRij0=;
        b=x1U/1PC8ypQ4/og95JWhBiybXRCyCtAVDSF0MrFdDFk9ftLe16ejZ1nRXgeaQsrafB
         xfYoiael/UebDWkNXf8t/1+z5uBTnIOl9e42uM9S98Vk68INVX1OrV/KucZ1hc2ZRh7p
         H+/pGdou2cPu7csl5U9WXidEYeg5bbG+lTZpwzStpJhsCxLcmNvmz3TAG7vpnOD4lMoK
         XVIlXmni7tFVE5hdL+vN/rn9F8AAoTqAoLrZTSyF/Ak0MYseO1yeusQ+9C2MJzclylds
         5q90dFtW7SyqZ7s77L1jPxULnMcBvUCVocsQRmcsGZZaxkZHd4D/Qkpou2I4F9gOcpmg
         V6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769890061; x=1770494861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPQweXePAIgWPUeP+4oPc8F9cW9X2kvvTvA2qMgRij0=;
        b=Mmk+3RYbS7JUlDigQozqxQaBvaQXPQigjIpfsDOVA7rtIZGgKjFhj+7B8jEvweL7pX
         nM8c2OHyM2hSwiW8grtKfrgog+hNZuV22ss5iXYWRVdOFRhuQ9YY7H2zFyzIlT8qamLu
         KQcQ/h0ZeszKExssaCOs/sDwWPcaW2ykrSMWNU86XiEkhjAfIl6i/wmYsIQWKWiW0grK
         CoW0lBnA774Ca4HanOvvYU1p/uYg+uLn49gAaiIMAfDVJKgAy3M2VQ9KzrsbbZ7Xnp2f
         V/uB0Me6H3LkCatOFVV0iGvhPlvlX1IMgcJcl0U8tJzpYRgF6J26lhahYrow/lmifyfw
         5/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE1koaTeJ6oyFO1q0xXu7/fnEFzwc5KHx5JREetUccvLdCbem6inP/ehb0P5TvSPyLEIpQG5HiImQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6low3dLla1g+LrXkdIpE9JqHCyQ0sW6ZAB8F5h13Gia6QlbHF
	RVHQK7+URchfp/tKhyUFOLik779Co/Uy7+TofkP1//NPPyKzVpzUmd67E3WdPijUUXx4qV7/5/M
	NI47U
X-Gm-Gg: AZuq6aL3vEmBiWcwXFKXzYqEqm1TxxXIImJmzD5390Jpt9lmUYi/mOOqozcVrlyvQRC
	CmTm0ztfgNZBPEi/HzrgHaM3HYP1M6BRtWEAwiIBemb/2JVKh3QrhUbH7yGJE7Rx4axJ3WLFhM9
	ADifbXa6iBwkw43r56Vhfe/0WZI1wJlRa69/tZBj9E+M4MAYrphlu2Q2Y1wrwx4Nli6zJSdSH1b
	taesr8e35lDMdaeio0YkdHgDyjo5UO3wnpVzIwuxs/NwL5ZmxHv3IirqvpQQBn7IKJJGXGXQrQv
	S4XxINYA0FoacZMRxTR1FTUz4GDH2mJt86BNzH1qUDZ9REgNs6YkwdRcInaqO3PYDP8uiuf0cz0
	SIs5p2kM/JReq0XwIiex5XedZycSJHct06Qr+FCoJc/dSlsd5DIMStF6J2WEsVr7/S5/XjYTs8C
	oqV8mC37NIL4HbeUuU/osCiIaDeY+LTAwI4gfC6moPUZjMyj8zoUoWWiUldlbB
X-Received: by 2002:a05:6820:623:b0:662:ff14:58e3 with SMTP id 006d021491bc7-6630f02bd08mr3021888eaf.25.1769890061056;
        Sat, 31 Jan 2026 12:07:41 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409570f63b4sm8571762fac.3.2026.01.31.12.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 12:07:39 -0800 (PST)
Message-ID: <fca2c04b-fe1c-4685-9c80-b0d7d37ced60@baylibre.com>
Date: Sat, 31 Jan 2026 14:07:38 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] dt-bindings: mfg: motorola-cpcap: convert to
 schema
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
 <20260125134302.45958-9-clamor95@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260125134302.45958-9-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5928-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D522C3D36
X-Rspamd-Action: no action

On 1/25/26 7:43 AM, Svyatoslav Ryhel wrote:
> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.
> Audio codec bindings adjusted with common ports node for port@0 and
> port@1. Added compatible for Mot board CPCAP. Other bindings remain the
> same.
> 

...

> +examples:

Ah, I guess this covers all of the missing examples. The other commit
messages should say that was the plan so we know why the examples were
omitted in the other patches.


