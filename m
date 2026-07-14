Return-Path: <linux-rtc+bounces-6975-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9igVGz2zVmpdAQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6975-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 00:07:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA2759228
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 00:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xk6NTNI9;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6975-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6975-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65913302A202
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 22:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881D230C155;
	Tue, 14 Jul 2026 22:07:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82D286A7;
	Tue, 14 Jul 2026 22:07:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784066875; cv=none; b=Lv9SNWUETSEyXwsuzm/cMTk9xAdk0CUFUSZS4RE27TZNl40neLRysoGEf3OSgut4v/LGDwP5p4/1QZoTcxtrEgjIlRpdI8Zziz0mcj+KuGQzSgABzRPqWDRi9ODpe8v8J1Ei/zndAmUfJHetxn/MA8MBieMEUiKSB8iMhBhPEGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784066875; c=relaxed/simple;
	bh=o9o5p8oHa5PLQEyVxp87E5GRl6EIIJ0LD+bJXieVeRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afgus3MlhwB5Bd7tdt8zh6hStcHEKuUAEf0n5ViVPcD8fczhyvVWvNVKArF6rOMaUh1MHDVCN7z3GxyyB9ZDIhoNAQqRvZ3YcKhXQeLx7sGG/mbOpaoY3WV2a5Z2R9hl6SgfhkBBcneZ3Rab16MzXld04pRyxGcRdwrxuian6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xk6NTNI9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFE61F000E9;
	Tue, 14 Jul 2026 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784066874;
	bh=cCJqnZwrEKY71GXeGxG5qqUI1KURWRmR5Jhm6EFOgGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xk6NTNI93W1VDGFBzrKB8W2DIWncv/N0U5Xlhvw9oNiimw4sKR7y5Q+UQsV/zAa3x
	 V9vpxM22qjuzUS4bW+dK9i9cqY9Dyx36ZQFfSysp0Tq9EBcHnjMRItYz8GP6DWcZ/n
	 yEsDmPBxhxm9of8CeSeQF7GA+VusQjdOOQjTtUV3/N+9xrbTqe1sZrwNhrb449PR78
	 Bmh6KxTuK3JQ9P8fxcOiYpCOPovmt9ettMeHKy29AwCcxdRT4Vc1xG8T7pg7kkWWpq
	 bEtdu8B83mb6vMHVAT/JNCida59N8uJsLxaHFs5Lw0xm65H0xMGF+rTQVg7yXrNtt7
	 jqMgvhHmWt5xw==
Date: Tue, 14 Jul 2026 17:07:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	skhan@linuxfoundation.org, tsbogend@alpha.franken.de,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	me@brighamcampbell.com
Subject: Re: [PATCH v2] dt-bindings: watchdog: microchip,pic32mzda-wdt:
 Convert to DT schema
Message-ID: <178406687202.3036881.4468660016404184803.robh@kernel.org>
References: <20260624055648.127399-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624055648.127399-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6975-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:skhan@linuxfoundation.org,m:tsbogend@alpha.franken.de,m:krzk+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:me@brighamcampbell.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2BA2759228


On Wed, 24 Jun 2026 11:26:48 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Watchdog Timer devicetree binding
> from legacy text format to DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> 
> Changes since v1:
> - Fix example indentation
> - Correct example clock specifier from REF2CLK to LPRCCLK
> 
> Link to v1:https://lore.kernel.org/all/20260620172354.155565-1-challauday369@gmail.com/
> ---
>  .../bindings/watchdog/microchip,pic32-wdt.txt | 18 --------
>  .../watchdog/microchip,pic32mzda-wdt.yaml     | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml
> 

Applied, thanks!


