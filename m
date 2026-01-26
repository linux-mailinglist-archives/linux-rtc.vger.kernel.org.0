Return-Path: <linux-rtc+bounces-5903-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B19MPnOd2mxlQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5903-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 21:30:49 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3F8D155
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 21:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 496F83018593
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 20:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B6C293B75;
	Mon, 26 Jan 2026 20:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdfYPI3z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909DC38D;
	Mon, 26 Jan 2026 20:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769459443; cv=none; b=uyRsnh6cjRb0C+8hj4iBExMtXctcZFXl0fnHkjCr06rPK3iasp6P2JucWuZZ0mxVRwUCBtR+b+ds1iig6a85DoqvnzWgKHyKgbHZjIucM3EqtXi8WtJ1S/qHpVu7Bhe8xm4laydsWVpNjk6dE5Vc5Ivo3VpVZm++NGhet2mXHK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769459443; c=relaxed/simple;
	bh=nN000fcvcr3Gsy7MUO2F0yasVBsFUSwrKPZkoByhgcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlwOx2Y1ed5anyIT2tEQDI0I4y7bFNnCUfSAUQje+jUZTFrIb8YKvTq6pSbkYGBHm0fouKiiYTEhbKFaDI8KxYJzXqotV7n3TrOVQY3St4hwQeL/RbNbowivtO9WWbWIt+Z1spGp8EkAWg3vsLGSDV4OQ9v6mzScChiPwq4WafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdfYPI3z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E951C116C6;
	Mon, 26 Jan 2026 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769459443;
	bh=nN000fcvcr3Gsy7MUO2F0yasVBsFUSwrKPZkoByhgcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdfYPI3z9PdoLpuxJa5LQGVP1u8Wx7m2OiozgRzLjyd285piix29OUJtkqcOb0ADO
	 ew7AAEddZ8qgLmMNpwFjHwQ5JkX+QxH9diOmpDfjxMMDAvcqM+0e94y2O+aI1+46vn
	 P02Xoz+OtRcIbR9D++MBxjACpKOWXllbUEZ4TNfgZc1yWqGnqdNqA24vVgmo4Wx/we
	 ZVXrCvIQ8jCZR6qCgR+W/YzezG2YWnx8dZ8jsJzQRSZOerlEjnCAMGkNyCguRBZqdR
	 Le5ZD52MVDestPkAfEef6ckYyoiEnYBJsu8GJJYcAI9RekZ8Tm0cebu//+LvmFXHaM
	 YWOy4eUfOpzGQ==
Date: Mon, 26 Jan 2026 20:30:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N
 support
Message-ID: <20260126-carried-herbal-7870e3b55b8e@spud>
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
 <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EqZf9g8z11dVC7HO"
Content-Disposition: inline
In-Reply-To: <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5903-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 6DA3F8D155
X-Rspamd-Action: no action


--EqZf9g8z11dVC7HO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--EqZf9g8z11dVC7HO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfO7QAKCRB4tDGHoIJi
0h9EAQC0McoB0owd4hltuPqbuUKqJ0kfuAPhhvFU2sNcbx8k4wEAgHJq+Sv7epQV
1JyvmRdHWvIRfxKy4M+VwfoHvpR5iAg=
=tIT0
-----END PGP SIGNATURE-----

--EqZf9g8z11dVC7HO--

