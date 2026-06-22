Return-Path: <linux-rtc+bounces-6724-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4lm8BawCOWqLlQcAu9opvQ
	(envelope-from <linux-rtc+bounces-6724-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2026 11:38:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD36AE507
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2026 11:38:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CjXT3x7r;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6724-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6724-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830903172845
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2026 09:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD0A367F31;
	Mon, 22 Jun 2026 09:22:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC2356772;
	Mon, 22 Jun 2026 09:22:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120163; cv=none; b=EuT6SDtqR8xG5rYP9sKajdxWcuFS/aNUmB4xcchEIMC4UFR8MpzUuqDQDeYMr5f68rOWwzfcJs03+3TVImhqsYBYcUWm/YjhbiioAYeGirIXXYfIxSPdTcUVSlG/poIER5Hr/7t2J4O1R+/nPe/gWifGJXcT+Mi1SsYivNU2EMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120163; c=relaxed/simple;
	bh=VKNFwSytwg74VUYpbdu2qFD6MyWo+H28DrktbXAWX3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA6DWLQ7md9d4Q1R6NN2HgbFkDQrbaxQqM9NOGtCcGpQWp7wExTIkJc9cV1I5VInyDuUSHLZoTz1C8NoUlw9ATkxQ7WbKaPgUDlofK7Ni4pGGrJosB9I/anBjLWflB0nOk0N0rQpVrbxqAZXSIzJKokQH+CAR4x9YbTYJJhgKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjXT3x7r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFFD1F000E9;
	Mon, 22 Jun 2026 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782120160;
	bh=OX8Qg3owLQqMtg66YL9Ex7vWtY9tEzIXqaglPZAlISY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CjXT3x7rSKIiqvA3AVVBrZ+UUCxxdQNYctgtGv31HzQ10kzjfaqN+y3oGEgnPKvBo
	 5JmbkNIDKeLWUbWo+Jn4yJwUSc65PTui0NrUUOncgXjoeGlvFMiHhl3hw0A8sjOe9r
	 ldM16SemJ/YdbVI+sf2rDi28xDW3Mcbb0xHM1CDtQjlBFZzOWKAwPl7Lefm5nIcrxz
	 TKT4jDqb4EqSpnKuCBWiIOHQEk9sv3/Mu3OA/GW6s5gTqtng+BpBcPtXx2cg7WNQUR
	 F4uq+AcrNYONLd60zyiH0iRBgdBdv1duzQjpRbdBPaFFqsBwj+WLQYKy2S9/VBs54A
	 S8MBb2RWsSvgA==
Date: Mon, 22 Jun 2026 11:22:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] spi: dt-bindings: microchip,pic32mzda-spi: Convert to
 DT schema
Message-ID: <20260622-ingenious-finch-of-fantasy-7bafaf@quoll>
References: <20260617101009.148851-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617101009.148851-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6724-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABAD36AE507

On Wed, Jun 17, 2026 at 03:40:09PM +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 SPI controller devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


