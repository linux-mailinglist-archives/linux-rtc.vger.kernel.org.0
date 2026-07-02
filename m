Return-Path: <linux-rtc+bounces-6875-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlCMHhMkRmp+KgsAu9opvQ
	(envelope-from <linux-rtc+bounces-6875-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:40:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A06F4E34
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:40:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NWybdUAA;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6875-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6875-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0EA7307EA43
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D1D3672B8;
	Thu,  2 Jul 2026 08:29:49 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ADD38AC6A;
	Thu,  2 Jul 2026 08:29:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980989; cv=none; b=fwCpkvUX2DVc5YAencK6evYKUEicrf6qHlS6Tlr0lFfBel11VsE6Y2ifzqM8poknIrIoKyZZ4OMh4ZwjlqI1cglRyBmZtrCPJjNxYd0v4DRanZ8uynkqTlVbGKS2LuDATmL8VNvoP3buR96EGldqmQG3J8yGbYWYkpfB8T7JZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980989; c=relaxed/simple;
	bh=yrMEMX3OmVYWzrymBeazAOguz3dnpqyzjY713ncy3ys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U4oUne2Cw/whV11qM9unBs9mCJSIwQWmbXnPMjfytDI5r5DrYUDyBETFQx7YGsxab5pgG0Eayq9tgCXVZ320H7vUysckzvD3lKvTARvmHLp1kvTJS+tTw/YqmJQxaFctN+4qxZBheKdTva5+h8n2naOlF3O8Qh1767OO09F4BbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWybdUAA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5AD1F000E9;
	Thu,  2 Jul 2026 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980988;
	bh=yrMEMX3OmVYWzrymBeazAOguz3dnpqyzjY713ncy3ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NWybdUAA8Gk8TKPgckOmu36dFMAi3epklCMSRAu2v6/p3OAN7t3MTMc/WuMAgxI9X
	 0E4PcKROHhCE5bYUfsl8vNvXPJ1anMFY56vYv27VhWOkRdBNOVz73SnnHQU4aGA+Hk
	 APqxbfvAZobKs3eTyuYDJtnjN3NA3TDwren5C3DNG6CSZu914xV8I4gsU0HjRHh8oT
	 YIHp6rq8YNTIlhUcBqScRQGUEPCmtb+DzytqnDXEzetFvOTxjU+/WU/JAI/vGpljC3
	 2SikaoCikKUEVQJAjNfIV5O412CGwAKOSLvCLcPNUll/HnXTATbJwrkP58qw+6vxdR
	 x47OyoUzFWThw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] clk: sunxi-ng: sun6i-rtc: add a733 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-a733-rtc-v3-8-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-8-eb2580374de6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 08:29:47 +0000
Message-Id: <20260702082947.9B5AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6875-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-sunxi@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 088A06F4E34

> Add support for the sun60i a733 CCU RTC.
>=20
> Compared to the a523, this SoC has a different input oscillator divider
> which auto-detects the oscillator rate and select a divider to provide
> a fixed 32768Hz clock. It also provides several phy reference clocks
> with dedicated clock gates.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-a733-rtc-v=
3-0-eb2580374de6@baylibre.com?part=3D8


