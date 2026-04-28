Return-Path: <linux-rtc+bounces-6442-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id muNaAuhM8GncRQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6442-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 08:00:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 921A747DD32
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 08:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B57143020AA1
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC2033F8C6;
	Tue, 28 Apr 2026 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsAgBtff"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAE2E5B21;
	Tue, 28 Apr 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777356005; cv=none; b=OTj7uqKBetug23evYY8Df4XyLL2p2TgY6+rDxTsc8L8jtodIz/fJ99X18zKAeBP5GoqkTWZZQ/mQDLfas47bUsHXjB9ETP9/ItnrnH85L0ab4Mp4SH+h6/HGjsp+lk9X2ucbvbNQI3e0E/a+13eh5OoUrmvxGjslsrX/mSTg4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777356005; c=relaxed/simple;
	bh=eI1lt4QmD2i531JZciYQQXa42LvA228/bB3kvxT5YYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5XG22ak7yM0TDFRpy0Oog/FyYZQdzPvSdw1xOEgJns7O2RPGvgqUO5+VC8e3O9tI0K1gtjEKXJvMRj+mT3/XHndF0s5dQzdM9ZX6pQOYJBrl5e4irAzBroSBUKU1mSpwxQVZQtVeB9MNWH+w3Bt2wzcViJeIrcPAEljK2QKVJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsAgBtff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3674AC2BCAF;
	Tue, 28 Apr 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777356004;
	bh=eI1lt4QmD2i531JZciYQQXa42LvA228/bB3kvxT5YYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsAgBtffZz5gwO4JY4gQsJ0+Mo8GSbS67z4Bosv4imV+6i07brNf8FcAEbJSxetpf
	 YdB15OSP6FU4N3XvOYTojgJObkyAQigPffSoBk9FkXei9NoRx0Xh2v+MUUm++ks41A
	 ACt8AIe0UyrlAuUQGS0asPfg28RRSV8gCDcIh4RtEyQ8AgfXScZo1UJABEqIUgXOfG
	 ZP/VLV24HcEqeMzckbltFu6KPnIjp2a82BCp3fhGJD8I1shDMfOSwf0DTX/LDWMHS/
	 VWEh/rJpXa+1DHmxD4CICMNt4MzKwWnVoyvmwlKE4qLLMtkCkpm9cbx544oVfrE2bD
	 yusBFoxQkVf3g==
Date: Tue, 28 Apr 2026 08:00:02 +0200
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
Subject: Re: [PATCH v5 02/11] dt-bindings: extcon: document Samsung S2M
 series PMIC extcon device
Message-ID: <20260428-blond-meerkat-of-gaiety-4bfed4@quoll>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-2-fcbc9da5a004@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-s2mu005-pmic-v5-2-fcbc9da5a004@disroot.org>
X-Rspamd-Queue-Id: 921A747DD32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6442-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,disroot.org:email,qualcomm.com:email]

On Fri, Apr 24, 2026 at 01:09:01AM +0530, Kaustabh Chakraborty wrote:
> Certain Samsung S2M series PMICs have a MUIC device which reports
> various cable states by measuring the ID-GND resistance with an internal
> ADC. Document the devicetree schema for this device.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/extcon/samsung,s2mu005-muic.yaml      | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


