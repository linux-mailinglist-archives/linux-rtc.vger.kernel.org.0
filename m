Return-Path: <linux-rtc+bounces-5804-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJH1GX/Hb2mgMQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5804-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 19:20:47 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FCA49587
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 19:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6958886845C
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 17:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0093F075B;
	Tue, 20 Jan 2026 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keykpx/v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DD3EDAC3;
	Tue, 20 Jan 2026 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930126; cv=none; b=OH2vIhGhr/uTXCcbOxGI7h8gg3TDiON19fQUax10K5F3Jk4gQz1Iha1Cx3EpkIS2UQa61BEnBp1iveFGjCFksDTImGXyJPSvw2qJ3FdCwEiusL8lcdl0WiiSgpuH0F0gzsGU0rCLJSAF5nIW3UN78UbzBRsL6MLeXCdsZV2Y5TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930126; c=relaxed/simple;
	bh=pKqgymuhOO8QU0VzDgLr0JkEV8uZG6qELdsZ1cmjOgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nApgsIBQInvVpJgUD/X7yytvs+jaetSaC6aAnEOC6HVNSycDZKmVKyDFCKuhsmVerJiEhT3XqjGcTGqbHG4HVy/xN5huP9haVFTtQ586TyHCy05N6OXem833JTFZFAH9UM0n52vGbeUAMhUF85FyRXS0AGuz8paCrRiKSEyaV38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keykpx/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8B1C16AAE;
	Tue, 20 Jan 2026 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930126;
	bh=pKqgymuhOO8QU0VzDgLr0JkEV8uZG6qELdsZ1cmjOgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=keykpx/vECCN+pqOoWY1lTAiYX+7xg4gW9QpTqmyfWn7w/ACBEKhaChEVG4fy7esW
	 UBs94g2xaq2EOnCjboLjJkSiufHceHnMN5JMYJihx+5fJM+Sczmh2DoF9AnKLlq1r2
	 ++Fg1aloDAdYxtC71CG8DgiTYBVVx41/C3+80zndLWO1jQKTG1UwsxNpigK1H5EahW
	 iDMtMiG8LeZoZWtazVpp0Sx4z/2nu567xutTO7QVr951kGMtYWKk1dyNb4uujivfKz
	 an6/IJOieE3oTRZW702rM5nH2aOmpKGO0qTFOAkTk/fLYjJV9/zfdKqLLPbr1kbtin
	 vLu98yb3kO/Tw==
Date: Tue, 20 Jan 2026 17:28:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	tools@kernel.org, users@kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <916995f4-60e0-47dc-abdb-8819089d103c@sirena.org.uk>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
 <176892415694.2292562.7457528145774108517.b4-ty@kernel.org>
 <20260120155241.GG1354723@google.com>
 <e9bde783-42f3-4f28-9a5e-aa65f36db9ca@sirena.org.uk>
 <20260120172405.GI1354723@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5C+JAuLDUkP13/M9"
Content-Disposition: inline
In-Reply-To: <20260120172405.GI1354723@google.com>
X-Cookie: Slippery when wet.
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5804-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 35FCA49587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5C+JAuLDUkP13/M9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 05:24:05PM +0000, Lee Jones wrote:
> On Tue, 20 Jan 2026, Mark Brown wrote:

> > If you fetch a series but don't delete it from the database then (with
> > b4 ty -d) then b4 will remember it and if any commits in what gets
> > applied match it'll generate a mail for b4 ty -a.  Usually that's when
> > some commits didn't get changed.

> The last attempt to apply this failed with conflicts.

> I wonder why b4 stored that as a success?

Are you using b4 shazam?  I wonder if under the hood it's a mailbox
fetch then an apply.  I download a mailbox then script my own
application after the fact so it's not so surprising that it happens for
me, b4 knows nothing about the patches actually being applied until I
tell it to go look to send thanks.

--5C+JAuLDUkP13/M9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvu0gACgkQJNaLcl1U
h9BQ4gf/XS3VtYI5SKVmR5yt/y9gEltvUnMufTkTSFHl1BIop9/1VCqW+0k6lE/k
DHhUhX8WVpflfrtZZFXtw6Vb95kv+eicMQJcNaTJOL/P6MV0gjr7G87Ad+RPFiDh
TbBJr8VdEKNlKHUawvtSN1wAzJTnAhC+DQmcfg9NXriQ7Eu5Q4TIyLbzYKtDqXtn
DEkW36O/LCTpvfh7uF9TLwco7K+s2Te/O6zxtFwRY+JO3fNPpl9CiRzb1CZ6jcVs
+ZQpixL7YAwGBB3fhTiO3JLIEoYnnoT5cO3UbQq2WvW+RKZDJoQCk8nJL3xKgKAB
BRy0DaghPpF60fODGw4z9BSazWMROA==
=dEjf
-----END PGP SIGNATURE-----

--5C+JAuLDUkP13/M9--

