Return-Path: <linux-rtc+bounces-6560-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AibKB0zD2qSHgYAu9opvQ
	(envelope-from <linux-rtc+bounces-6560-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 18:30:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3585A94DB
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 18:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7CE0307F2C7
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC95737107E;
	Thu, 21 May 2026 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0Mw7OHN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C5E367283;
	Thu, 21 May 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379319; cv=none; b=IyGf/dWE83TXUmS5OGfD1mBV1cgdp/C06Re5f4GQOUjvL9gfJgZlu6Z9newqrnHdS/iAVAqx5B1dP8ieYmf2iCkpdZ4+WT8oqq9iA9KkCExEEok1wHYXaUTEuzipz8kESNQ/3DzG9MKi3eTp5iHJgzJCZslVId1X0yzso7EcQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379319; c=relaxed/simple;
	bh=4zajE+XzgFcsLyX8j+x7JiDph+E49fIHPxY+eOXUhmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=npVePa1FstSZhVL73npwPaCt7TCKlI9kcL0Z7hgSHQNSrAUt2C/k++WBdJUh3lCoy9MJi9xrLS2kBL4b8MeULxNyrcxyPgOLdFgA+NR7/eQUXV/1eqCz7WGKKmm7RyT2GekqDxmlJIK4BuG2C9q4LUDKhCGcM2WDmpkp6gVcQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0Mw7OHN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AA81F000E9;
	Thu, 21 May 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779379318;
	bh=A7T6j/QrLLiXEbu/eddyey1iiI6wVJ+gjyKGAr0u+C8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U0Mw7OHNbLU9Kn/7s7HXlkjcBqWEw0fNdqD5JWt6cd9lpGaRr61H0f2v+n2afXp7Q
	 NMD1VYs1a/BrlIziwpF8q9Ku+mBSqp9Q8h8sIShrVf3cNzTB2yvcrJmwWXaTUvjNE9
	 x73t3PiT2pM6xE9lopBCxAYcBYhoAEocF4yKQ/5Kez9TXP5z5JjWzt9d42H8Ykh7G0
	 m5n9dH1hdzkWTv35Rgza1AsxKRCNenFTjUQOenyUFypQiJHh3WceAH6sU5qeoh3kt+
	 meUVrKKpyUKt110VSr31SBQhA+2GlZLl969B5RE4Hy5ce/0p4fkQezE0uGBilmLWpS
	 9KprmqBHhVDKQ==
From: Lee Jones <lee@kernel.org>
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
Message-Id: <177937931320.3705013.6267401057618787390.b4-ty@b4>
Date: Thu, 21 May 2026 17:01:53 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com,disroot.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6560-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C3585A94DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

[03/10] dt-bindings: mfd: add documentation for S2MU005 PMIC
        commit: 12479cc3750c6b741b6d87392e393d959cf2f013
[04/10] mfd: sec: add support for S2MU005 PMIC
        commit: aeff14ae7271cc3070312f894de9a4e075855d31
[05/10] mfd: sec: set DMA coherent mask
        commit: ba1f536070abd595a141c683f617eed3c6e42297

--
Lee Jones [李琼斯]


