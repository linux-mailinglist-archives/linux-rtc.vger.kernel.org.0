Return-Path: <linux-rtc+bounces-6631-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R6JeHn+kIWoHKgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6631-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 04 Jun 2026 18:14:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED039641BE2
	for <lists+linux-rtc@lfdr.de>; Thu, 04 Jun 2026 18:14:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6631-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6631-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=collabora.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60C673007F65
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jun 2026 16:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099D940629D;
	Thu,  4 Jun 2026 16:05:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0843B19D8;
	Thu,  4 Jun 2026 16:05:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589157; cv=none; b=B5P05Ib5UOdBuuzFE5NyfujvigS2bMqYhrTURqmNuFTV2e/MYcq7uaGeRmo37R+bdB0xUcqL2KP/h0LIEP6jnQTQU63ohSUkOnnz2hdcEJweQqvRe+oom/mX9f/4CGbEeCKSEDFzyGGwrOclgyUeSCQBkv0l/a3wcRKbmRghPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589157; c=relaxed/simple;
	bh=A/bbqU+Rgpn5w7+MQPXcdG8OICWauN+wti+dE+F1DIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LWTrnFwaAa27DHLTCjx74h/L5OBapeOOu+tdOZgRrujU2zEeN8jGevb9jh7lhHzx5KRUwsrhvDmdfAXciUkxiyQC4+AwTE//yxKp6fcxvo8h7WS8GecMFJOFBp+QrvJG37cRsx14LZzOHbaE693IirKG5YHtOl7D2GGUouHpsYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA861F00893;
	Thu,  4 Jun 2026 16:05:56 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 3C2E5181D83; Thu, 04 Jun 2026 18:05:54 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
Subject: Re: (subset) [PATCH v7 00/10] Support for Samsung S2MU005 PMIC and
 its sub-devices
Message-Id: <178058915422.2707129.13570246016246731476.b4-ty@collabora.com>
Date: Thu, 04 Jun 2026 18:05:54 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6631-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com,disroot.org];
	FORGED_SENDER(0.00)[sebastian.reichel@collabora.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:sre@kernel.org,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:alexandre.belloni@bootlin.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:trannamatk@gmail.com,m:kernel@lvkasz.us,m:y.oudjana@protonmail.com,m:kauschluss@disroot.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-doc@vger.kernel.org,m:conor.dooley@microchip.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:from_mime,collabora.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED039641BE2


On Sat, 16 May 2026 03:08:32 +0530, Kaustabh Chakraborty wrote:
> S2MU005 is an MFD chip manufactured by Samsung Electronics. This is
> found in various devices manufactured by Samsung and others, including
> all Exynos 7870 devices. It is known to have the following features:
> 
> 1. Two LED channels with adjustable brightness for use as a torch, or a
>    flash strobe.
> 2. An RGB LED with 8-bit channels. Usually programmed as a notification
>    indicator.
> 3. An MUIC, which works with USB micro-B (and USB-C?). For the micro-B
>    variant though, it measures the ID-GND resistance using an internal
>    ADC.
> 4. A charger device, which reports if charger is online, voltage,
>    resistance, etc.
> 
> [...]

Applied, thanks!

[10/10] power: supply: add support for Samsung S2M series PMIC charger device
        commit: 7e541f6dbd05921d0bbb99646028cb9982535707

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


