Return-Path: <linux-rtc+bounces-5292-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C0C412FB
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 19:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EE744EA322
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 18:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D50338F26;
	Fri,  7 Nov 2025 18:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZTC95pI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393C338920;
	Fri,  7 Nov 2025 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538521; cv=none; b=Xuy79W8tWpRKPLPorr3ylkbFkbzbVY5YhHj8FfuTpL5mnKcEiUQXH2aV5/4l2KB4e1336qse8Mb83PTzg3MXwLG576+6ZlOwfvTcAs8Sbj/LLB4IsZmHFy3kUNo+xL30G1gJkie/QA9FEcvRxU7epgru8k+UhE+VZZu8yPnVks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538521; c=relaxed/simple;
	bh=YkRmQIYkcTprlgy67p/k7ehs0uFagTPL+8qBO3Jnixw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be16aADsgvgGiIq5daJ0ZzvBHQRf6agiIEgevVU8XX6UY/m+jZUE6ZreYa9PUN0IZAav0AzkBMxc36KHc3gV3JcRFDVKARDyqmYjRxZsKh06H6M6uXJ9IulnaacTC776UwkoTc/fQfk934rEXNhGQcb6SKYJRngVc1MTU94Dopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZTC95pI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8E5C16AAE;
	Fri,  7 Nov 2025 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762538520;
	bh=YkRmQIYkcTprlgy67p/k7ehs0uFagTPL+8qBO3Jnixw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZTC95pIJhDjFKpoNrpd2RebkiH3ND0VrNDzjymooGUxxMX8zyVaoEWGMNbH80kIJ
	 Tqnu0MN9bqGpG8vI0GXO4owhvBU2Poz7i2YAfnD0dCak4lOWte94w8NFB8cNPB6Xvp
	 pbp5vodn7e+B+x/04zoNsYQwIUbHHs9B9QtPjECKpins4wWUgvsC5cWtP9H0STJRHd
	 xbE6TpVRHlbLiG49DCk48b+WPLtXL+Hw+1P2emiQP+5bI3cGxrqyKn77seXnuUb/Bt
	 L6Y6hFnXvtUKrjLqaD97mSNCOlnqPlCxs8OGDdaazTcNoN3WvLqyOWQDFN9d9fj9jO
	 zt+SHjMyLE4rQ==
Date: Fri, 7 Nov 2025 18:01:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	pankit.garg@nxp.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v5 1/2] dt-bindings: rtc: Add pcf85053 support
Message-ID: <20251107-pediatric-disarray-606e4ed1f0f6@spud>
References: <20251107132618.2246407-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BD6S94VbneSRHgST"
Content-Disposition: inline
In-Reply-To: <20251107132618.2246407-1-lakshay.piplani@nxp.com>


--BD6S94VbneSRHgST
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2025 at 06:56:17PM +0530, Lakshay Piplani wrote:
> +  nxp,write-access:
> +    type: boolean
> +    description: |
> +      Request the driver to claim write ownership at probe time by setting
> +      CTRL.TWO=1. This property is only valid when nxp,interface="primary".
> +      The driver will not modify any other CTRL bits (HF/DM/etc.) and will not
> +      clear any status/interrupt flags at probe.

I'm sorry for not noticing this before, can you please remove the
commentary about linux driver specific stuff from here? Probably needs
to be something like "Indicates that write ownership of the RTC can be
should be claimed by setting CTRL.TWO. This property is only valid when
acting as the primary interface (nxp,interface = "primary")" or
something along those lines.

--BD6S94VbneSRHgST
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ40EwAKCRB4tDGHoIJi
0i8wAQDIikffREGZeQeAj0d/sZ+0WN4ou57bbo7efjcuc9eP3QEAszEjP1LQ5L4Y
1qoHuWUmjSagI126w/dnUIVsMsLkrQQ=
=THb7
-----END PGP SIGNATURE-----

--BD6S94VbneSRHgST--

