Return-Path: <linux-rtc+bounces-6622-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a2c+IUINH2p8egAAu9opvQ
	(envelope-from <linux-rtc+bounces-6622-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 19:05:06 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6318630802
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 19:04:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eqn5sFCk;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6622-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6622-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7890300BCA0
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 17:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EE738CFE8;
	Tue,  2 Jun 2026 17:00:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26893750B9;
	Tue,  2 Jun 2026 17:00:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419603; cv=none; b=llH94rzdBuvPq+/mcEx4LRILNBvHh1BODG3viRNutAsr1j4v/ddB3Q6D2S8yKZJ9vv2q4/10pzxDRuqHGf1UD3/tIqUeHmiljn4Buj+nfH/zQEs7+roQ3j19g2gagYvzUeOF7PxKACzuoiSdgHHxI1iFKBj4RVJpLNRb5E0lmKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419603; c=relaxed/simple;
	bh=aXEL4pwfPMVz7iJb43Gvy4V5PhxsUFD/gCBxQEtwy8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj7tsHw3/zZu+dI97TUQI/5JQ/iCrVG65Rd3zBH4Jii4/I7cPH+4zv70EhgIg9oPc96YMMS+QIQWkX57puc1xIVPC2qk2iVmFLjc3VLVmOp8xmC6IBeHQD2NEMo+sOLZhE5OI1kpRjddQLwn6sEStpZD8smaw5yEPDBD8mqTaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqn5sFCk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A6B1F00893;
	Tue,  2 Jun 2026 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419602;
	bh=aXEL4pwfPMVz7iJb43Gvy4V5PhxsUFD/gCBxQEtwy8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqn5sFCk9Gvk5MQ7a/oBBQ1+0KnpNVzVsNgERJHir3cW8slvMQ+h7DfI5X3owfXWD
	 yaoVqBHOnyep+/kld0J65qgMHBPo8MxXdXBzXcRPgP0f666v/1lXt2hemMLszNKK5o
	 bSOqyunDtFpKXL9T3vZwPHr3zV4+T7wiXsDr5DQeeubDFYlxh9zAr5ICEhwEMI5CGP
	 RstELcE6izDm6itOOogAcqL766P6clMh5X/O6NnSaUrnTKdGK3dYR20jtq5Zu4Pa44
	 eDr1YobTBhfQ/QCxqw4JxlpO0VvDONJv11f8L0FzBTdeeRGcF9zkckWecb/xveAOgz
	 tGNlOtjyzw7zw==
Date: Tue, 2 Jun 2026 17:59:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add ASPEED AST2700 compatible
Message-ID: <20260602-refresh-crawling-e6852feb9dcb@spud>
References: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
 <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sSlNZiJes0XynWvQ"
Content-Disposition: inline
In-Reply-To: <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6622-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:tommy_huang@aspeedtech.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,spud:mid,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6318630802


--sSlNZiJes0XynWvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sSlNZiJes0XynWvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MDQAKCRB4tDGHoIJi
0srpAQC+gmj4JJGrXIWGVt27womZpP49QqQ/L1k3k5X9ws77DAEAt4Hn4w2ksqmf
SI39dQOHYZ0+bCvn00VuAoOoxWr/Bww=
=kyAk
-----END PGP SIGNATURE-----

--sSlNZiJes0XynWvQ--

