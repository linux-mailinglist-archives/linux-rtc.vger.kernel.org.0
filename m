Return-Path: <linux-rtc+bounces-3491-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E28A60C4A
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EAA83A694C
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 08:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE46E1D7985;
	Fri, 14 Mar 2025 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ksC6KD/V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFC1D5149
	for <linux-rtc@vger.kernel.org>; Fri, 14 Mar 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942496; cv=none; b=E1oQTgy5bwZEV/eWJhl9YWL+90ruG5RdBIbLcrfAAEs/7WfmmxRXSATDEQU7kv/z9rlqRXqa7LX8nLGWa2/gkhwsadGbmo4QqFykaTrl9n7/sU2aB8wqTylYLmKUk6Mni9FnuNTLRCYrAMPnleD/bbzvEOolE7hlEMFoA30BQag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942496; c=relaxed/simple;
	bh=MBz1bcRKfsFEVJsDtb3kn690F8mE3rVuQqKJeipJAEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7FwiJtIAgjzz0knMH3lQLlDUD/DsPV+yISKju0DJAYeuRb1J2vLpVxKAVnFjIC4NeZuAtFkbH+aXXVBpZjNx1hTBhla7kQksepEfmqB+66wxmdGUghulp21ACcILzdbST19VNI9fkVj1YcMvbZl90ehPAkXf0fKLs6jTQvPiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ksC6KD/V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MBz1
	bcRKfsFEVJsDtb3kn690F8mE3rVuQqKJeipJAEc=; b=ksC6KD/VkEHRZFqHmU7/
	HiIQ65LBcco5B4+8gxSCukRWK7/d8AumXeVRAWCEhcvB5ewC6zZw3p84kYwYZpvJ
	e2RL9S28tWWEJ9LMEorOPy2txc4vpOwp1i+bl4tupBr3u6orlou6ScuG9zjTqUwd
	uNwK6uXl7TmXf5IiD+pI1dz8xs5+1SjOmfp1kKDFb2a+bP7vwgl6503BrZ1zOJhZ
	U/OqEvqfb3F1kwmgd43f8SIDC/Ro3+PXTECwS+ts82HuFO72Hz54tt/aYZzEV0l7
	WTFmSOFxHSUaGjIEF1v0mH382mkGLVIi+h9SRa+g7r3BPa0vkaMd/Dl1M/sEiGqa
	cQ==
Received: (qmail 1937771 invoked from network); 14 Mar 2025 09:54:43 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Mar 2025 09:54:43 +0100
X-UD-Smtp-Session: l3s3148p1@YZnvlkkwBIUgAwDPXyTHAJp038nK7dx+
Date: Fri, 14 Mar 2025 09:54:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] dt-bindings: rtc: rzn1: add optional second clock
Message-ID: <Z9Pu0_niK4XOThvE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
 <20250313102546.27335-2-wsa+renesas@sang-engineering.com>
 <20250314-sexy-impartial-raccoon-7e8dca@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mVr91rY3i28z2UsX"
Content-Disposition: inline
In-Reply-To: <20250314-sexy-impartial-raccoon-7e8dca@krzk-bin>


--mVr91rY3i28z2UsX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Probably the binding was incomplete and you always had external crystal
> connected. I assume you want to keep old DTS, so it is fine for me:

The documentation explicitly mentions how to wire clock lines if you are
not using the RTC and have no oscillator. But yeah, then the RTC DT node
should be disabled.

And yes, I want to be backwards compatible.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!


--mVr91rY3i28z2UsX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfT7s8ACgkQFA3kzBSg
KbZ54g/9E/ss/oMZht39U/AUfGSpSbVG23K5eKs5d9YgpRYWT17YIt8GexSIHkzm
LZDvDUdzZdhaw/m7C6Nwoxpcx3GkeY3H035uSHrk6thY3T8f4wnK6wh0W53PTBS/
Nn+qmdkFYd7y7vIXDzBzx4xdub1W+KgtHI9lhirwm9YyyuLgbp47vbZlT/PTiInx
oV709O0V2ST7J+5g7rtJ6SZNA9fw5AY5OlomQLc0gkt51/9Zj5R2HApEtxyJE0bC
DSeHLtriUzmR/cMp3nOPlThZa9CwF2zNbUkj+mWoX+/pMkCMJwZD4ufs0Ec5stN8
uP1czuT5KNMnCKpwv8pRyl/n1w9je4CiVSJLHbw7POYYei0iZfYLSevDXRXVWi2R
tRurHrkkItd5/PEY9eYAQsl/aiDGvyZtked7E1pRugW4TFeOxuFoxgxa+IMNEASX
GQ03aBdEIHMkIwWlrrbsDZr4SnLwiLETy/Lfxb2YobBBqNqa+P2y9ROvg2mUzNGw
nSv+qJmsTCs/TOzJohkbeLK5dRuB/+veVXjassrQx1yqWGPsyL6w01vomgPIFiFj
JYeaT6TViE/1j1c6MeOPk5Qy6GL0SQ0HySATyQPAKyruE8K8WbMBmEM9DCSivyeK
QApvCtA5KS8FozFNnCSgzG3fg/235CAg59hQN3ClwX8JzagijiA=
=yk/n
-----END PGP SIGNATURE-----

--mVr91rY3i28z2UsX--

