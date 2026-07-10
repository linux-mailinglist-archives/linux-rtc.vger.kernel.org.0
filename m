Return-Path: <linux-rtc+bounces-6965-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /DBBFqHDUGr94gIAu9opvQ
	(envelope-from <linux-rtc+bounces-6965-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 12:04:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12E7396C3
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 12:04:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AmlA0DMS;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6965-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6965-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 684AB300989E
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1563FD97A;
	Fri, 10 Jul 2026 10:04:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A33FB7D5;
	Fri, 10 Jul 2026 10:04:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677854; cv=none; b=Q99cwR+FF5x7BY3OM6du3gOnvAjKdHfxEjGeMki1pJQmnMTzXL1xM7OFSyVg4+2c0ttAGdq6SenVgYWKTxE4wyiLn2uKv7yoO8/nOEE5kUpnYQir8XlFgvbcInK5lSwU9oBv45tlpnIMJxyzDAvEiXtaMJ9aIEBR8JZTpGt+WNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677854; c=relaxed/simple;
	bh=myr2hbOLvV4Glk4OYuLkZALb0cqqbzsMY1ZSKPWi5ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRgJwz3surtPGewIQoBeuC9LY+svigav7jlxNG6sHfD6WMKQw/gDVT/Zq9p1h+uY1+bhvqoj8X8EqxmPVlBFED9xdxww1VXyw9p4b8LeKWAFqTQNkR0jfnfYHl3Itb4Qvyh8bV8+ce3SKwTniEL2fIrRPBB7C2rNK72JUL0uGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmlA0DMS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002F21F000E9;
	Fri, 10 Jul 2026 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677853;
	bh=aKSzUqY7VUjDJgVWP+6JcuhubmrYAzzO+CgarY7Jr14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AmlA0DMSAQd8NTUOY2XFR/wNHxKVa4xaIrFMloIvLKeD63n6UAwacRLUTEHBtfBH1
	 RCsSPMwETd7vhg9joVxh6X09smd76mcCwgGb8LOjXf9v4nd4MqGr6X2gtiEKge1cGj
	 iswmuTSNIxk2R0PaL7t722VtjM4fTa2cciGkTXcxhVF8bA9VOTFcELTYCEnJMoy328
	 G/Ayq9kRknVvLnME8FTY4Zzod+/23NdAsAMSpF+9HJQjyaOebwutWbT9NG391PunXK
	 QDSjoOwkByJ6tShSExveJJqR/Se5qHTRtVyKTxnMu1JJf/587Le4zkoXyeLxpooI0U
	 2g3lS7eO8sAAQ==
Date: Fri, 10 Jul 2026 12:04:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Teja Sai Charan B <tejaasaye@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Message-ID: <20260710-gentle-defiant-chimpanzee-e910aa@quoll>
References: <20260709221944.159244-1-tejaasaye@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709221944.159244-1-tejaasaye@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6965-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tejaasaye@gmail.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE12E7396C3

On Fri, Jul 10, 2026 at 03:49:44AM +0530, Teja Sai Charan B wrote:
> From: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
> 
> Convert the rtc-cmos devicetree bindings to dt schema.
> 
> The original text binding documents only the motorola,mc146818
> compatible. Existing in-tree Devicetree sources also use the
> intel,ce4100-rtc compatible together with the motorola,mc146818
> fallback, but this was not documented. Document the Intel variant in the
> schema so that these existing configurations are accepted during schema
> validation.
> 
> Signed-off-by: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


