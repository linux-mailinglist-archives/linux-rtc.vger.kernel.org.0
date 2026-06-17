Return-Path: <linux-rtc+bounces-6684-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fr12KWpOMmqxyQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6684-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:36:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3366973A1
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:36:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UMY3aLD8;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6684-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6684-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E74CA301725E
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 07:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64B43BE632;
	Wed, 17 Jun 2026 07:36:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE43343888;
	Wed, 17 Jun 2026 07:35:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681761; cv=none; b=CbxQZPD3JCAR3sQYhc3vX8CXWyq7TQgPHJavCX8jmCilrFs6ZJx9ZCNJF6rkEgBkxinUEpZwZG9b2Sgzucf6MjhJjb0KkOYw/NxAEbRv+wfeo79HsmL5jouPF3wNypZmN5UB0R2X4TcwQtq11ccKUVnJKF4GlIs4l/bBn5FEo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681761; c=relaxed/simple;
	bh=q4q1F0NNpI77rXiBXg5zU6lXgWiTEcYn1LrobGbCeT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7hXi1gghIi0KlByAv2hOrU0KYBfDFoHzxfvQucnl3kvbJz0K+juLleeSRxobnp8/WEpBANkkGbDoWxCixzKmT5PUlBskeb/Tf5hiVLkDwWEdMuTDSLR+cEDzDEEbuGDlONSSQrkzW3MJNd/xkV0dl2TYTdm+njmNbu17LccEzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMY3aLD8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1B61F00A3F;
	Wed, 17 Jun 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781681756;
	bh=o7nW/o13W7aX/64mvZuviZ5KnGOMo+uuiOYrlIZO+ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMY3aLD8K0BbqTJyqZYJ7BoEeT0KK3JJECqpdBRCxM2Ysbyk1pToRl/GfLqRw+9Ev
	 GLStl8TyTcKx2Sn6A/kpLxn4QgyYUkPH/3BbkCAkzPo2BxBrWvcLugRKMyJbwdxj+S
	 W4zF+ekff14WcMH5IbiT1gwSa1qAabVmLCiR5i7a05U3S8bSoJxKWjT4qakBjK0q42
	 6tIJhId+NuC88RIykxR6WPjV+v63Upu5SLRHLg83gXFaGn2dyCKby4ibe6yVMiXlz7
	 8XRd1amdbJxAbKl56SLLZDfo4B0bEUI0bB8VwhxvJuET3fUaKHElN5ns5dSus7po1R
	 c1AgASXbJyjqQ==
Date: Wed, 17 Jun 2026 09:35:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] spi: dt-bindings: microchip,pic32mzda-spi: Convert to
 DT schema
Message-ID: <20260617-sturdy-silver-bison-bfb6ba@quoll>
References: <20260615115311.515404-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615115311.515404-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6684-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B3366973A1

On Mon, Jun 15, 2026 at 05:23:11PM +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 SPI controller devicetree binding
> from legacy text format to DT schema.

Please mention here that you dropped requirement of 'cs-gpios' because
it is not a mandatory in hardware design nor in current Linux driver...
and then CHECK it actually against drivers, which will lead you to
conclusion that maybe it is wrong decision...

> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v1:
> - Rename schema file to microchip,pic32mzda-spi.yaml
> - Update subject prefix to match SPI DT binding conventions

Best regards,
Krzysztof


