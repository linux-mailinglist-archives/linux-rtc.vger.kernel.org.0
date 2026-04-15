Return-Path: <linux-rtc+bounces-6334-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK0yLTM432nAQQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6334-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 09:03:15 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D454012E0
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 09:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7DA13031ECA
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2026 07:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E30439B4BE;
	Wed, 15 Apr 2026 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qagzsw/G"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6460A39A059;
	Wed, 15 Apr 2026 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236589; cv=none; b=VfsnZx9vHrx5DoRIfdzRgY9qqE7/TfaBV6wZbtA6yGWyFPYbIrDAWSmAEXJmW5T81hU0msIAHBjFmXNYghvURyPAZ/+5CxMMCAUoflfmxmH+zT1HrP4fXaGbEZqkWwLbH3PYBplNjYnsIqk3UEYD9Rp0LW++s2s4kseQzOxrWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236589; c=relaxed/simple;
	bh=A6xYpGKAm4YWq1q2d+qVyrsufYXmANaYso0Fpfc6hbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZxE2OygeSL7lATL7rkXPpLOBU5CTVGvWD9bf4Z4nNns1x1OQpN2ltEvCEKppWLAwjm9B0v6xibSMNKVFKMKR9baSABOvZSR0JWRYn4CEHWHwRT3kAWERHocnuV+eBU4hF/QlAEMogVYdJbEtoCx9hM0Go7T9+6WbI3k8fdzNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qagzsw/G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE4BC19424;
	Wed, 15 Apr 2026 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776236589;
	bh=A6xYpGKAm4YWq1q2d+qVyrsufYXmANaYso0Fpfc6hbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qagzsw/GS2DXfaqbiZw2FjaOEopavs9TSqqmJMgfFif3scL/ouPdi9+O8UD38xf1F
	 hBKJQUEe7ELxMnYg2vxfoZKIYf8Z2jvpoQOODFZBbsN9Npz25OejBUj9OoQh4tVW+1
	 IzHtcTC7Z94iYFt6AmPvr17rV7FO4t2zCgyaxRzAHnmF7fJUX1zdTFTHukC0LUM+Ox
	 Zo/RCRPtjPcpALr+rNWWnrYDucT1A74zrI9D+P1GK77ijj8LmKBDZcflwdEJh52Pzk
	 Va2stT3DMxcI+gbYY7VqvQyFAtMfL/vgxTbAVlXMfcv3o91ImFfwlRvNhrZ8TK6YR5
	 xyhkB6q2RYxgw==
Date: Wed, 15 Apr 2026 09:03:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Nam Tran <trannamatk@gmail.com>, =?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 02/13] dt-bindings: leds: document Samsung S2M series
 PMIC RGB LED device
Message-ID: <20260415-sensible-kiwi-of-argument-44d6ed@quoll>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-2-7fe7480577e6@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-s2mu005-pmic-v4-2-7fe7480577e6@disroot.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6334-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94D454012E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:02:54PM +0530, Kaustabh Chakraborty wrote:
> +description: |
> +  The Samsung S2M series PMIC RGB LED is a three-channel LED device with
> +  8-bit brightness control for each channel, typically used as status
> +  indicators in mobile phones.
> +
> +  This is a part of device tree bindings for S2M and S5M family of Power
> +  Management IC (PMIC).
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +allOf:
> +  - $ref: common.yaml#

Rob's comment is still valid:
1. How do you address one of three LEDs in non-RGB case?
2. Where is multi-color?

And based on this alone without other properties, I say this should be
part of top-level schema.  Separate node is fine, but no need for
separate binding.

Best regards,
Krzysztof


