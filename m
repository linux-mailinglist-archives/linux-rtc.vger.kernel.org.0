Return-Path: <linux-rtc+bounces-6519-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SxvrHaFfB2oy0wIAu9opvQ
	(envelope-from <linux-rtc+bounces-6519-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 20:02:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD976555CB6
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 20:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EFFC316AEDE
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 17:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C2B3D813E;
	Fri, 15 May 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8t1oLyL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120834B183;
	Fri, 15 May 2026 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865364; cv=none; b=qSZfAf6U/Xw3u6o0hs9Z7Alx2co+ElLRvZUz1Y2tzRwSc71ndIQ8a2Nas+3hyBUQfUMZUohY8VHbKU+XB1IJrSC41pq52ze4uDQia66TY42Bm4yiMdavlYXMOvcccl+EZ8mhGIbqDTdjTN29xMItRPWUWscguiZjb38fFO9lIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865364; c=relaxed/simple;
	bh=i8idn8H9HrZ9zikdnhtR4vW/A6+lT+Lu667jMNTNSzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTSGNQ6uR3an/P+gzwfzgayumVxtevX3+ZEvdGvGPbMf8b7+dbpdNn8wgYvcyC0c6RcJY9cp2tfrPUd0D304Vi24GietWI6LoRwA+6XG82//iDuGkRIgFYNHQqt1Njd+4C1qC5/hiulwSoT8jlUx5I+pvU7Gmhx9s8Aa3UIs+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8t1oLyL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A764C2BCB3;
	Fri, 15 May 2026 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865363;
	bh=i8idn8H9HrZ9zikdnhtR4vW/A6+lT+Lu667jMNTNSzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8t1oLyLw9i0bV2+LIAxdoZI2cp9tEHtfEAhWZifrVS549qCdsUfhNe3KXAdDYVke
	 kbKNQpwbzFsfSQXeQAgAXaZavx/Lou8daywkv3uCSK0Qxr6WQIagCnOngCrL/3MxPA
	 EndRU0mu2/ulOiBrI/eurN3yp4x9KPOfUTrxxdorX2Dau3kiRSN02aEaZoa0fZOKJV
	 mCYF08gWN2a5Zff2x4Htpb1GdfEHc99E4WrA5B6jc3YxcQYN+A6HAq/n8xh30GDFG5
	 ciIBlw+jjK7TA+DWnLVieA5JR/FABqTIR5mmcEuqYy9ooDIYDlrpYbe5tR20djT9Ck
	 3fXiQv8ueYE6g==
Date: Fri, 15 May 2026 18:15:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nam Tran <trannamatk@gmail.com>,
	=?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 02/11] dt-bindings: extcon: document Samsung S2M
 series PMIC extcon device
Message-ID: <20260515-mutable-urgency-305fecf3ffc4@spud>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
 <20260515-s2mu005-pmic-v6-2-1979106992d4@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lKNSi/QIFdgUPR11"
Content-Disposition: inline
In-Reply-To: <20260515-s2mu005-pmic-v6-2-1979106992d4@disroot.org>
X-Rspamd-Queue-Id: CD976555CB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6519-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,disroot.org:email]
X-Rspamd-Action: no action


--lKNSi/QIFdgUPR11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 04:08:58PM +0530, Kaustabh Chakraborty wrote:
> Certain Samsung S2M series PMICs have a MUIC device which reports
> various cable states by measuring the ID-GND resistance with an internal
> ADC. Document the devicetree schema for this device.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lKNSi/QIFdgUPR11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdUzQAKCRB4tDGHoIJi
0ikJAQD8WkCIgSdf8UfUNAswa/AfHGZsFpJUqN9s8+XJXvQuDwD+IsAoeb4QTJCz
CNcs/VFeH5Rwv9mL7y7G0wVc6It0ZAM=
=2pni
-----END PGP SIGNATURE-----

--lKNSi/QIFdgUPR11--

